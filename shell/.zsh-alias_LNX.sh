alias icecream='/etc/openvpn;sudo openvpn --daemon --config Icecream.ovpn'
alias tor='torbrowser-launcher'

alias m_bnk='veracrypt /dev/disk/by-partuuid/e68c8ec3-9c49-489c-9a0f-339f866920d6 /mnt/BNK --slot=33'
alias m_bnk!='veracrypt -t -d /dev/disk/by-partuuid/9bd48f56-7489-487c-9c96-9e145b637426'

alias m_extA='veracrypt --mount /dev/disk/by-partuuid/7684c170-a88e-4db8-8759-5a80e99ad74b /mnt/extA --slot=8'
alias m_extA!='veracrypt -t -d /dev/disk/by-partuuid/7684c170-a88e-4db8-8759-5a80e99ad74b'

alias m_extB='veracrypt --mount /dev/disk/by-id/usb-JMicron_JMicron_DB987654321CC-0:0-part2 /mnt/extB --slot=12'
alias m_extB!='veracrypt -t -d /dev/disk/by-id/usb-JMicron_JMicron_DB987654321CC-0:0-part2'

alias m_extC='veracrypt --mount /dev/disk/by-id/wwn-0x5002538900000000-part2 /mnt/extC --slot=16'
alias m_extC!='veracrypt -t -d /dev/disk/by-id/wwn-0x5002538900000000-part2'

alias m_MD='veracrypt --mount /dev/disk/by-partuuid/2824c02b-422c-4702-acd7-d8bbe8bdcbbf /mnt/MD --slot=20'
alias m_MD!='veracrypt -t -d /dev/disk/by-partuuid/2824c02b-422c-4702-acd7-d8bbe8bdcbbf'

alias m_gryEx='veracrypt --mount /dev/disk/by-partuuid/cf03b736-d2cd-44dd-9578-d68844421b83 /mnt/gryEx --slot=21'
alias m_gryEx!='veracrypt -t -d /dev/disk/by-partuuid/cf03b736-d2cd-44dd-9578-d68844421b83'

alias m_gryNt='veracrypt --mount /dev/disk/by-partuuid/b56d5683-3653-4b07-8054-89ea93d058e6 /mnt/gryNt --slot=22'
alias m_gryNt!='veracrypt -t -d /dev/disk/by-partuuid/b56d5683-3653-4b07-8054-89ea93d058e6'

alias m_blkEx='veracrypt --mount /dev/disk/by-partuuid/d68c8953-e5f6-4d51-b202-7b06abeab67f /mnt/blkEx --slot=23'
alias m_blkEx!='veracrypt -t -d /dev/disk/by-partuuid/d68c8953-e5f6-4d51-b202-7b06abeab67f'

alias bk_extAB='sudo rclone sync /mnt/extA /mnt/extB --verbose'
alias bk_extAC='sudo rclone sync /mnt/extA /mnt/extC --verbose'
alias bk_extBA='sudo rclone sync /mnt/extB /mnt/extA --verbose'
alias bk_extBC='sudo rclone sync /mnt/extB /mnt/extC --verbose'
alias bk_extCA='sudo rclone sync /mnt/extC /mnt/extA --verbose'
alias bk_extCB='sudo rclone sync /mnt/extC /mnt/extB --verbose'
alias bk_AMD='sudo rclone sync /mnt/extA/Media /mnt/MD --verbose'
alias bk_gryblk='rclone sync /mnt/gryEx/PRJTS /mnt/blkEx/PRJTS --verbose ; rclone sync /mnt/gryEx/aLg /mnt/blkEx/aLg --verbose ; rclone sync /mnt/gryNt/Nx /mnt/blkEx/Nx --verbose ; rclone sync /mnt/gryNt/VM /mnt/blkEx/VM --verbose'

alias bk_bnkA='sudo rclone sync /mnt/BNK /mnt/extA/Bk/BNK --verbose'
alias bk_bnkB='sudo rclone sync /mnt/BNK /mnt/extB/Bk/BNK --verbose'
alias bk_bnkC='sudo rclone sync /mnt/BNK /mnt/extC/Bk/BNK --verbose'

alias bk_bkAB='sudo rclone sync /mnt/bkA /mnt/bkB --verbose'
alias bk_bkBA='sudo rclone sync /mnt/bkB /mnt/bkA --verbose'
alias bk_bkAC='sudo rclone sync /mnt/bkA /mnt/bkC --verbose'

alias driveUp='sudo rclone sync /mnt/BNK/Sync Drive: --delete-during --drive-skip-gdocs --verbose'
alias driveDwn='sudo rclone sync Drive: /mnt/BNK/Sync --delete-during --drive-skip-gdocs --verbose'

alias fournierDesktop_chrome='google-chrome --profile-directory="Profile 1" --app-id=gbchcmhmhahfdphkhkmpfmihenigjmpp'

