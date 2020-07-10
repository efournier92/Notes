#!/bin/bash

# Constants
huawei_2019_id="BB8310193C000132"
macbook_2015_id="C02639600FUGQ101K"
mhub_id="C0715060AXMDKP2AQ"
touchscreen_id="SYNA2393:00 06CB:19AC"

# Determine motherboard ID
motherboard_id="$( pkexec dmidecode -s baseboard-serial-number )"

# Load alias files
shopt -s expand_aliases
for file in ~/.zsh/aliases/*.zsh; do
  source "$file"
done

# Prevent UI scaling bugs
sleep 1

# Laptop
if [[ "$motherboard_id" = "$huawei_2019_id" || "$motherboard_id" = "$macbook_2015_id" ]]; then
  xinput disable "$touchscreen_id"
  copyq &
  copyq disable
  m_bnk
  gnome-terminal --window --maximize

# Media
elif [[ "$motherboard_id" = "$mhub_id" ]]; then
  m_md
  kodi -fs &

fi

