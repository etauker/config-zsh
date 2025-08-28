#! /user/bin/env zsh

alias doc="runDocker"

runDocker() {
    # CHEAT_SHEETS_DIR="$NOTE_DIR/cheatsheets"

    if [[ $1 == "ps" && "${@}" != *original* ]] ; then
        # TODO: test multiple exposed ports
        printInfoTable
    else
        # Remove "--original" from arguments
        args=()
        for arg in "$@"; do
            [[ "$arg" == "--original" ]] || args+=("$arg")
        done
        docker "${args[@]}"
        docker "$@";
    fi
}

printInfoTable() {
    (
        echo -e "ID=NAME=STATUS=NETWORKS=PORTS=IMAGE=CREATED";
        docker ps --format '{{json .}}' |
        jq -r '"\(.ID)=\(.Names)=\(.Status)=\(.Networks)=\(.Ports | match("(([0-9]|-)+)(?=->)").captures[0].string? // "-")=\(.Image)=\(.RunningFor)"'
    ) | column -t -s "="
}

echo '    (OK) sourced docker aliases successfully'
