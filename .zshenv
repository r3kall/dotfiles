# env vars to set on login, zsh settings in ~/config/zsh/.zshrc
source $HOME/.config/shell/env

# bootstrap .zshrc to ~/.config/zsh/.zshrc, any other zsh config files can also reside here
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export STARSHIP_CACHE="$XDG_CACHE_HOME/starship.cache"
export STARSHIP_LOG="$XDG_CACHE_HOME/starship.log"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# path export
typeset -U path PATH
path=(~/.local/bin $XDG_CONFIG_HOME/scripts $path)
export PATH
