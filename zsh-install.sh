#! /user/bin/env bash

##
# This file should only be used once, for initially setting zsh.
## 

# check for required args
REQUIRED_ARGS=4
if [ $# -lt $REQUIRED_ARGS ]; then
    echo "zsh install script expected $REQUIRED_ARGS arguments, only $# provided"
    echo "Required arguments:"
    echo "    1. ZSH_DIR: absolute path to directory containing zsh files to be sourced"
    echo "    2. CONFIG_DIR: absolute path to root directory for all configuration files"
    echo "    3. PROJECT_DIR: absolute path to root directory for all projects"
    echo "    4. NOTES_DIR: absolute path to root directory for notes"
    echo ""
    echo "(ERROR) failed to source zsh install"
    exit 1
fi

# variables
ZSH_INIT_FILENAME='zsh-init.sh'
LOCAL_VARIABLE_FILENAME='zsh-variables-local.sh'
ZSH_DIR="$1"
CONFIG_DIR="$2"
PROJECT_DIR="$3"
NOTES_DIR="$4"
LOCAL_VARIABLE_FILE="$ZSH_DIR/$LOCAL_VARIABLE_FILENAME"
ZSHRC_FILE="$HOME/.zshrc"

# variables read by zsh and plugins
ZSH="$HOME/.oh-my-zsh" # path to oh-my-zsh installation
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

# generate local variable file
cat > "$LOCAL_VARIABLE_FILE" << EOF
#! /user/bin/env zsh

##
# This file contains variables specific to this machine.
# This was generated by zsh-install.sh.
## 

# zsh setup related files
export ZSH_INIT_FILENAME="$ZSH_INIT_FILENAME"
export LOCAL_VARIABLE_FILE="$LOCAL_VARIABLE_FILE"
export ZSH_DIR="$ZSH_DIR"
export CONFIG_DIR="$CONFIG_DIR"
export PROJECT_DIR="$PROJECT_DIR"
export NOTES_DIR="$NOTES_DIR"

# variables read by zsh and plugins
export ZSH="$ZSH"
export ZSH_CUSTOM="$ZSH_CUSTOM"

echo "(OK) sourced zsh local variables successfully"
EOF

ZSHRC_ENTRY="source \"$ZSH_DIR/$ZSH_INIT_FILENAME\" \"$LOCAL_VARIABLE_FILE\""
echo "$ZSHRC_ENTRY" >> "$ZSHRC_FILE"
source $ZSHRC_FILE



# # chsh -s $(which zsh)
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
# cd && curl -L git.io/antigen > antigen.zsh

# # install zsh plugins
# cd $PROJECT_DIR
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

# # symlink themes from config directory
# ln -s $ZSH_DIR/themes/* $ZSH_CUSTOM/themes