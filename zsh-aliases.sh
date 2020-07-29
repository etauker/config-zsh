#! /user/bin/env zsh


UPDATE_SUCCESS_MESSAGE="'(OK) zsh setting update successful'"

# general aliases
alias update="source \
\"$ZSH_DIR/$ZSH_INIT_FILENAME\" \
\"$ZSH_DIR\" \
\"$DEVELOPMENT_DIR\" && 
echo $UPDATE_SUCCESS_MESSAGE";

# navigation aliases
alias ws="cd \"$PROJECT_DIR\""

# kubernetes aliases
alias k="callKubectl"
alias kub="callKubectl"

# function implementations
callKubectl() { kubectl "$@"; }

# source other aliases
test -f "$ZSH_DIR/aliases/cheats.sh" && source "$ZSH_DIR/aliases/cheats.sh"
test -f "$ZSH_DIR/aliases/vscode.sh" && source "$ZSH_DIR/aliases/vscode.sh"
test -f "$ZSH_DIR/aliases-work/fsm.sh" && source "$ZSH_DIR/aliases-work/fsm.sh"
test -f "$ZSH_DIR/aliases-work/iterm.sh" && source "$ZSH_DIR/aliases-work/iterm.sh"
test -f "$ZSH_DIR/aliases-work/insomnia.sh" && source "$ZSH_DIR/aliases-work/insomnia.sh"
test -f "$ZSH_DIR/aliases-work/worklog.sh" && source "$ZSH_DIR/aliases-work/worklog.sh"



echo "(OK) sourced zsh aliases successfully"
