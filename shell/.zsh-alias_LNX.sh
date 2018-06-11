alias icecream='/etc/openvpn;sudo openvpn --daemon --config Icecream.ovpn'
alias icecream!='sudo killall openvpn'
alias tor='torbrowser-launcher'

alias mnt_bnk='veracrypt /dev/disk/by-partuuid/e68c8ec3-9c49-489c-9a0f-339f866920d6 /mnt/BNK --slot=33'
alias mnt_bnk!='veracrypt -t -d /dev/disk/by-partuuid/9bd48f56-7489-487c-9c96-9e145b637426'

alias mnt_MD='veracrypt --mount /dev/disk/by-partuuid/2824c02b-422c-4702-acd7-d8bbe8bdcbbf /mnt/MD --slot=20'
alias mnt_MD!='veracrypt -t -d /dev/disk/by-partuuid/2824c02b-422c-4702-acd7-d8bbe8bdcbbf'

alias mnt_extA='veracrypt --mount /dev/disk/by-partuuid/7684c170-a88e-4db8-8759-5a80e99ad74b /mnt/extA --slot=8'
alias mnt_extA!='veracrypt -t -d /dev/disk/by-partuuid/7684c170-a88e-4db8-8759-5a80e99ad74b'

alias mnt_bnkA='veracrypt --mount /dev/disk/by-partuuid/f74c66d5-c6fb-48a0-9d6d-73f03825e987 /mnt/bnkA --slot=9'
alias mnt_bnkA!='veracrypt -t -d /dev/disk/by-partuuid/f74c66d5-c6fb-48a0-9d6d-73f03825e987'

alias mnt_extB='veracrypt --mount /dev/disk/by-partuuid/165e34c0-708f-4700-99c9-65bdc632a1d9 /mnt/extB --slot=12'
alias mnt_extB!='veracrypt -t -d /dev/disk/by-id/usb-JMicron_JMicron_DB987654321CC-0:0-part2'

alias mnt_bnkB='veracrypt --mount /dev/disk/by-partuuid/8746ae50-65d7-4db1-b665-dec1cfda7454 /mnt/bnkB --slot=13'
alias mnt_bnkB!='veracrypt -t -d /dev/disk/by-partuuid/8746ae50-65d7-4db1-b665-dec1cfda7454'

alias mnt_extC='veracrypt --mount /dev/disk/by-id/wwn-0x5002538900000000-part2 /mnt/extC --slot=16'
alias mnt_extC!='veracrypt -t -d /dev/disk/by-id/wwn-0x5002538900000000-part2'

alias mnt_gryEx='veracrypt --mount /dev/disk/by-partuuid/cf03b736-d2cd-44dd-9578-d68844421b83 /mnt/gryEx --slot=21'
alias mnt_gryEx!='veracrypt -t -d /dev/disk/by-partuuid/cf03b736-d2cd-44dd-9578-d68844421b83'

alias mnt_gryNt='veracrypt --mount /dev/disk/by-partuuid/b56d5683-3653-4b07-8054-89ea93d058e6 /mnt/gryNt --slot=22'
alias mnt_gryNt!='veracrypt -t -d /dev/disk/by-partuuid/b56d5683-3653-4b07-8054-89ea93d058e6'

alias mnt_blkEx='veracrypt --mount /dev/disk/by-id/usb-Seagate_Backup+_BK_NA75NCP3-0:0-part2 /mnt/blkEx --slot=23'
alias mnt_blkEx!='veracrypt -t -d /dev/disk/by-id/usb-Seagate_Backup+_BK_NA75NCP3-0:0-part2'

alias bk_extAB='sudo rclone sync /mnt/extA /mnt/extB --verbose'
alias bk_extAC='sudo rclone sync /mnt/extA /mnt/extC --verbose'
alias bk_extBA='sudo rclone sync /mnt/extB /mnt/extA --verbose'
alias bk_extBC='sudo rclone sync /mnt/extB /mnt/extC --verbose'
alias bk_extCA='sudo rclone sync /mnt/extC /mnt/extA --verbose'
alias bk_extCB='sudo rclone sync /mnt/extC /mnt/extB --verbose'
alias bk_AMD='sudo rclone sync /mnt/extA/Media /mnt/MD --verbose'

alias bk_bnkA='sudo rclone sync /mnt/BNK /mnt/bnkA --verbose'
alias bk_bnkB='sudo rclone sync /mnt/BNK /mnt/bnkB --verbose'
alias bk_bnkC='sudo rclone sync /mnt/BNK /mnt/bnkC --verbose'

alias bk_drvUp='sudo rclone sync /mnt/BNK/Sync Drive: --delete-during --drive-skip-gdocs --verbose'
alias bk_drvDwn='sudo rclone sync Drive: /mnt/BNK/Sync --delete-during --drive-skip-gdocs --verbose'

alias fournierDesktop_chrome='google-chrome --profile-directory="Profile 1" --app-id=gbchcmhmhahfdphkhkmpfmihenigjmpp'

