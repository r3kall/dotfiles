# Aliases

## Core
alias sudo="sudo "
alias vim="nvim"
alias v="nvim"

alias ls="ls -AFN --group-directories-first --color=auto"
alias ll="ls -Alh --group-directories-first --color=auto"
alias ..="cd .."
alias ...="cd ../.."

alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

alias aliases="cat $ZDOTDIR/config/05-aliases.zsh"


## pacman
alias pacfull="sudo reflector -c Italy,Germany -p https -f 15 --save /etc/pacman.d/mirrorlist && sudo pacman -Syyu"
alias pacup="sudo pacman -Syuq"
alias pacrm="sudo pacman -Rnsq"
alias pacin="sudo pacman -Sq --needed"
alias pacorphans="sudo pacman -Rns $(pacman -Qtdq)"
alias pache="sudo paccache -rvuk0 && sudo paccache -rv"


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

                
## git
alias dot="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
