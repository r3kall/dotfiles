# env vars to set on login, zsh settings in ~/config/zsh/.zshrc
source $HOME/.config/shell/env.sh

# bootstrap .zshrc to ~/.config/zsh/.zshrc, any other zsh config files can also reside here
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export STARSHIP_CACHE="$XDG_CACHE_HOME/starship.cache"
export STARSHIP_LOG="$XDG_CACHE_HOME/starship.log"

# path export
typeset -U path PATH
path=(~/.local/bin $XDG_CONFIG_HOME/scripts $path)
export PATH
