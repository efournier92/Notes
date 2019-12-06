#!/bin/bash

destination_dir=$1

if [[ ! $destination_dir == *"ext"* ]]; then
  rclone sync /mnt/gryEx/PRJTS /mnt/$destination_dir/PRJTS --verbose
fi 
rclone sync /mnt/gryEx/aLg /mnt/$destination_dir/aLg --verbose
rclone sync /mnt/gryNt/Nx /mnt/$destination_dir/Nx --verbose
rclone sync /mnt/gryNt/VM /mnt/$destination_dir/VM --verbose

