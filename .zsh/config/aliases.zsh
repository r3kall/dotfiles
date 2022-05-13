# Aliases

## Core
alias sudo="sudo "
alias vim="nvim"
alias v="nvim"

alias cat="bat --theme OneHalfDark"
alias ls="exa -Fa --group-directories-first --color=auto"
alias ll="exa -la --group-directories-first --color=auto"
alias ..="cd .."

alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

alias aliases="bat --theme OneHalfDark $ZDOTDIR/config/aliases.zsh"


## youtube-dl

# download video or video playlist(prefer mp4 format)
alias ytv="youtube-dl --external-downloader aria2c \
                      --external-downloader-args '-c -j 4 -s 4 -x 4 -k 4M' \
                      --yes-playlist \
                      -f 'best[ext=mp4]/best' \
                      -o '%(title)s.%(ext)s'"

# download audio or audio playlist (m4a or mp3)
alias yta="youtube-dl --yes-playlist \
                      -x -f 'bestaudio[ext=m4a]/bestaudio[ext=mp3]' \
                      -o '%(title)s.%(ext)s'"

                
## Dotfiles
alias dot="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
