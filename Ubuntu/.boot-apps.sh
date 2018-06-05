#! /bin/bash

MACHINE_ID=$(pkexec dmidecode | awk '/UUID/ {print $2}')

nohup copyq &
git config --global credential.helper "cache --timeout=1512000"

if [ $MACHINE_ID = "5E82B152-965C-55F4-A55F-90E44DA56E82" ]; then
  sleep 1
  nohup redshift -l 40.7:-73.9851 -t 5700:3800 -g 0.8 -m randr &
  veracrypt /dev/disk/by-partuuid/e68c8ec3-9c49-489c-9a0f-339f866920d6 /mnt/BNK --slot=33
elif [ $MACHINE_ID = "6F90D819-796E-8B58-B4FC-1BF8197DB93A" ]; then
  sleep 1
  veracrypt --mount /dev/disk/by-partuuid/2824c02b-422c-4702-acd7-d8bbe8bdcbbf /mnt/MD --slot=20
  nohup kodi -fs &
else
  nohup redshift -l 40.7:-73.9851 -t 5700:3800 -g 0.8 -m randr &
fi

