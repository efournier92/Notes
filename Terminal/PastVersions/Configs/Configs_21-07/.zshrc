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

### Disable annoying update prompts
DISABLE_AUTO_UPDATE=true

### Load oh-my-zsh assets
ZSH="$ZOHMYZSH"
source "$ZSH/oh-my-zsh.sh"

### Enable extension for syntax highlighting
source "$ZPLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

### Set custom highlighting for the `ls` command
export LS_COLORS="di=31:tw=31:ow=31:fi=32:su=32:sg=32:ex=32:so=36:pi=36:bd=36:cd=36:ln=36:"

### Use same highlighting for completion as for the `ls` command
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

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

