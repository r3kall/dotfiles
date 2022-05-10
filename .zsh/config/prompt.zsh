## Prompt

# Allow functions in the prompt
setopt PROMPT_SUBST
autoload -Uz colors && colors

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## Alacritty title
if [[ "${TERM}" != "" && "${TERM}" == "alacritty" ]]
then
    precmd()
    {
        # append the current directory (%~), substitute home directories with a tilde.
        print -Pn "\e]0;alacritty %~"
    }

    #preexec()
    #{
    #    # output current executed command with parameters
    #    echo -en "\e]0;$(id --user --name)@${HOST}"
    #}
fi

## starship prompt
eval "$(starship init zsh)"
