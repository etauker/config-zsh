#! /user/bin/env bash

##
# This file should only be used once, for initially setting zsh.
## 

# check for required args
REQUIRED_ARGS=6
if [ $# -lt $REQUIRED_ARGS ]; then
    echo "zsh install script expected $REQUIRED_ARGS arguments, only $# provided"
    echo "Required arguments:"
    echo "    1. ZSH_DIR: absolute path to directory containing zsh files to be sourced"
    echo "    2. CONFIG_DIR: absolute path to root directory for all configuration files"
    echo "    3. PROJECT_DIR: absolute path to root directory for all projects"
    echo "    4. NOTE_DIR: absolute path to root directory for notes"
    echo "    5. TOOL_DIR: absolute path to root directory where development binaries are stored"
    echo "    6. SCRIPT_DIR: absolute path to root directory for scripts"
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
NOTE_DIR="$4"
TOOL_DIR="$5"
SCRIPT_DIR="$6"
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
export NOTE_DIR="$NOTE_DIR"
export TOOL_DIR="$TOOL_DIR"
export SCRIPT_DIR="$SCRIPT_DIR"

# variables read by zsh and plugins
export ZSH="$ZSH"
export ZSH_CUSTOM="$ZSH_CUSTOM"

echo "(OK) sourced zsh local variables successfully"
EOF


cat > "$ZSHRC_FILE" << EOF
#! /user/bin/env zsh
test -f "$LOCAL_VARIABLE_FILE" && source "$LOCAL_VARIABLE_FILE"
source "$ZSH_DIR/$ZSH_INIT_FILENAME" "$LOCAL_VARIABLE_FILE"
test -f "\$ZSH_DIR/zsh-configuration.sh" && source "\$ZSH_DIR/zsh-configuration.sh"
EOF

# # change default shell to zsh
# chsh -s $(which zsh)

# # install ohmyzsh, homebrew and antigen
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# # bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
# cd && curl -L git.io/antigen > antigen.zsh

# # install zsh plugins
# cd $PROJECT_DIR
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/lukechilds/zsh-nvm $ZSH_CUSTOM/plugins/zsh-nvm

# symlink themes from config directory
rm -Rf $ZSH_CUSTOM/themes
mkdir -p $ZSH_CUSTOM/themes
ln -s "$ZSH_DIR/themes/"* $ZSH_CUSTOM/themes/

source "$ZSHRC_FILE"
