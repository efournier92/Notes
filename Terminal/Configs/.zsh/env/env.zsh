#!/bin/zsh

#----------------
# Name          : env.zsh
# Description   : Environment-specific configuration for ZSH
# Author        : E Fournier
# Dependencies  : zsh
#----------------

## Detect Operating System
if grep -q Microsoft /proc/version; then
  ### Windows environent
  export ENV="Windows"
else
  ### Linux environemtn
  export ENV="Linux"
fi

## Common

### System

#### Shell
export SHELL="zsh"

#### Editor
export EDITOR="vim"

#### Language
export LANG="en_US.UTF-8"

#### Preserve natural sort order
export LC_COLLATE="C"

#### The current year
export THIS_YEAR=`date +"%Y"`

### Zsh

#### Zsh root directory
export ZZSH="$HOME/.zsh"

#### Oh-My-Zsh directory
export ZOHMYZSH="$HOME/.oh-my-zsh"

#### Zsh alias directory
export ZALIAS="$ZZSH/alias"

#### Zsh plugins directory
export ZPLUGINS="$ZZSH/plugins"

#### Zsh alias directory
export ZENV="$ZZSH/env"

#### Zsh scripts directory
export ZSCRIPTS="$ZZSH/scripts"

### Vim

#### Vim root directory
export VVIM="$HOME/.vim"

#### Vim snippets directory
export VSNIPS="$VIM/snippets"

### Tmux

#### Tmux root directory
export TTMUX="$HOME/.tmux"

#### Tmux session directory
export TSESSIONS="$TTMUX/sessions"

#### Tmux scripts directory
export TSCRIPTS="$TTMUX/scripts"

### Unison

#### Ensure unique host name per machine
export UNISONLOCALHOSTNAME=`cat /etc/machine-id`

### Sb

#### Sb root directory
export SBROOT="/home/misigno"

### Home

#### DESKTOP
export HDESK="$HOME/Desktop"

#### Documents
export HDOCS="$HOME/Documents"

#### Scripts
export HSCRIPTS="$HOME/scripts"

## Linux
if [[ "$ENV" == "Linux" ]]; then

  ### Snc
  
  #### Snc desktop directory
  export START="/mnt/bnk"

  #### Snc root directory
  export SNC="$START/snc"

  ### Sync

  #### Enable the sync process
  export SYNC_ENABLED="true"

  ### Cs

  #### Cs base directory
  export CS="$START/cs"

  ### Hle

  #### Hle directory
  export HLE="$START/hle"

  ### System

  #### Hosts file
  export HOSTS="/etc/hosts"

  ### Sb
  
  #### Sb root directory
  export SB="$HOME/sbfs"

  ### Program Types

  #### Explore
  explore() { nautilus "$1"; }

  #### Spreadsheet
  spreadsheet() { libreoffice "$1"; }

  #### Word Processing
  word() { libreoffice "$1"; }

  #### Presentation
  presentation() { libreoffice "$1"; }

  #### Markdown
  markdown() { chromium "$1"; }

  #### PDF
  pdf() { evince "$1"; }

  ### Alias

  #### Drives aliases
  source "$ZALIAS/drives.zsh"

  #### Tools aliases
  source "$ZALIAS/tools.zsh"

  #### Tmux aliases
  source "$ZALIAS/tmux.zsh"

  #### Sb aliases
  source "$ZALIAS/sb.zsh"

  #### Snc aliases
  source "$ZALIAS/snc.zsh"

  #### Snc aliases
  source "$ZALIAS/externals.zsh"

## Windows
elif [[ "$ENV" == "Windows" ]]; then

  ### Snc
  
  #### POSIX Windows Directories
 
  ##### Home
  export WHOME_WIN='C:\\Users\\efournier'

  ##### AppData
  export WHOME_APPDATA="$WHOME_WIN\\AppData"

  ##### AppData\Local
  export WHOME_APPDATA_LOCAL="$WHOME_APPDATA\\Local"

  #### UNIX Windows Directories
  
  ##### Home
  export WHOME=$(wslpath $WHOME_WIN)

  #### Data partition
  export DATA="/mnt/d"

  ##### Snc desktop directory
  export START="$DATA/snc"

  ##### Snc root directory
  export SNC="$START"

  ### Sync

  #### Enable the sync process
  export SYNC_ENABLED="false"

  ### Cs

  #### Cs directory
  export CS="$DATA/cs"

  ### System
  
  ### Clipboard Server

  #### Set localhost for clipboard support
  export DISPLAY=localhost:0.0

  ### Hosts file
  export HOSTS="/mnt/c/Windows/System32/drivers/etc/hosts"

  ### Program Types
 
  open_windows_app() {
    local app_name="$1"
    local file_path="$2"
    
    [[ -z $file_path ]] \
      && cmd.exe /C start "$app_name" > /dev/null 2>&1 \
      || cmd.exe /C start "$app_name" "$(wslpath -w $file_path)" > /dev/null 2>&1
  }

  #### Explore
  explore() { open_windows_app "explorer" "$1"; }

  #### Spreadsheet
  spreadsheet() { open_windows_app "excel" "$1"; }

  #### Word Processing
  word() { open_windows_app "winword" "$1"; }

  #### Presentation
  presentation() { open_windows_app "powerpnt" "$1"; }

  #### Markdown
  
  ##### Open with Canary
  markdown_app="$WHOME_APPDATA_LOCAL\\Google\\Chrome SxS\\Application\\chrome.exe"

  ##### Open with Chromium
  # markdown_app='C:\\Users\\efournier\\AppData\\Local\\Chromium\\Application\\chrome.exe'

  ##### Open with Chrome
  # markdown_app='C:\Program Files\Google\Chrome\Application\chrome.exe'

  markdown() { 
    local file_path="$1"
    
    [[ -z $file_path ]] \
      && echo "ERROR: Must supply a markdown file or directory to open." \
      || cmd.exe /C $markdown_app "$(wslpath -w $1)" > /dev/null 2>&1; 
  }

  #### PDF
  pdf() { cmd.exe /C start "$(wslpath -w $1)"; }

  ### Alias

  #### Windows aliases
  source "$ZALIAS/windows.zsh"

  #### Snc aliases
  source "$ZALIAS/snc.zsh"

  #### Tools aliases
  source "$ZALIAS/tools.zsh"

fi

