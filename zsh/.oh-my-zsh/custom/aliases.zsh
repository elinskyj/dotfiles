# custom command aliases

# ---------------------------------------------------------------------------------------
# system

# update repos, upgrade packages without confirmation, remove no longer needed packages and cooresponding config files
alias up="sudo apt update && sudo apt upgrade -y && sudo apt autoremove --purge"

alias clr="clear; echo Currently logged in on $TTY, as $USERNAME in directory $PWD."

# automatically create parent directories if they don't exist
alias mkdir="mkdir -p"

alias dmesg="sudo dmesg"

# use bat instead of cat
alias cat="batcat"

# edit fuzzy found file
alias find="fzf -m --preview=\"batcat --color=always {}\" --bind \"enter:become(${EDITOR:-vi} {})\" -q"

# search command history (hg [partial command])
alias hg="history | grep"
alias q="exit"

# ssh
alias s="kitten ssh"

# ---------------------------------------------------------------------------------------
# oh-my-zsh

alias zshrc="${EDITOR:-vi} ~/.zshrc"
alias aliases="${EDITOR:-vi} ~/.oh-my-zsh/custom/aliases.zsh"

# search aliases (ag [partial command or alias])
alias ag="alias | grep"

# ---------------------------------------------------------------------------------------
# git
alias gcu="git reset HEAD~"

# ---------------------------------------------------------------------------------------
# misc
# weather report
alias weather="curl 'wttr.in/?M'"
alias weather2="curl 'v2.wttr.in/?M'"
