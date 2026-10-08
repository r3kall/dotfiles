#!/usr/bin/env bash
# utils.sh — common utility functions
# Usage: source utils.sh

set -o errexit
set -o pipefail
set -o nounset

###############################################################################
# Config (override via env before sourcing or after)
###############################################################################
: "${LOG_LEVEL:=info}"  # debug|info|warn|error
: "${LOG_NO_COLOR:=0}"  # 1 disables color
: "${LOG_TIMESTAMP:=1}" # 1 enables timestamps
: "${LOG_FILE:=}"       # if set, append logs to file
: "${NOTIFY_APP_NAME:=$(basename "$0")}"
: "${NOTIFY_DEFAULT_URGENCY:=normal}"

###############################################################################
# Internal helpers
###############################################################################
_is_tty() { [[ -t 2 ]]; }

_color_on() {
  [[ "${LOG_NO_COLOR}" != "1" ]] && _is_tty
}

_now_ts() {
  # ISO-like local time
  date '+%Y-%m-%d %H:%M:%S'
}

_level_num() {
  case "$1" in
  debug) echo 10 ;;
  info) echo 20 ;;
  warn) echo 30 ;;
  error) echo 40 ;;
  *) echo 20 ;;
  esac
}

_should_log() {
  local want cur
  want="$(_level_num "${1}")"
  cur="$(_level_num "${LOG_LEVEL}")"
  [[ "$want" -ge "$cur" ]]
}

_write_log_line() {
  local line="$1"
  # stderr
  printf '%s\n' "$line" >&2
  # optional file
  if [[ -n "${LOG_FILE}" ]]; then
    mkdir -p "$(dirname -- "${LOG_FILE}")" 2>/dev/null || true
    printf '%s\n' "$line" >>"${LOG_FILE}"
  fi
}

###############################################################################
# Logging
###############################################################################
log_debug() { _log debug "$*"; }
log_info() { _log info "$*"; }
log_warn() { _log warn "$*"; }
log_error() { _log error "$*"; }

_log() {
  local level="$1"
  shift || true
  _should_log "$level" || return 0

  local msg="$*"
  local prefix="[$(printf '%-5s' "$level")]"

  if [[ "${LOG_TIMESTAMP}" == "1" ]]; then
    prefix="$(_now_ts) $prefix"
  fi

  if _color_on; then
    case "$level" in
    debug) prefix=$'\033[2m'"$prefix"$'\033[0m' ;;  # dim
    info) prefix=$'\033[1m'"$prefix"$'\033[0m' ;;   # bold
    warn) prefix=$'\033[33m'"$prefix"$'\033[0m' ;;  # yellow
    error) prefix=$'\033[31m'"$prefix"$'\033[0m' ;; # red
    esac
  fi

  _write_log_line "$prefix $msg"
}

die() {
  log_error "$*"
  exit 1
}

###############################################################################
# Command / dependency helpers
###############################################################################
command_ex() { command -v "$1" >/dev/null 2>&1; }

command_req() {
  local cmd="$1"
  if ! command_ex "$cmd"; then
    local msg="Required command '$cmd' was not found in PATH."
    notify "Missing Command" "$msg" "critical" || true
    log_error "$msg"
    return 1
  fi
}

###############################################################################
# Notifications (libnotify)
###############################################################################
notify() {
  local title="${1:-Notification}"
  local message="${2:-}"
  local urgency="${3:-$NOTIFY_DEFAULT_URGENCY}"

  if command_ex notify-send; then
    notify-send \
      --urgency="$urgency" \
      --app-name="$NOTIFY_APP_NAME" \
      "$title" \
      "$message"
  else
    # fallback
    log_warn "notify-send not found: $title - $message"
    return 1
  fi
}

notify_err_alt() {
  local message="${1:-}"
  local app_name="${2:-$NOTIFY_APP_NAME}"
  local urgency="${3:-$NOTIFY_DEFAULT_URGENCY}"

  NOTIFY_APP_NAME=$app_name notify "E-R-R-O-R" "$message" "$urgency"
  return 1
}

notify_miss_alt() {
  local cmd="${1:-}"
  local app_name="${2:-$NOTIFY_APP_NAME}"
  local urgency="${3:-$NOTIFY_DEFAULT_URGENCY}"

  if ! command_ex "$cmd"; then
    NOTIFY_APP_NAME=$app_name notify "M-I-S-S-I-N-G" "Install $cmd first." "$urgency"
    return 1
  fi
}

