khalbin="$(which khal)"
[[ -x $khalbin ]] || { echo "khal not found in PATH. Please install khal and ensure it's in your PATH." >&2; return 1; }

cal() {[[ -z $@ ]] && $khalbin calendar || calwrap "$@"}
alias ical="cal interactive"

calwrap() {
  case $1 in
    new) [[ $# == 1 ]] && $khalbin $1 -i || $khalbin "$@" ;;
    help) $khalbin --help ;;
    *) $khalbin "$@" ;;
  esac
}
