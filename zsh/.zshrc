# uncomment the next line for debug mode
# set -x

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim
export BAT_THEME_LIGHT="ansi"
export BAT_THEME_DARK="Visual Studio Dark+"
export BAT_THEME="ansi"

ZSH_THEME="risto"

ENABLE_CORRECTION="true"

plugins=(
	git
	colored-man-pages
	alias-finder
	command-not-found
	qrcode
	sudo
)

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

source $ZSH/oh-my-zsh.sh

# ls icons
alias ls="lsd"

autoload -U add-zsh-hook
add-zshjook -Uz chpwd () { la; }