###############################################################################
# Shell safety & cleanup helpers
###############################################################################
# Run cleanup actions on exit (success or failure)
# Usage:
#   on_exit 'rm -f "$tmp"'
_on_exit_stack=()
on_exit() { _on_exit_stack+=("$*"); }
_run_on_exit() {
  local i
  for ((i = ${#_on_exit_stack[@]} - 1; i >= 0; i--)); do
    eval "${_on_exit_stack[$i]}" || true
  done
}
trap _run_on_exit EXIT

# Create temp file/dir with automatic cleanup
mktemp_file() {
  local f
  f="$(mktemp)"
  on_exit "rm -f -- '$f'"
  printf '%s\n' "$f"
}
mktemp_dir() {
  local d
  d="$(mktemp -d)"
  on_exit "rm -rf -- '$d'"
  printf '%s\n' "$d"
}

###############################################################################
# Retry helper
###############################################################################
# Usage: retry 5 2 command args...
# Retries N times, sleeping S seconds between tries.
retry() {
  local tries="$1"
  shift
  local sleep_s="$1"
  shift
  local n=1
  until "$@"; do
    if [[ "$n" -ge "$tries" ]]; then
      log_error "Command failed after $tries attempts: $*"
      return 1
    fi
    log_warn "Attempt $n/$tries failed: $* (retrying in ${sleep_s}s)"
    sleep "$sleep_s"
    n=$((n + 1))
  done
}

###############################################################################
# File/path helpers
###############################################################################
ensure_dir() { mkdir -p -- "$1"; }
is_readable_file() { [[ -f "$1" && -r "$1" ]]; }
is_executable_file() { [[ -f "$1" && -x "$1" ]]; }

###############################################################################
# Arch Linux helpers
###############################################################################
# Check if a package is installed (by name)
pacman_installed() {
  command_req pacman || return 1
  pacman -Qq "$1" >/dev/null 2>&1
}

# Check if a package exists in repos
pacman_available() {
  command_req pacman || return 1
  pacman -Si "$1" >/dev/null 2>&1
}

# Install packages using pacman
pacman_install() {
  local pkgs=("$@")
  sudo pacman -S --needed --noconfirm "${pkgs[@]}"
}

# Ensure packages installed
ensure_pacman_packages() {
  local missing=()
  local p
  for p in "$@"; do
    if ! pacman_installed "$p"; then
      missing+=("$p")
    fi
  done

  if ((${#missing[@]} > 0)); then
    log_warn "Missing packages: ${missing[*]}"
    notify "Missing packages" "Installing: ${missing[*]}" "normal" || true
    pacman_install "${missing[@]}"
  else
    log_debug "All packages already installed: $*"
  fi
}

# Detect common AUR helpers (if installed)
aur_helper() {
  if command_ex yay; then
    echo yay
    return 0
  fi
  if command_ex paru; then
    echo paru
    return 0
  fi
  if command_ex pikaur; then
    echo pikaur
    return 0
  fi
  return 1
}

aur_install() {
  local helper
  helper="$(aur_helper)" || die "No AUR helper found (yay/paru/pikaur)."
  "$helper" -S --needed --noconfirm "$@"
}

ensure_aur_packages() {
  local helper
  helper="$(aur_helper)" || die "No AUR helper found (yay/paru/pikaur)."

  # Most AUR helpers support querying installed packages via pacman anyway,
  # but we’ll just attempt install with --needed.
  log_info "Ensuring AUR packages via $helper: $*"
  "$helper" -S --needed --noconfirm "$@"
}

###############################################################################
# Nice-to-have: user interaction
###############################################################################
confirm() {
  # Usage: confirm "Question?"  (returns 0 yes, 1 no)
  local prompt="${1:-Are you sure?} [y/N] "
  read -r -p "$prompt" reply
  case "${reply,,}" in
  y | yes) return 0 ;;
  *) return 1 ;;
  esac
}

require_root_or_sudo() {
  if [[ "$(id -u)" -eq 0 ]]; then
    return 0
  fi
  sudo -v
}

###############################################################################
# Nice-to-have: run command with logging
###############################################################################
run() {
  # Usage: run cmd args...
  log_info "Running: $*"
  "$@"
}

###############################################################################
# Nice-to-have: error context
###############################################################################
_on_err() {
  local exit_code=$?
  log_error "Error at ${BASH_SOURCE[1]}:${BASH_LINENO[0]} (exit $exit_code)"
  notify "Script error" "Error at ${BASH_SOURCE[1]}:${BASH_LINENO[0]} (exit $exit_code)" "critical" || true
  exit "$exit_code"
}
trap _on_err ERR
