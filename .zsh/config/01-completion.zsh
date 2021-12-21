## Completion system
autoload -U compinit
compinit -d $ZDOTDIR/zcompdump

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

## Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $ZDOTDIR/zcache

# setopt COMPLETE_ALIASES # I HATE THIS OPTION, IT SHOULD BE BANNED!!
setopt COMPLETE_IN_WORD # Attempt to start completion from both ends of a word.
setopt GLOB_COMPLETE # Don't insert anything resulting from a glob pattern, show completion menu.
setopt NO_LIST_BEEP # Don't beep on an ambiguous completion.
setopt LIST_PACKED # Try to make the completion list smaller by drawing smaller columns.
# setopt MENU_COMPLETE # Instead of listing possibilities, select the first match immediately.
