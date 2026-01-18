_fzfhelp_menu() {
  if [ $# -lt 1 ]; then
    echo "Usage: $0 <command> [<query>] [<extra list items>]" >&2
    return 1
  fi

  local cmd="$1"
  local query="$2"
  shift 2 # remove first two arguments

  local commands selected extra

  # get list of commands from help output
  commands=(${(@f)"$(
    $cmd --help \
    | sed \
      -e '1,/:/d' \
      -e '/Options:/,$ d' \
      -e 's/.*://' \
      -e '/^\s*$/d' \
      -e 's/^\s*\(\S*\)\s*\(.*\)$/\1\t\2/'
  )"})

  # add any extra commands passed as arguments
  for extra in "$@"; do
    commands+=("$extra")
  done

  selected=$(
    printf "%s\n" "${commands[@]}" \
    | fzf \
        --height=40% \
        --border \
        --reverse \
        --delimiter="\t" \
        --with-nth=1 \
        --preview='echo {2}' \
        --preview-window=top:2:wrap \
        --prompt="Select $cmd command to run: " \
        --query="$query" \
        --select-1 \
      | sed 's/^\(\w*\)\s*.*/\1/'
  )
  if [ -n "$selected" ]; then
    echo "$selected"
  fi
}
