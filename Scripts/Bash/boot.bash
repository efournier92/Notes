#!/bin/bash

shopt -s expand_aliases
source ~/.zsh-alias.sh

motherboard_id=$( pkexec dmidecode -s baseboard-serial-number )
huawei_2019_id='BB8310193C000132'
macbook_2015_id='C02639600FUGQ101K'
mhub_id='C0715060AXMDKP2AQ'

# Prevent UI scaling bugs
sleep 1

# Laptop
if [[ $motherboard_id = $huawei_2019_id || $motherboard_id = $macbook_2015_id ]]; then
  copyq &
  copyq disable
  m_bnk
  gnome-terminal --window --maximize

# Media
elif [[ $motherboard_id = $mhub_id ]]; then
  m_md
  kodi -fs &

fi

