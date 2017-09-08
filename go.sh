create() {
    DIR=$(pwd)
    echo "alias $1=\"cd $DIR\"">>${BASH_SOURCE[0]}
    alias "$1"="cd $DIR"
}

alias gobender="cd /usr/share/bender"
alias goycui="cd /home/alexander/yourcuinfo"
alias goshare="cd /usr/share"
