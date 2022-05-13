#### Completion System ####

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Use completion menu when available.
zstyle ':completion:*' menu select=2 eval "$(dircolors -b)"

# Match dircolors with completion schema.
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Auto update when new program is installed.
zstyle ':completion:*' rehash true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}'

# Speed up completions.
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $ZDOTDIR/.zcache

setopt COMPLETE_IN_WORD # Attempt to start completion from both ends of a word.
setopt GLOB_COMPLETE # Don't insert anything resulting from a glob pattern, show completion menu.
setopt NO_LIST_BEEP # Don't beep on an ambiguous completion.
setopt LIST_PACKED # Try to make the completion list smaller by drawing smaller columns.

# Speed up completion system loading.
# https://gist.github.com/ctechols/ca1035271ad134841284?permalink_comment_id=2894219#gistcomment-2894219
_zpcompinit_custom() {
  setopt extendedglob local_options
  autoload -Uz compinit
  local zcd=${ZDOTDIR:-$HOME}/.zcompdump
  local zcdc="$zcd.zwc"
  # Compile the completion dump to increase startup speed, if dump is newer or doesn't exist,
  # in the background as this is doesn't affect the current session.
  if [[ -f "$zcd"(#qN.m+1) ]]; then
        compinit -i -d "$zcd"
        { rm -f "$zcdc" && zcompile "$zcd" } &!
  else
        compinit -C -d "$zcd"
        { [[ ! -f "$zcdc" || "$zcd" -nt "$zcdc" ]] && rm -f "$zcdc" && zcompile "$zcd" } &!
  fi
}

_zpcompinit_custom
