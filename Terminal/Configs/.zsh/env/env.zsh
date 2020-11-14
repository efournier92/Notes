#!/bin/zsh

#----------------
# Name          : env.zsh
# Description   : Environment-specific configuration for ZSH
# Author        : E Fournier
# Dependencies  : zsh
#----------------

ENV="Linux"
#ENV="Windows"

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

  #### Sb root directory
  export SBROOT="/home/misigno"

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

  #### Snc desktop directory
  export START="$HOME/snc"

  #### Snc root directory
  export SNC="$START"

  #### Snc desktop directory
  export SDESKTOP="$SNC/Desktop"

  ### Cs

  #### Cs directory
  export CS="$HOME/cs"

  ### System
  
  ### Clipboard Server

  #### Set localhost for clipboard support
  export DISPLAY=localhost:0.0

  ### Hosts file
  export HOSTS="/c/Windows/System32/drivers/etc/hosts"

  ### Alias

  #### Windows aliases
  source "$ZALIAS/windows.zsh"

  #### Snc aliases
  source "$ZALIAS/snc.zsh"

fi

