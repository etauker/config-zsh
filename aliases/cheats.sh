#! /user/bin/env zsh

alias cht="openCheatSheets"

openCheatSheets() {
    CHEAT_SHEETS_DIR="$NOTE_DIR/cheatsheets"

    if [[ $# -eq 0 ]] ; then
        echo "opening '$CHEAT_SHEETS_DIR' using VSCode"
        code "$CHEAT_SHEETS_DIR"
    else
        cat "$CHEAT_SHEETS_DIR/$1"
    fi

}

echo '    (OK) sourced cheats aliases successfully'
