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

source $ZSH/oh-my-zsh.sh

autoload -U add-zsh-hook
add-zshjook -Uz chpwd () { la; }
