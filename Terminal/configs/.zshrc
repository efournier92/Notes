#----------------
# Name          : .zshrc
# Description   : Main ZSH configuration file
# Author        : E Fournier
# Dependencies  : zsh, oh-my-zsh
#----------------

# Plugins 

## Oh-My-Zsh

### Shell theme
ZSH_THEME="avit"

### Disable highlighting for ls command
DISABLE_LS_COLORS="true"

### Set base directory for oh-my-zsh
export ZSH=$HOME/.oh-my-zsh

### Load oh-my-zsh assets
source $ZSH/oh-my-zsh.sh

### Enable extension for syntax highlighting
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Privacy

## History

### Maximum history items in memory
HISTSIZE=1000

### Maximum history items persisted to file
SAVEHIST=0

## Git

### Cache credentials for 24 hours
git config --global credential.helper 'cache --timeout=86400'

# Interface

## Defaults

### Shell
export SHELL=zsh

### Editor
export EDITOR=vim

### Language
export LANG=en_US.UTF-8

### Preserve natural sort order
export LC_COLLATE=C

## Overrides

### Load alias files
ALIAS_DIR="$HOME/.zsh/alias"
source "$ALIAS_DIR/drives.zsh"
source "$ALIAS_DIR/sb.zsh"
source "$ALIAS_DIR/tmux.zsh"
source "$ALIAS_DIR/tools.zsh"
#source "$ALIAS_DIR/windows.zsh"

### Always list contents when changing directory
chpwd() { ls }

# Toggles

## For WSL

### Attach to a local display host
# export DISPLAY=localhost:0.0

