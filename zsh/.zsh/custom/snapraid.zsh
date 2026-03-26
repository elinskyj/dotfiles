alias srrconf="sudoedit /root/snapraid-runner/snapraid-runner.conf"
alias srconf="sudoedit /etc/snapraid.conf"
alias sr="snapraid_fzf"

snapraid_fzf() {
  local extra=(
      $'help\tShow help information'
      $'log\tShow snapraid logs'
    ) # append extra commands

  local selected=$(_fzfhelp_menu "snapraid" "$1" "${extra[@]}")
  if [ -n "$selected" ]; then
    case "$selected" in
      help)   snapraid --help ;;
      fix)    sudo snapraid fix -e ;;
      log)    less +G < /var/log/snapraid.log ;;
      scrub)  print -z "sudo snapraid scrub --plan {{PLAN}} {{--older-than DAYS}}" ;;
      diff)   less < <(sudo snapraid diff) ;;
      *)      sudo snapraid "$selected" ;;
    esac
  fi
}
