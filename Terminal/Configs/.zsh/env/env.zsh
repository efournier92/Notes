#!/bin/zsh

#----------------
# Name          : env.zsh
# Description   : Environment-specific configuration for ZSH
# Author        : E Fournier
# Dependencies  : zsh
#----------------

ENV_NAME="Linux"
#ENV_NAME="Windows"

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
export ENV_ZSH="$HOME/.zsh"

#### Oh-My-Zsh directory
export ENV_OHMYZSH="$HOME/.oh-my-zsh"

#### Zsh alias directory
export ENV_ALIAS="$ENV_ZSH/alias"

### Vim

#### Vim root directory
export ENV_VIM="$HOME/.vim"

#### Vim snippets directory
export ENV_SNIPS="$ENV_VIM/snippets"

### Tmux

#### Tmux root directory
export ENV_TMUX="$HOME/.tmux"

#### Tmux session directory
export ENV_TMUX_SESSIONS="$ENV_TMUX/sessions"

#### Tmux scripts directory
export ENV_TMUX_SCRIPTS="$ENV_TMUX/scripts"

## Linux
if [[ "$ENV_NAME" == "Linux" ]]; then

  ### Snc
  
  #### Snc desktop directory
  export ENV_START="/mnt/bnk"

  #### Snc root directory
  export ENV_SNC="$ENV_START/snc"

  #### Snc desktop directory
  export ENV_DESKTOP="$ENV_SNC/Desktop"

  ### System

  ### Hosts file
  export ENV_HOSTS="/etc/hosts"

  ### Alias

  #### Drives aliases
  source "$ENV_ALIAS/drives.zsh"

  #### Tools aliases
  source "$ENV_ALIAS/tools.zsh"

  #### Tmux aliases
  source "$ENV_ALIAS/tmux.zsh"

  #### Sb aliases
  source "$ENV_ALIAS/sb.zsh"

  #### Snc aliases
  source "$ENV_ALIAS/snc.zsh"

  #### Snc aliases
  source "$ENV_ALIAS/externals.zsh"

## Windows
elif [[ "$ENV_NAME" == "Windows" ]]; then

  ### Snc

  #### Snc desktop directory
  export ENV_START="$HOME/snc"

  #### Snc root directory
  export ENV_SNC="$ENV_START"

  #### Snc desktop directory
  export ENV_DESKTOP="$ENV_SNC/Desktop"

  ### System
  
  ### Clipboard Server

  #### Set localhost for clipboard support
  export DISPLAY=localhost:0.0

  ### Hosts file
  export ENV_HOSTS="/c/Windows/System32/drivers/etc/hosts"

  ### Alias

  #### Windows aliases
  source "$ENV_ALIAS/windows.zsh"

  #### Snc aliases
  source "$ENV_ALIAS/snc.zsh"

fi

