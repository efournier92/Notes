# Determine Operating System
nameOfOs="$(uname -s)"
case "${nameOfOs}" in
    Linux*)     machineOs=Linux;;
    Darwin*)    machineOs=Osx;;
    CYGWIN*)    machineOs=Cygwin
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

# Plugins
plugins=(
  git
  zsh-autosuggestions
)

# Load oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

# Load colors file
source ~/.zsh/colors/mintty-solarized-dark.sh

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Run Tmux
if [ -z "$TMUX" ]
  then tmux
fi

# OS Specific Configs
if [[ ${machineOs} == Linux ]]; then
  DEFAULT_USER="misigno"
  cd /mnt/BNK/Sync # Start Directory
  source ~/aliasFile.sh # Load alias file
elif [[ ${machineOs} == Osx ]]; then
  DEFAULT_USER="misigno"
  cd /Volumes/BNK/Sync # Start Directory
elif [[ ${machineOs} == Cygwin ]]; then
  DEFAULT_USER="efournier"
  cd /cygdrive/c/Users/efournier # Start Directory
fi

