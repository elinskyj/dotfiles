dstask_due_offset='1 month' # due date cutoff for `tcdue` context filter

task() {
  if [[ $@ == "" ]]; then
      /usr/bin/dstask show-open
  else
      /usr/bin/dstask "$@"
  fi
}
ta() {task add "$@" && task}
tap() {task add project:"$@" && task}
te() {task edit "$@" && task}
tm() {task modify "$@" && task}
tn() {task note "$@" && task}
ts() {task start "$@" && task}
tst() {task stop "$@" && task}
td() {task done "$@" && task}
trm() {task remove "$@" && task}
tl() {task log "$@" && task}
tp() {
  if [[ $@ == "" ]]; then
    task show-projects
  else
    task project:"$@"
  fi
}

# context
tc() {task context "$@" && task}
tcd() {tc -office -lisp -cad}
tcdue() {tc due.before:$(date -d 'now + '$dstask_due_offset +%F)}
tcp() {tc -office -lisp -cad project:"$@"}
tco() {tc +office}
tcn() {tc none}

