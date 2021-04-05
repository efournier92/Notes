#----------------
# Name          : .zshrc
# Description   : Main ZSH configuration file
# Author        : E Fournier
# Dependencies  : zsh, oh-my-zsh
#----------------

# Plugins 

## Source environment configs
source "$HOME/.zsh/env/env.zsh"

## Conditionally start the unison sync process
$ZSCRIPTS/uni watch

## Oh-My-Zsh

### Shell theme
ZSH_THEME="avit"

### Disable highlighting for ls command
DISABLE_LS_COLORS="true"

### Disable annoying update prompts
DISABLE_AUTO_UPDATE=true

### Load oh-my-zsh assets
ZSH="$ZOHMYZSH"
source "$ZSH/oh-my-zsh.sh"

### Enable extension for syntax highlighting
source "$ZPLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Display

## Prevent partial-line %
unsetopt PROMPT_SP

# Privacy

## History

### Maximum history items in memory
HISTSIZE=1000

### Do not persist history to file
SAVEHIST=0

## Method Overrides

### Always list contents when changing directory
chpwd() { ls }

