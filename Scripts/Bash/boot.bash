#!/bin/bash

shopt -s expand_aliases
source ~/.zsh-alias.sh

motherboard_id=$( pkexec dmidecode -s baseboard-serial-number )
huawei_2019_id='BB8310193C000132'
macbook_2015_id='C02639600FUGQ101K'
mhub_id='C0715060AXMDKP2AQ'

sleep 1
copyq &
git config --global credential.helper "cache --timeout=1512000"

# Workhorse Laptop
if [[ $motherboard_id = $huawei_2019_id || $motherboard_id = $macbook_2015_id ]]; then
  redshift -l 40.7:-73.9851 -t 5700:3800 -g 0.8 -m randr &
  m_bnk
# Media Machine
elif [[ $motherboard_id = $mhub_id ]]; then
  kodi -fs &
  m_MD
  bash /home/misigno/scripts/Livestream/Livestream.bash
# Other Machines
else
  redshift -l 40.7:-73.9851 -t 5700:3800 -g 0.8 -m randr &
fi

