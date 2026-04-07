FZF_DOCKER_DEFAULT_OPTS=("--height=~40%" "--border" "--reverse" "--cycle" "--multi" "--no-sort")
DOCKER_DIR="$HOME/docker"

docker_fzf() {
  local extra=(
      $'help\tShow help information'
    ) # append extra options

  local selected=$(_fzfhelp_menu "docker" "$1" "${extra[@]}")
  [[ -n "$selected" ]] && \
    case "$selected" in
      help)
        local cmd
        [[ -n "$2" ]] && cmd="$2" || cmd="$(_fzfhelp_menu "docker" "")"
        docker "$cmd" --help ;;
      compose|container|image|network|volume|system)
        [[ $# -gt 0 ]] && shift
        docker_"$selected"_commands "$@" ;;
      attach|kill|logs|pause|port|rename|restart|rm|start|stop|unpause)
        docker_container_commands "$selected" "$2" ;;
      history)
        docker_image_commands "$selected" "$2" ;;
      images)
        docker_images_fzf "$2" ;;
      ps)
        docker_ps_fzf ;;
      pull)
        docker "$selected" $(docker_search_fzf "$2") ;;
      push|rmi|save)
        docker "$selected" $(docker_images_fzf "$2") ;;
      search)
        docker_search_fzf "$2" ;;
      top)
        docker top $(docker_ps_fzf "$2") ;;
      builder|buildx|context|manifest|plugin|swarm)
        docker_subcommands "$selected" "$2" ;;
      stats|version|info|logout)
        docker $selected ;;
      *)
        case $selected in
          commit|cp|create|diff|exec|export|update|wait)
            local args=$(docker_ps_fzf "$2")
            [[ -z "$args" ]] && return 1 ;;
          import)
            local args="{{<url_or_path>}} {{<repository:tag>}}" ;;
          load)
            local args="{{<path/to/image/tarball>}}" ;;
          login)
            local args="{{<registry_url>}}" ;;
          run)
            local args="$(docker_images_fzf "$2")" 
            [[ -z $args ]] && return 1 ;;
          tag)
            local args="{{<source_image>}} {{<target_image>}}" ;;
        esac
        print -z "docker $selected $(docker_options_fzf $selected) $args" ;;
    esac
}

docker_builder_commands() {
  
}

docker_compose_commands() {
  local extra=(
      $'help\tShow help information'
      $'edit\tEdit compose files'
      $'new\tAdd a new compose project'
      $'add\tAdd a new compose project'
    ) # append extra options

  local cmd=$(docker_subcommands "compose" "$1" "${extra[@]}")
  [[ -n "$cmd" ]] && \
    case "$cmd" in
      help)
        docker_fzf help compose ;;
      ls)
        docker_compose_fzf ;;
      version)
        docker compose "$cmd" ;;
      up)
        docker_compose_up -d ;;
      add|new)
        read -r "NEWPROJ?Enter new compose project name: "
        [[ -n "$NEWPROJ" ]] && \
          local proj="$DOCKER_DIR/$NEWPROJ" && \
          local files=("$proj/docker-compose.yml" "$proj/.env.example" "$proj/.env") && \
          mkdir -p $proj && ${EDITOR:-vi} $files ;;
      *)
        local compose_file=($(docker_compose_fzf "$2"))
        [[ -n "$compose_file" ]] && \
          case "$cmd" in
            attach|build|cp|create|exec|port|push|run|scale|wait|watch)
              print -z "docker compose $cmd $(docker_options_fzf compose $cmd) -f $compose_file {{<service>}}" ;;
            edit)
              ${EDITOR:-vi} "$compose_file" "${compose_file:h}/.env" ;;
            logs)
              local logcmd
              [[ -n $(less --version 2>/dev/null) ]] && logcmd="less" || logcmd="cat"
              $logcmd < <(docker compose -f "$compose_file" logs) ;;
            *)
              docker compose -f "$compose_file" "$cmd" ;;
          esac ;;
    esac
}

docker_container_commands() {
  local extra=(
      $'help\tShow help information'
    ) # append extra options

  local cmd=$(docker_subcommands "container" "$1" "${extra[@]}")
  [[ -n "$cmd" ]] && \
    case "$cmd" in
      help)
        docker_fzf help container ;;
      ls)
        docker_ps_fzf ;;
      prune)
        docker container "$cmd" ;;
      commit|cp|create|diff|exec|export|run|update|wait)
        docker_fzf "$cmd" "$2" ;;
      *)
        local container=$(docker_ps_fzf "$2")
        [[ -n "$container" ]] && \
          case "$cmd" in
            logs)
              less < <(docker container logs "$container") ;;
            rename)
              [[ -n "$3" ]] && docker container rename "$container" "$3" || \
              print -z "docker container "$cmd" "$container" {{<new_name>}}" ;;
            *)
              docker container "$cmd" "$container" ;;
          esac ;;
    esac
}

