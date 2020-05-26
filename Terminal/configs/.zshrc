# Theme
ZSH_THEME="avit"

# Disable colors for `ls`
DISABLE_LS_COLORS="true"

# Load oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Default Shell
export SHELL=zsh

# Default Editor
export EDITOR=vim

# Default Language
export LANG=en_US.UTF-8

# Display
# export DISPLAY=localhost:0.0

# History
HISTSIZE=1000
SAVEHIST=0

# Always list contents when changing directory
chpwd() { ls }

# Load alias file
[[ -f ~/.zsh-alias.sh ]] && source ~/.zsh-alias.sh

