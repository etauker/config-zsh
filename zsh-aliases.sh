#! /user/bin/env zsh


UPDATE_SUCCESS_MESSAGE="'(OK) zsh setting update successful'"

# general aliases
alias update="source \
\"$ZSH_DIR/$ZSH_INIT_FILENAME\" \
\"$ZSH_DIR/zsh-variables-local.sh\" \
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


echo "(OK) sourced zsh shared aliases successfully"
