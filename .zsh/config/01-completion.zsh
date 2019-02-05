#█▓▒░ completion system
autoload -U compinit
compinit -d $XDG_DATA_HOME/zsh/zcompdump

zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2 eval "$(dircolors -b)" # Use completion menu for completion when available.
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} # Match dircolors with completion schema.
zstyle ':completion:*' rehash true # When new programs is installed, auto update without reloading.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

setopt COMPLETE_ALIASES # Prevent aliases from being substituted before completion is attempted.
setopt COMPLETE_IN_WORD # Attempt to start completion from both ends of a word.
setopt GLOB_COMPLETE # Don't insert anything resulting from a glob pattern, show completion menu.
setopt NO_LIST_BEEP # Don't beep on an ambiguous completion.
setopt LIST_PACKED # Try to make the completion list smaller by drawing smaller columns.
# setopt MENU_COMPLETE # Instead of listing possibilities, select the first match immediately.
