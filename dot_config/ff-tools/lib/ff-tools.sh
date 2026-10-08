#!/usr/bin/env bash
set -euo pipefail

# Common helpers for ff-tools scripts (bash).

ff_log() { [[ "${FF_DEBUG:-0}" == "1" ]] && printf 'DEBUG: %s\n' "$*" >&2 || true; }
ff_die() { printf 'ERROR: %s\n' "$*" >&2; exit 1; }

ff_need_cmd() { command -v "$1" >/dev/null 2>&1 || ff_die "missing required command: $1"; }

ff_trim() {
  # stdin -> trimmed output (strip leading/trailing whitespace + trailing CR)
  sed -e 's/\r$//' -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'
}

ff_is_firefox_running() {
  pgrep -x firefox >/dev/null 2>&1 || pgrep -x firefox-bin >/dev/null 2>&1
}

ff_assert_firefox_not_running() {
  if ff_is_firefox_running; then
    ff_die "Firefox is running. Close it first."
  fi
}

ff_file_has_noncomment_lines() {
  [[ -f "$1" ]] || return 1
  grep -Eq '^[[:space:]]*[^#[:space:]]' "$1"
}

ff_cutoff_epoch_us_days_ago() {
  local days="${1:?days}"
  python - <<PY
import datetime as d
days = int("$days")
cutoff = d.datetime.now(d.timezone.utc) - d.timedelta(days=days)
print(int(cutoff.timestamp() * 1_000_000))
PY
}
