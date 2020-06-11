# PLUGINS 

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

# PRIVACY

## History

### Maximum history items in memory
HISTSIZE=1000

### Maximum history items persisted to file
SAVEHIST=0

# INTERFACE

## Defaults

### Shell
export SHELL=zsh

### Editor
export EDITOR=vim

### Language
export LANG=en_US.UTF-8

## Overrides

### Load alias file
[[ -f ~/.zsh-alias.sh ]] && source ~/.zsh-alias.sh

### Always list contents when changing directory
chpwd() { ls }

# TOGGLES

# Attach to a local display host
# export DISPLAY=localhost:0.0

