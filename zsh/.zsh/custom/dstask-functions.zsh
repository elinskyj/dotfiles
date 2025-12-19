dstask_due_offset='1 month' # due date cutoff for `tcdue` context filter
dstaskbin="$(which dstask)"

task() {
  if [[ $@ == "" ]]; then
      $dstaskbin show-open
  else
      $dstaskbin "$@"
  fi
}
tasklist=$(task)
task-add() {task add "$@" && task}
task-add-project() {taskwrap add-project "$@"}
task-add-template() {taskwrap add-template "$@"}
task-edit() {taskwrap edit "$@"}
task-modify() {taskwrap modify "$@"}
task-note() {taskwrap note "$@"}
task-start() {taskwrap start "$@"}
task-stop() {taskwrap stop "$@"}
task-done() {taskwrap done "$@"}
task-remove() {taskwrap remove "$@"}
task-log() {task log "$@" && task}
task-projects() {
  if [[ $@ == "" ]]; then
    task show-projects
  else
    task project:"$@"
  fi
}
task-templates() {
  if [[ $@ == "" ]]; then
    task show-templates
  else
    task template "$@"
  fi
}

# context
task-context() {task context "$@" && task}
task-context-default() {task-context -office -lisp -cad "$@"}
task-context-due() {task-context due.before:$(date -d 'now + '$dstask_due_offset +%F) "$@"}
task-context-project() {task-context-default project:"$@"}
task-context-office() {task-context +office "$@"}

#fzf integration
task-search() {
  local task_id
  task_id=$(\
    jq '.[] | "\(.id)\t\(.project)\t\(.summary)\t\(.due)\t\(.notes)"' <<<"$tasklist" \
    | sed -e 's/\"\(.*\)"/\1/' -e 's/\\t/\t/g' \
    | fzf \
      --border=rounded \
      --prompt="Select task to $taskcommand: " \
      --height ~40% \
      --layout=reverse \
      --delimiter='\t' \
      --with-nth=2..3 \
      --exact \
      --multi \
      --select-1 \
      --preview 'echo "Notes:\n"{5}' \
      --preview-window='up:wrap,<5(right,wrap)' \
      --preview-label-pos=1:top \
      --bind 'focus:transform-preview-label:echo \|\|Project: {2} \| Summary: {3} \| Due: $(date -d {4} +%a\ %D)\|\|' \
    | sed 's/^\([0-9]*\).*/\1/'\
  )
  tasklist=$(task)
  if [[ -n $task_id ]]; then
    echo "$task_id"
  fi
}

task-search-project() {
  task-projects \
    | jq -r '.[].name' \
    | fzf \
    --border=rounded \
    --prompt="Select project: " \
    --height ~40% \
    --layout=reverse \
    --exact \
    --bind enter:accept-or-print-query \
    --tmux
  }

taskwrap() {
  local subcommand=$1
  local defsearch=1
  tasklist=$(task)
  shift

  if [[ $# -eq 0 ]]; then
    case $subcommand in
      add-project)
        local defsearch=0
        print -z "task-add-project '$(task-search-project)' " ;;
      add-template)
        local defsearch=0
        taskcommand="duplicate"
        tasklist="$(task show-templates)"
        print -z "task add template:$(task-search) " ;;
      edit)
        taskcommand="edit" ;;
      modify)
        local defsearch=0
        taskcommand="modify details"
        print -z "task-modify $(task-search) " ;;
      note)
        taskcommand="edit notes" ;;
      start)
        taskcommand="start" ;;
      stop)
        tasklist="$(task show-active)"
        taskcommand="stop" ;;
      done)
        taskcommand="mark done" ;;
      remove)
        taskcommand="remove" ;;
      *)
        taskcommand="" ;;
    esac
    if [[ $defsearch == 1 ]]; then
      task $subcommand $(task-search)
    fi
    task

  else
    case $subcommand in
      add-project) task add project:"$@" && task ;;
      add-template)
        tasklist="$(task show-templates)"
        print -z "task add "$@" template:$(task-search) " ;;
      *) task $subcommand "$@" && task ;;
    esac
  fi
}

check_id() {
  local id="$1"
  local ids
  ids="$(jq -r '.[].id' <<<"$(tcn && task show-templates)")"

  if grep -qxF "$id" <<<"$ids"; then
    echo "ID '$id' exists in the list."
    return 0
  else
    echo "ID '$id' not found."
    return 1
  fi
}
