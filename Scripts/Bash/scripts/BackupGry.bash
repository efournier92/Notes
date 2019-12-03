#!/bin/bash

DestinationDir=$1

if [[ ! $DestinationDir == *"ext"* ]]; then
  rclone sync /mnt/gryEx/PRJTS /mnt/$DestinationDir/PRJTS --verbose
fi 
rclone sync /mnt/gryEx/aLg /mnt/$DestinationDir/aLg --verbose
rclone sync /mnt/gryNt/Nx /mnt/$DestinationDir/Nx --verbose
rclone sync /mnt/gryNt/VM /mnt/$DestinationDir/VM --verbose

