dstask_due_offset='1 month' # due date cutoff for `tcdue` context filter

task() {
  if [[ $@ == "" ]]; then
      /usr/bin/dstask show-open
  else
      /usr/bin/dstask "$@"
  fi
}
task-add() {task add "$@" && task}
task-add-project() {taskwrap add-project "$@"}
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

# context
task-context() {task context "$@" && task}
task-context-default() {task-context -office -lisp -cad}
task-context-due() {task-context due.before:$(date -d 'now + '$dstask_due_offset +%F)}
task-context-project() {task-context -office -lisp -cad project:"$@"}
task-context-office() {task-context +office}
task-context-none() {task-context none}

#fzf integration
task-search() {
  local task_id
  task_id=$(\
    task \
    | jq '.[] | "\(.id)\t\(.project)\t\(.summary)\t\(.due)\t\(.notes)"' \
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
      --preview 'echo "Notes:\n"{5}' \
      --preview-window=up:wrap \
      --preview-label-pos=1:top \
      --bind 'focus:transform-preview-label:echo \|\|Project: {2} \| Summary: {3} \| Due: $(date -d {4} +%a\ %D)\|\|' \
    | sed 's/^\([0-9]*\).*/\1/'\
  )
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
    --tmux
  }

taskwrap() {
  local subcommand=$1
  shift

  if [[ $# -eq 0 ]]; then
    case $subcommand in
      add-project)
        print -z "task-add-project $(task-search-project) " ;;
      edit)
        taskcommand="edit" ;;
      modify)
        taskcommand="modify details"
        print -z "task-modify $(task-search) " ;;
      note)
        taskcommand="edit notes" ;;
      start)
        taskcommand="start" ;;
      stop)
        taskcommand="stop" ;;
      done)
        taskcommand="mark done" ;;
      remove)
        taskcommand="remove" ;;
      *)
        taskcommand="" ;;
    esac
    if [[ $subcommand != "modify" && $subcommand != "add-project" ]]; then
      task $subcommand $(task-search) && task
    fi
  else
    case $subcommand in
      add-project) task add project:"$@" && task ;;
      *) task $subcommand "$@" && task ;;
    esac
  fi
}

