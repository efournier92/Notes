#! /bin/bash

BOARD_ID=$(dmidecode -s baseboard-serial-number)

MB2015_ID='C02639600FUGQ101K'
MHUB_ID='C0715060AXMDKP2AQ'

sudo -u $USER copyq &
git config --global credential.helper "cache --timeout=1512000"

if [ $BOARD_ID = $MB2015_ID ]; then
  sleep 1
  redshift -l 40.7:-73.9851 -t 5700:3800 -g 0.8 -m randr &
  systemctl start mongodb &
  sudo -u $USER veracrypt /dev/disk/by-partuuid/e68c8ec3-9c49-489c-9a0f-339f866920d6 /mnt/BNK --slot=33 &

elif [ $BOARD_ID = $MHUB_ID ]; then
  sleep 1
  sudo -u $USER veracrypt --mount /dev/disk/by-partuuid/2824c02b-422c-4702-acd7-d8bbe8bdcbbf /mnt/MD --slot=20 &
  sudo -u $USER kodi -fs &

else
  redshift -l 40.7:-73.9851 -t 5700:3800 -g 0.8 -m randr &
fi

