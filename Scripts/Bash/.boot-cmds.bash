#!/bin/bash

shopt -s expand_aliases
source ~/.zsh-alias.sh

BOARD_ID=$( pkexec dmidecode -s baseboard-serial-number )
MB2015_ID='C02639600FUGQ101K'
MHUB_ID='C0715060AXMDKP2AQ'

sleep 1
copyq &
git config --global credential.helper "cache --timeout=1512000"

if [ $BOARD_ID = $MB2015_ID ]; then
  redshift -l 40.7:-73.9851 -t 5700:3800 -g 0.8 -m randr &
  m_bnk

elif [ $BOARD_ID = $MHUB_ID ]; then
  kodi -fs &
  m_MD

else
  redshift -l 40.7:-73.9851 -t 5700:3800 -g 0.8 -m randr &
fi

