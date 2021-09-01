#----------------
# Name          : .zshrc
# Description   : Main ZSH configuration file
# Author        : E Fournier
# Dependencies  : zsh, oh-my-zsh
#----------------

## Read the 1st line from file for environment name
export ENV_NAME="$(head -n 1 $HOME/.env_name)"

## Start the config-loading process
source "$HOME/.zsh/env/common"