docker_image_commands() {
  local cmd=$(docker_subcommands "image" "$1")
  [[ -n "$cmd" ]] && \
    case "$cmd" in
      history|inspect|push|rm)
        docker image "$cmd" $(docker_images_fzf "$2") ;;
      ls)
        docker_images_fzf ;;
      prune)
        docker image "$cmd" -a ;;
      pull)
        docker image "$cmd" $(docker_search_fzf "$2") ;;
      *)
        case "$cmd" in
          build)
            local args="{{<path_to_dockerfile>}}" ;;
          import)
            local args="{{<url_or_path>}} {{<repository:tag>}}" ;;
          load)
            local args="{{<path_to_image_tarball>}}" ;;
          tag)
            local args="{{<source_image>}} {{<target_image>}}" ;;
        esac
        print -z "docker $cmd $(docker_options_fzf image $cmd) $args" ;;
    esac
}

docker_network_commands() {
  local cmd=$(docker_subcommands "network" "$1")
  [[ -n "$cmd" ]] && \
    case "$cmd" in
      create)
        print -z "docker network "$cmd" $(docker_options_fzf network $cmd) {{<network_name>}}" ;;
      ls)
        docker_network_fzf ;;
      prune)
        docker network prune ;;
      *)
        local network=$(docker_network_fzf "$2")
        local opts=$(docker_options_fzf network $cmd)
        [[ -n "$network" ]] && \
          case "$cmd" in
            connect|disconnect)
              local container=$(docker_ps_fzf "$3")
              [[ -n "$container" ]] && [[ $opts == *{{*}}* ]] && \
                print -z "docker network $cmd $opts "$network" "$container"" ;;
            inspect|rm)
              [[ $opts == *{{*}}* ]] && \
                print -z "docker network "$cmd" $opts" || \
              docker network "$cmd" $opts "$network" ;;
            *)
              echo "Unknown docker network command: $cmd" && return 1 ;;
          esac ;;
    esac
}

docker_system_commands() {
  local cmd=$(docker_subcommands "system" "$1")
  [[ -n "$cmd" ]] && \
    case "$cmd" in
      df|events|info|prune)
        local opts=$(docker_options_fzf system $cmd)
        [[ $opts == *{{*}}* ]] && \
          print -z "docker system "$cmd" $opts" || \
        docker system "$cmd" $opts ;;
      *)
        echo "Unknown docker system command: $cmd" && return 1 ;;
    esac
}

docker_volume_commands() {
  local cmd=$(docker_subcommands "volume" "$1")
  [[ -n "$cmd" ]] && \
    case "$cmd" in
      create|prune)
        local opts=$(docker_options_fzf volume $cmd)
        [[ $opts == *{{*}}* ]] && \
          print -z "docker volume "$cmd" $opts" || \
          docker volume "$cmd" $opts ;;
      ls)
        docker_volume_fzf ;;
      inspect|rm)
        local volume=$(docker_volume_fzf "$2")
        [[ -n "$volume" ]] && \
        local opts=$(docker_options_fzf volume $cmd)
        [[ $opts == *{{*}}* ]] && \
          print -z "docker volume "$cmd" $opts" || \
        docker volume "$cmd" "$volume" $opts ;;
      *)
        echo "Unknown docker volume command: $cmd" && return 1 ;;
    esac
}

docker_subcommands() {
  local cmd="$1"
  local query="$2"
  shift 2 # remove first two arguments

  local cmds=(${(@f)"$(
    docker "$cmd" --help \
      | sed -n '/^.*Commands:$/,/^$/ {
            /^.*Commands:$/d
            /^$/d
            s/^\s*\(\S*\)\s*\(.*\)$/\1\t\2/p
          }'
  )"})

  # add any extra commands passed as arguments
  for extra in "$@"; do
    cmds+=("$extra")
  done

  local cmd=$(
    printf "%s\n" "${cmds[@]}" \
    | fzf \
      $FZF_DOCKER_DEFAULT_OPTS \
      --delimiter="\t" \
      --with-nth=1 \
      --preview='echo {2}' \
      --preview-window=top:2:wrap \
      --prompt="Select a docker "$args" command: " \
      --query="$query" \
      --select-1 \
      --no-multi \
      --accept-nth="{1}" \
    )
  [[ -n "$cmd" ]] && echo "$cmd"
}

