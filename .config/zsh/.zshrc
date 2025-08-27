# 0. PROFILING (OPTIONAL: check at the end of file)
# zmodload zsh/zprof

# 1. COMPINIT
# https://gist.github.com/ctechols/ca1035271ad134841284?permalink_comment_id=2894219#gistcomment-2894219
_zpcompinit_custom() {
  setopt extendedglob local_options
  autoload -Uz compinit
  local zcd="$XDG_CACHE_HOME/zsh/.zcompdump"
  local zcda="$zcd.augur"
  local zcdc="$zcd.zwc"
  local zcd_ttl=12 # hours
  # Compile the completion dump to increase startup speed, if dump is newer or doesn't exist,
  # in the background as this is doesn't affect the current session.
  if [[ (! -e "$zcda") || -f "$zcda"(#qN.mh+${zcd_ttl}) ]]; then
    compinit -i -d "$zcd"
	touch "$zcda"
  else
    compinit -C -d "$zcd"
  fi

  if [[ -s "$zcd" && (! -s "$zcdc" || "$zcd" -nt "$zcdc") ]]; then
	[[ -e "$zcdc" ]] && mv -f "$zcdc" "$zcdc.old"
	zcompile -M "$zcd" &!
  fi
}
_zpcompinit_custom

# 2. PROMPT
# Allow functions in the prompt.
setopt PROMPT_SUBST
autoload -Uz colors add-zsh-hook && colors

function xterm_title_precmd () {
	print -Pn -- '\e]2;%n@%m %~\a'
	[[ "$TERM" == 'screen'* ]] && print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-}\e\\'
}

function xterm_title_preexec () {
	print -Pn -- '\e]2;%n@%m %~ %# ' && print -n -- "${(q)1}\a"
	[[ "$TERM" == 'screen'* ]] && { print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-} %# ' && print -n -- "${(q)1}\e\\"; }
}

if [[ "$TERM" == (Eterm*|kitty*|alacritty*|aterm*|gnome*|konsole*|kterm*|putty*|rxvt*|screen*|tmux*|xterm*) ]]; then
	add-zsh-hook -Uz precmd xterm_title_precmd
	add-zsh-hook -Uz preexec xterm_title_preexec
fi

# Starship prompt.
eval "$(starship init zsh)"

# 3. PLUGINS
_defer_load() {
  # Plugins
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  ZSH_AUTOSUGGEST_STRATEGY=(history)
  ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=32
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  
  autoload -Uz bracketed-paste-magic url-quote-magic
  zle -N bracketed-paste bracketed-paste-magic
  zle -N self-insert url-quote-magic

  # Lazy-load
  # NOTE: possible add of yarn or others
  if [ -r /usr/share/nvm/init-nvm.sh ]; then
    load_nvm() { source /usr/share/nvm/init-nvm.sh; }
    node() { load_nvm; unfunction node; command node "$@"; }
    npm()  { load_nvm; unfunction npm;  command npm  "$@"; }
    npx()  { load_nvm; unfunction npx;  command npx  "$@"; }
  fi

  add-zsh-hook -d precmd _defer_load
}
add-zsh-hook -Uz precmd _defer_load

# 4. COMPLETION
#   # ls_colors
eval "$(dircolors -b 2>/dev/null || true)"

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Use completion menu when available.
zstyle ':completion:*' menu select=2

# Match dircolors with completion schema.
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Auto update when new program is installed.
zstyle ':completion:*' rehash true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}'

# Speed up completions.
zstyle ':completion:*' accept-exact true
zstyle ':completion:*' accept-exact-dirs true
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/.zcache

setopt COMPLETE_IN_WORD # Attempt to start completion from both ends of a word.
setopt GLOB_COMPLETE # Don't insert anything resulting from a glob pattern, show completion menu.
setopt NO_LIST_BEEP # Don't beep on an ambiguous completion.
setopt LIST_PACKED # Try to make the completion list smaller by drawing smaller columns.

# 5. HISTORY
# http://zsh.sourceforge.net/Doc/Release/Options.html#History
HISTFILE="$XDG_CACHE_HOME/zsh/.zhistory"
HISTSIZE=8192
SAVEHIST=8192

setopt BANG_HIST               # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY        # Save each command's epoch timestamps and the duration in seconds.
setopt HIST_EXPIRE_DUPS_FIRST  # Expire duplicate entries first when trimming history.
setopt HIST_FIND_NO_DUPS       # Don't display a line previously found.
setopt HIST_IGNORE_DUPS        # Don't record an entry that is duplicate of the previous event.
setopt HIST_IGNORE_SPACE       # Don't record an entry starting with a space.
setopt HIST_REDUCE_BLANKS      # Remove superfluous blanks before recording an entry.
setopt HIST_FCNTL_LOCK         # Locking is done by means of the system’s fcntl call, when available. 
setopt APPEND_HISTORY          # Append to the history file when the shell exits.
setopt SHARE_HISTORY           # Share history between all sessions.

# 6. KEYBINDINGS
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
zmodload zsh/terminfo 2>/dev/null || true
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete
[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# History Keybindings
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# 7. MISC
[ -f "$XDG_CONFIG_HOME/shell/alias" ] && source "$XDG_CONFIG_HOME/shell/alias"

# 0. PROFILING (OPTIONAL: check at start of file)
# zprof
