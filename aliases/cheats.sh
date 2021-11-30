#! /user/bin/env zsh

alias cht="openCheatSheets"

openCheatSheets() {
    CHEAT_SHEETS_DIR="$NOTE_DIR/cheatsheets"

    # no args - open "$CHEAT_SHEETS_DIR" in vscode
    if [[ $# -eq 0 ]] ; then
        echo "opening '$CHEAT_SHEETS_DIR' using VSCode"
        code "$CHEAT_SHEETS_DIR"
    else
        # --list option
        echo $1
        if [[ $1 == "--list" ]] ; then

            # one arg - list contents of "$CHEAT_SHEETS_DIR/$arg"
            if [[ $# -eq 2 ]] ; then
                echo "listing '$CHEAT_SHEETS_DIR/$2' directory contents"
                ls "$CHEAT_SHEETS_DIR/$2"
            
            # no args - list contents of "$CHEAT_SHEETS_DIR"
            else
                echo "listing '$CHEAT_SHEETS_DIR' directory contents"
                ls "$CHEAT_SHEETS_DIR"
            fi

        # any number of args - "$CHEAT_SHEETS_DIR/$args[0]" in vscode
        else
            cat "$CHEAT_SHEETS_DIR/$1"
        fi
    fi
}

echo '    (OK) sourced cheats aliases successfully'
