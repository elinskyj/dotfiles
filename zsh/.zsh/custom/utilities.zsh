# theme chooser
alias themel="~/.oh-my-zsh/tools/theme_chooser.sh -l | less"
alias themes="~/.oh-my-zsh/tools/theme_chooser.sh -s | less"

# wallust palette
alias palette="wallust run -sT \"$HOME/.config/hypr/wallpaper_effects/.wallpaper_current\""

# GNU Stow
alias unstow="stow -D"

# neovim
alias vi="nvim"

# tmux
alias t=tmux_auto

# disk usage
alias duhs="du -hx | sort -hr | less"

# use batcat on debian or bat on other systems instead of cat
if command -v batcat &> /dev/null; then
    alias cat="batcat"
  elif command -v bat &> /dev/null; then
    alias cat="bat"
  else
    alias cat="cat"
fi

# fastfetch
alias ff="clear && fastfetch"
