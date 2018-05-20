alias icecream='/etc/openvpn;sudo openvpn --daemon --config Icecream.ovpn'
alias icecream!='sudo killall openvpn'
alias tor='torbrowser-launcher'

alias bnkMnt='veracrypt /dev/disk/by-partuuid/9bd48f56-7489-487c-9c96-9e145b637426 /mnt/BNK --slot=33'
alias bnkMnt!='veracrypt -t -d /dev/disk/by-partuuid/9bd48f56-7489-487c-9c96-9e145b637426'

alias extA='veracrypt --mount /dev/disk/by-partuuid/7684c170-a88e-4db8-8759-5a80e99ad74b /mnt/extA --slot=8'
alias extA!='veracrypt -t -d /dev/disk/by-partuuid/7684c170-a88e-4db8-8759-5a80e99ad74b'

alias extB='veracrypt --mount /dev/disk/by-id/usb-JMicron_JMicron_DB987654321CC-0:0-part2 /mnt/extB --slot=12'
alias extB!='veracrypt -t -d /dev/disk/by-id/usb-JMicron_JMicron_DB987654321CC-0:0-part2'

alias extC='veracrypt --mount /dev/disk/by-id/wwn-0x5002538900000000-part2 /mnt/extC --slot=16'
alias extC!='veracrypt -t -d /dev/disk/by-id/wwn-0x5002538900000000-part2'

alias MD='veracrypt --mount /dev/disk/by-partuuid/2824c02b-422c-4702-acd7-d8bbe8bdcbbf /mnt/MD --slot=20'
alias MD!='veracrypt -t -d /dev/disk/by-partuuid/2824c02b-422c-4702-acd7-d8bbe8bdcbbf'

alias gryEx='veracrypt --mount /dev/disk/by-partuuid/cf03b736-d2cd-44dd-9578-d68844421b83 /mnt/gryEx --slot=21'
alias gryEx!='veracrypt -t -d /dev/disk/by-partuuid/cf03b736-d2cd-44dd-9578-d68844421b83'

alias gryNt='veracrypt --mount /dev/disk/by-partuuid/b56d5683-3653-4b07-8054-89ea93d058e6 /mnt/gryNt --slot=22'
alias gryNt!='veracrypt -t -d /dev/disk/by-partuuid/b56d5683-3653-4b07-8054-89ea93d058e6'

alias blkEx='veracrypt --mount /dev/disk/by-id/usb-Seagate_Backup+_BK_NA75NCP3-0:0-part2 /mnt/blkEx --slot=23'
alias blkEx!='veracrypt -t -d /dev/disk/by-id/usb-Seagate_Backup+_BK_NA75NCP3-0:0-part2'

alias bk_extAB='sudo rclone sync /mnt/extA /mnt/extB --verbose'
alias bk_extAC='sudo rclone sync /mnt/extA /mnt/extC --verbose'
alias bk_extBA='sudo rclone sync /mnt/extB /mnt/extA --verbose'
alias bk_extBC='sudo rclone sync /mnt/extB /mnt/extC --verbose'
alias bk_extCA='sudo rclone sync /mnt/extC /mnt/extA --verbose'
alias bk_extCB='sudo rclone sync /mnt/extC /mnt/extB --verbose'
alias bk_AMD='sudo rclone sync /mnt/extA/Media /mnt/MD --verbose'

alias bk_bnkA='sudo rclone sync /mnt/BNK /mnt/BKA/BNK --verbose'
alias bk_bnkB='sudo rclone sync /mnt/BNK /mnt/BKB/BNK --verbose'
alias bk_bnkC='sudo rclone sync /mnt/BNK /mnt/BKC/BNK --verbose'

alias driveUp='sudo rclone sync /mnt/BNK/Sync Drive: --delete-during --drive-skip-gdocs --verbose'
alias driveDwn='sudo rclone sync Drive: /mnt/BNK/Sync --delete-during --drive-skip-gdocs --verbose'

alias fournierDesktop_chrome='google-chrome --profile-directory="Profile 1" --app-id=gbchcmhmhahfdphkhkmpfmihenigjmpp'