docker_compose_fzf() {
  unsetopt correct
  local compose_file=$(
    ls $DOCKER_DIR/**/*compose.(yml|yaml) \
      | fzf \
        $FZF_DOCKER_DEFAULT_OPTS \
        --prompt="Select compose file: " \
        --preview "batcat {} --color always --style=changes" \
        --query="$1" \
        --select-1 \
        --delimiter='/' \
        --with-nth=5..-2 \
    )
  [[ -n "$compose_file" ]] && echo "$compose_file"
  setopt correct
}

docker_compose_up() {
  local opt=""
  [[ $1 == "-d" ]] && local opt="-d" && shift
  for f in $(docker_compose_fzf $@); do
    docker compose -f $f up $opt
  done
}

docker_images_fzf() {
  local images=$(docker images --format "table {{.Repository}}\t{{.Tag}}")
  local selected_image=$(
    fzf \
      $FZF_DOCKER_DEFAULT_OPTS \
      --prompt="Select or enter new image: " \
      --exact \
      --query="$1" \
      --header-lines=1 \
      --bind enter:accept-or-print-query \
      --accept-nth="{1}:{2}" \
      <<< $images \
  )
  [[ -n "$selected_image" ]] && echo "$selected_image"
}

docker_network_fzf() {
  local networks=$(docker network ls --format "{{.Name}}")
  local selected_network=$(
    fzf \
      $FZF_DOCKER_DEFAULT_OPTS \
      --prompt="Select network: " \
      --query="$1" \
      <<< $networks \
  )
  [[ -n "$selected_network" ]] && echo "$selected_network"
}

docker_options_fzf() {
  local args=()
  for arg in $@; do args+=("$arg"); done
  local options=(${(@f)"$(
    docker "$args[@]" --help \
    | sed -n '/^.*Options:$/,/^$/ {
          /^.*Options:$/d
          /^$/d
          s/^.*\(--\S*\)\s*\([a-z]*\)\s*\(.*\)$/\1\t\2\t\3/p
        }'
  )"})
  options+=($'--help\t\tShow help information')

  printf "%s\n" "${options[@]}" \
  | fzf \
    $FZF_DOCKER_DEFAULT_OPTS \
    --delimiter="\t" \
    --with-nth=1..2 \
    --preview='echo {3}' \
    --preview-window=top:2:wrap \
    --exit-0 \
    --prompt="Select options for docker $args: " \
    --accept-nth="{1} {{{2}}}" \
    | sed -z 's/{{}}//g; s/\n/ /g; s/ $/\n/'
}

docker_ps_fzf() {
  local ps=$(docker ps --format "table {{.Names}}\t{{.RunningFor}}\t{{.Ports}}")
  fzf \
    $FZF_DOCKER_DEFAULT_OPTS \
    --query="$1" \
    --header-lines=1 \
    --select-1 \
    --accept-nth="{1}" \
    <<< $ps \
}

docker_search_fzf() {
  local search_opts=(
      --filter=stars=3 \
      --limit 10 \
      --no-trunc \
      --format "{{.StarCount}}\t{{.Name}}\t{{.Description}}"
    )
  local search_results=$(docker search "$1" "${search_opts[@]}")

  local selected_image=$(
    fzf \
      $FZF_DOCKER_DEFAULT_OPTS \
      --height=40% \
      --prompt="Select image: " \
      --delimiter='\t' \
      --with-nth=1,2 \
      --preview='echo {3}' \
      --preview-window=top:3:wrap \
      --preview-label-pos=3:top \
      --preview-label="Description" \
      --header=$'Stars\tName' \
      --bind 'change:reload(docker search {q} '"${search_opts[*]}"')' \
      --accept-nth="{2}" \
      <<< $search_results \
  )
  [[ -n "$selected_image" ]] && echo "$selected_image"
}

docker_volume_fzf() {
  local volumes=$(docker volume ls --format "{{.Name}}")
  local selected_volume=$(
    fzf \
      $FZF_DOCKER_DEFAULT_OPTS \
      --prompt="Select volume: " \
      --query="$1" \
      <<< $volumes \
  )
  [[ -n "$selected_volume" ]] && echo "$selected_volume"
}
