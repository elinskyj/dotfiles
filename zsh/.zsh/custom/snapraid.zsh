alias sr="snapraid_fzf"

snapraid_fzf() {
  local extra=(
      $'help\tShow help information'
      $'log\tShow snapraid logs'
      $'config\tEdit snapraid configuration files'
    ) # append extra commands

  local selected=$(_fzfhelp_menu "snapraid" "$1" "${extra[@]}")
  [[ -n "$selected" ]] && \
    case "$selected" in
      help)   snapraid --help ;;
      fix)    sudo snapraid fix -e ;;
      log)    less +G < /var/log/snapraid.log ;;
      scrub)  print -z "sudo snapraid scrub --plan {{PLAN}} {{--older-than {{DAYS}}}}" ;;
      diff)   less < <(sudo snapraid diff) ;;
      config) snapraid_conf_fzf ;;
      *)      sudo snapraid "$selected" ;;
    esac
}

snapraid_conf_fzf() {
  local files=(
    "/etc/snapraid.conf"
    "/root/snapraid-runner/snapraid-runner.conf"
  )

  local selected_file=$(
    printf '%s\n' "${files[@]}" \
      | fzf \
        --height=~10 \
        --border \
        --reverse \
        --prompt="Select configuration file to edit: " \
        --query="$1" \
  )

  [[ -n "$selected_file" ]] && sudoedit "$selected_file"
}
