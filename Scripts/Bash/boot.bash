#!/bin/bash

shopt -s expand_aliases
source ~/.zsh-alias.sh

motherboard_id=$( pkexec dmidecode -s baseboard-serial-number )
macbook_2015_id='C02639600FUGQ101K'
mhub_id='C0715060AXMDKP2AQ'

sleep 1
copyq &
git config --global credential.helper "cache --timeout=1512000"

if [ $motherboard_id = $macbook_2015_id ]; then
  redshift -l 40.7:-73.9851 -t 5700:3800 -g 0.8 -m randr &
  m_bnk

elif [ $motherboard_id = $mhub_id ]; then
  kodi -fs &
  m_MD
  bash /home/misigno/scripts/Livestream/Livestream.bash

else
  redshift -l 40.7:-73.9851 -t 5700:3800 -g 0.8 -m randr &
fi

