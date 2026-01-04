# Editor shortcuts
alias zshrc="${EDITOR:-vi} ~/.zshrc"
alias so="source ~/.zshrc"

# edit aliases in $ZSH_CUSTOM
ae() {
  unsetopt correct
  find $ZSH_CUSTOM -maxdepth 1 -type f \
  | fzf \
    --border \
    --reverse \
    --cycle \
    --multi \
    --delimiter='/' \
    --with-nth=6 \
    --prompt="Select alias(es) to edit: " \
    --header="Aliases in $ZSH_CUSTOM"\
    --bind "change:unbind(one),enter:become(${EDITOR:-vi} {+}),one:become(${EDITOR:-vi} {+})" \
    --preview="$CATCOMMAND {}" \
    --preview-window=bottom \
    --query " $@"
  setopt correct
}

# search aliases (ag [partial command or alias])
ag() {
  unsetopt correct
  eval $(alias | fzf --border --prompt='Select alias to run: ' -1 -q " $@" | cut -d'=' -f1)
  setopt correct
}

# edit dotfiles
dote() {
  unsetopt correct
  find $HOME/dotfiles -type f -not -path '*/.git/*' -not -name '.' -not -name '..'\
  | fzf \
    --border \
    --reverse \
    --cycle \
    --multi \
    --delimiter='/' \
    --with-nth=5.. \
    --prompt="Select dotfile(s) to edit: " \
    --header="Dotfiles in $HOME/dotfiles"\
    --bind "change:unbind(one),enter:become(${EDITOR:-vi} {+}),one:become(${EDITOR:-vi} {+})" \
    --preview="$CATCOMMAND {}" \
    --preview-window=bottom \
    --query " $@"
  setopt correct
}

fzf-man-widget() {
  manpage="echo {} | sed 's/\([[:alnum:][:punct:]]*\) (\([[:alnum:]]*\)).*/\2 \1/'"
  batman="${manpage} | xargs -r man | col -bx | $CATCOMMAND --language=man --plain --theme=\"Monokai Extended\""
    man -k . | sort \
    | awk -v cyan=$(tput setaf 6) -v blue=$(tput setaf 4) -v res=$(tput sgr0) -v bld=$(tput bold) '{ $1=cyan bld $1; $2=res blue $2; } 1' \
    | fzf  \
      -q "$1" \
      --ansi \
      --tiebreak=begin \
      --prompt=' Man > '  \
      --preview-window '50%,rounded,<50(up,85%,border-bottom)' \
      --preview "${batman}" \
      --bind "enter:execute(${manpage} | xargs -r man)" \
      --bind "alt-c:+change-preview(cht.sh {1})+change-prompt(ﯽ Cheat > )" \
      --bind "alt-m:+change-preview(${batman})+change-prompt( Man > )" \
      --bind "alt-t:+change-preview(tldr --color=always {1})+change-prompt(ﳁ TLDR > )"
  zle reset-prompt
}
# `Ctrl-Alt-h` keybinding to launch the widget
bindkey '^[^h' fzf-man-widget
zle -N fzf-man-widget
