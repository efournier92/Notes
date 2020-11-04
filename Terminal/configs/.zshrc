#----------------
# Name          : .zshrc
# Description   : Main ZSH configuration file
# Author        : E Fournier
# Dependencies  : zsh, oh-my-zsh
#----------------

# Plugins 

## Environment Configs
source "$HOME/.zsh/env/env.zsh"

## Oh-My-Zsh

### Shell theme
ZSH_THEME="avit"

### Disable highlighting for ls command
DISABLE_LS_COLORS="true"

### Load oh-my-zsh assets
source "$ENV_OHMYZSH/oh-my-zsh.sh"

### Enable extension for syntax highlighting
source "$ENV_ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Privacy

## History

### Maximum history items in memory
HISTSIZE=1000

### Do not persist history to file
SAVEHIST=0

## Git

### Cache credentials for 24 hours
git config --global credential.helper 'cache --timeout=86400'

## Method Overrides

### Always list contents when changing directory
chpwd() { ls }

