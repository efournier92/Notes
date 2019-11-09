#!/bin/bash

BkDrive=$1

Datestamp=`date +'%Y-%m-%d'`
zip -r "/mnt/$BkDrive/SysBk/Sync/$Datestamp.zip" "/mnt/BNK/Sync"

