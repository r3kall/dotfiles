# Aliases

## Core
alias sudo="sudo "
alias vim="nvim"
alias v="nvim"
alias ls="ls -AFN --group-directories-first --color=auto"
alias ll="ls -Alh --color=auto"
alias up="cd ../"
alias mkdir="mkdir -p"
alias grep="grep -i --color=auto"
alias rm="rm -rf"
alias cp="cp -r"
alias aliases="cat $ZDOTDIR/config/05-aliases.zsh"


## pacman
alias pacup="sudo pacman -Syu"
alias pacrm="sudo pacman -Rns"
alias pacin="sudo pacman -S --needed"
alias pacorphans="sudo pacman -Rns $(pacman -Qtdq)"
alias pache="sudo paccache -rvuk0 && sudo paccache -rv"
function pacwildrm() { sudo pacman -Rns $(pacman -Qsq $1) }  # $1 is a 'regex'


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
