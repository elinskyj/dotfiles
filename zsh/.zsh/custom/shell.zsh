# Editor shortcuts
alias zshrc="${EDITOR:-vi} ~/.zshrc"

# edit aliases in $ZSH_CUSTOM
ae() {
    ls $ZSH_CUSTOM | fzf --preview="batcat $ZSH_CUSTOM/{} --color always" --layout=reverse --cycle --border -m\
      --prompt="Select alias to edit: " --header="Aliases in $ZSH_CUSTOM"\
      --bind "change:unbind(one),enter:become(${EDITOR:-vi} $ZSH_CUSTOM/{+}),one:become(${EDITOR:-vi} $ZSH_CUSTOM/{+})" -q " $@"
}

# search aliases (ag [partial command or alias])
ag() {
  eval $(alias | fzf --border --prompt='Select alias to run: ' -1 -q " $@" | cut -d'=' -f1)
}

# search command history (hg [partial command])
alias hg="history | grep"
