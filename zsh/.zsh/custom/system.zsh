# update repos, upgrade packages without confirmation,
# remove no longer needed packages and cooresponding config files
alias up="sudo apt update && sudo apt upgrade -y && sudo apt autoremove --purge"

# dmesg with timestamps
alias dmesg="sudo dmesg -T"

# edit fuzzy found file. usage: 'find <file>'
alias find="fzf -m --preview=\"batcat --color=always {}\" --bind \"enter:become(${EDITOR:-vi} {})\" -q"

# kitty ssh
alias s="kitten ssh"

alias kittyupdate='curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin'

alias q="exit"

