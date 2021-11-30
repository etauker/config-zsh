#! /user/bin/env zsh

# check for required args
REQUIRED_ARGS=1
if [ $# -lt $REQUIRED_ARGS ]; then
    echo "zsh init script expected $REQUIRED_ARGS arguments, only $# provided"
    echo "Required arguments:"
    echo "    1. LOCAL_VARIABLE_FILE: file containing local variables required for zsh script setup"
    echo ""
    echo "(ERROR) failed to source zsh init"
    return 1
fi

# make key locations available for other scripts
LOCAL_VARIABLE_FILE=$1
echo $LOCAL_VARIABLE_FILE

#  # load nvm - is it needed?
# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"


echo "(OK) sourced zsh init successfully"


# source other files
test -f "$LOCAL_VARIABLE_FILE" && source "$LOCAL_VARIABLE_FILE"
test -f "$ZSH_DIR/zsh-variables-shared.sh" && source "$ZSH_DIR/zsh-variables-shared.sh"
test -f "$ZSH_DIR/zsh-paths-local.sh" && source "$ZSH_DIR/zsh-paths-local.sh"
test -f "$ZSH_DIR/zsh-paths-shared.sh" && source "$ZSH_DIR/zsh-paths-shared.sh"
test -f "$ZSH_DIR/zsh-paths-local.sh" && source "$ZSH_DIR/zsh-paths-local.sh"
test -f "$ZSH_DIR/zsh-aliases.sh" && source "$ZSH_DIR/zsh-aliases.sh"
test -f "$ZSH_DIR/zsh-aliases-local.sh" && source "$ZSH_DIR/zsh-aliases-local.sh"

# configurations sources oh-my-zsh which takes a long time
# changed to do this in zshrc and not on update
# test -f "$ZSH_DIR/zsh-configuration.sh" && source "$ZSH_DIR/zsh-configuration.sh"
