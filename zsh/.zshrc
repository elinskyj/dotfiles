# uncomment the next line for debug mode
# set -x

# initialize oh-my-zsh if it's not already installed
setopt dotglob
if [[ ! -e "$HOME/dotfiles/zsh/.oh-my-zsh" ]]; then
  git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/dotfiles/zsh/.oh-my-zsh"
  chmod +x "$HOME/dotfiles/zsh/.oh-my-zsh/oh-my-zsh.sh"

  for item in "$HOME/dotfiles/zsh/"*; do
    target="$HOME/$(basename "$item")"
    if [[ ! -e "$target" ]]; then
      ln -s "$item" "$target"
    fi
  done
fi
setopt dotglob

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.zsh/custom"
export EDITOR=nvim
export BAT_THEME_LIGHT="ansi"
export BAT_THEME_DARK="Visual Studio Dark+"
export BAT_THEME="ansi"
export PATH="$PATH:/snap/bin"
source <(/usr/bin/dstask zsh-completion)

ZSH_THEME="agnoster"

ENABLE_CORRECTION="true"

plugins=(
	git
  colored-man-pages
  docker
  docker-compose
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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

tmux_auto() {
  if command -v tmux &> /dev/null && [[ -z "$TMUX" ]]; then
    session_count=$(tmux list-sessions 2>/dev/null | wc -l)
    if [[ "$session_count" -eq 1 ]]; then
      tmux attach
    elif [[ "$session_count" -gt 1 ]]; then
      tmux attach\; choose-tree -wZ
    else
      tmux new-session
    fi
  fi
}

tmux_auto
fastfetch
