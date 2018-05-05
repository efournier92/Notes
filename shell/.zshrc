# Determine Operating System
nameOfOs="$(uname -s)"
case "${nameOfOs}" in 
  Linux*)  machineOs=Linux;;
  Darwin*) machineOs=Osx;;
  CYGWIN*) machineOs=Cygwin
esac

# Shell Theme
ZSH_THEME="agnoster"

# . _ and - will be interchangeable
HYPHEN_INSENSITIVE="true"

# Disable colors in `ls`
DISABLE_LS_COLORS="true"

# Enable command auto-correction
ENABLE_CORRECTION="true"

# Timestamp format 
HIST_STAMPS="yyyy-mm-dd"

# Default Language
export LANG=en_US.UTF-8

# Vim as Default Editor
export EDITOR=vim

# Load alias file
source ~/.zsh-alias.sh

# Load MC Solarized Skin
export MC_SKIN=$HOME/.mc/solarized.ini

# Load oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

DEFAULT_USER=$USER
# OS Specific Configs
if [[ ${machineOs} == Linux ]]; then
  export START_DIR=/mnt/BNK # Start Directory
elif [[ ${machineOs} == Osx ]]; then
  export START_DIR=/Volumes/BNK # Start Directory
elif [[ ${machineOs} == Cygwin ]]; then
  source ~/.zsh/colors/mintty-solarized-dark.sh # Load colors file
  if [[ $USER == misigno ]]; then
    export START_DIR=/cygdrive/z # Start Directory
  elif [[ $USER == efournier ]]; then
    export START_DIR=/cygdrive/c/Users/efournier # Start Directory
  fi
else
  export START_DIR=$HOME # Start Directory
fi

# Run Tmux
if [ -z "$TMUX" ]
  then (cd $START_DIR; tmux)
fi

