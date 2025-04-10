# GNU Stow
alias unstow="stow -D"

# neovim
alias vi="nvim"

# use batcat on debian or bat on other systems instead of cat
if command -v batcat &> /dev/null; then
    alias cat="batcat"
  elif command -v bat &> /dev/null; then
    alias cat="bat"
  else
    alias cat="cat"
fi

