# Determine Operating System
os_name="$(uname -s)"
read os_version < /proc/version

if [[ "$os_version" == *"Microsoft"* ]]; then
  os_env=Wsl;
elif [[ "$os_name" == *"Darwin"* ]]; then
  os_env=Osx;
elif [[ "$os_name" == *"Linux"* ]]; then
  os_env=Linux;
fi

# Theme
ZSH_THEME="agnoster"

# Disable colors in `ls`
DISABLE_LS_COLORS="true"

# Timestamp format 
HIST_STAMPS="yyyy-mm-dd"

# Default Language
export LANG=en_US.UTF-8

# Vim as Default Editor
export EDITOR=vim

# Load alias file
[[ -f ~/.zsh-alias.sh ]] && source ~/.zsh-alias.sh

# Load MC Solarized Skin
export MC_SKIN=$HOME/.mc/solarized.ini

# Load oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# OS Specific Configs
DEFAULT_USER=$USER
if [[ "$os_env" == Linux ]]; then
  if [[ -d "/mnt/bnk" ]]; then
    START_DIR=/mnt/bnk
  else
    START_DIR=$HOME
  fi
elif [[ "$os_env" == Osx ]]; then
  if -d "/Volumes/bnk"; then
    START_DIR=/Volumes/bnk
  else
    START_DIR=$HOME
  fi
elif [[ "$os_env" == Wsl ]]; then
  export DISPLAY=localhost:0.0
else
  START_DIR=$HOME
fi

# Run Tmux
if [ -z "$TMUX" ]
  then (cd $START_DIR; tmux)
fi

