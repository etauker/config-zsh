#! /user/bin/env zsh


vscode_executable="/usr/local/bin/code"
alias jcode="$vscode_executable --extensions-dir $TOOL_DIR/vscode/profiles/java/extensions --user-data-dir $TOOL_DIR/vscode/profiles/java/data"
alias code="openVsCode"

openVsCode() {

    case "$1" in
        java)
            shift
            jcode "$@"
            ;;
        *)
            eval "$vscode_executable \"$@\""
            ;;
    esac
}

echo '    (OK) sourced vscode aliases successfully'

