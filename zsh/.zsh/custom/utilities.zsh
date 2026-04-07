# theme chooser
alias themel="~/.oh-my-zsh/tools/theme_chooser.sh -l | less"
alias themes="~/.oh-my-zsh/tools/theme_chooser.sh -s | less"

# wallust palette
alias palette="wallust run -sT '$HOME/.config/hypr/wallpaper_effects/.wallpaper_current'"

# GNU Stow
alias unstow="stow -D"

# neovim
alias vi="nvim"

# tmux
alias t=tmux_auto

# disk usage
alias duh="du -hxd 1 | sort -hr"
alias duhs="du -hx | sort -hr | less"

# use batcat on debian or bat on other systems instead of cat
[[ -n $(command -v batcat) ]] && CATCOMMAND="${CATCOMMNAND:-batcat --color always}"
[[ -n $(command -v bat) ]] && CATCOMMAND="${CATCOMMAND:-bat}"
alias cat="${CATCOMMAND:-cat}"

# fastfetch
alias ff="clear && fastfetch"
