## Prompt definition
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Allow functions in the prompt
setopt PROMPT_SUBST
autoload -Uz colors && colors

## starship prompt
eval "$(starship init zsh)"
