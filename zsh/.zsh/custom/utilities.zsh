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

# dstask
alias task="/usr/bin/dstask show-open"
ta() {/usr/bin/dstask add "$@" && task}
te() {/usr/bin/dstask edit "$@" && task}
tm() {/usr/bin/dstask modify "$@" && task}
tn() {/usr/bin/dstask note "$@" && task}
ts() {/usr/bin/dstask start "$@" && task}
tst() {/usr/bin/dstask stop "$@" && task}
td() {/usr/bin/dstask done "$@" && task}
tl() {/usr/bin/dstask log "$@" && task}
# dstask context
tc() {/usr/bin/dstask context "$@" && task}
tcd() {tc -office -lisp -cad}
tco() {tc +office}
tcn() {tc none}

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
