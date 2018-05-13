alias icecream='/etc/openvpn;sudo openvpn --daemon --config Icecream.ovpn'
alias icecream!='sudo killall openvpn'
alias tor='torbrowser-launcher'

alias drive_up='sudo rclone sync /mnt/BNK/Sync Drive: --delete-during --drive-skip-gdocs --verbose'
alias drive_dwn='sudo rclone sync Drive: /mnt/BNK/Sync --delete-during --drive-skip-gdocs --verbose'

alias extA='veracrypt --mount /dev/disk/by-id/usb-SABRENT_SABRENT_DB98765432143-0:0-part2 --slot=8'
alias extA!='veracrypt -t -d /dev/disk/by-id/usb-SABRENT_SABRENT_DB98765432143-0:0-part2'

alias bnkA='veracrypt --mount /dev/disk/by-id/usb-SABRENT_SABRENT_DB98765432143-0:0-part3 --slot=9'
alias bnkA!='veracrypt -t -d /dev/disk/by-id/usb-SABRENT_SABRENT_DB98765432143-0:0-part3'

alias lnxA='veracrypt --mount /dev/disk/by-id/usb-SABRENT_SABRENT_DB98765432143-0:0-part6 --slot=10'
alias lnxA!='veracrypt -t -d /dev/disk/by-id/usb-SABRENT_SABRENT_DB98765432143-0:0-part6'

alias w10A='veracrypt --mount /dev/disk/by-id/usb-SABRENT_SABRENT_DB98765432143-0:0-part7 --slot=11'
alias w10A!='veracrypt -t -d /dev/disk/by-id/usb-SABRENT_SABRENT_DB98765432143-0:0-part7'

alias extB='veracrypt --mount /dev/disk/by-id/usb-JMicron_JMicron_DB987654321CC-0:0-part2 --slot=12'
alias extB!='veracrypt -t -d /dev/disk/by-id/usb-JMicron_JMicron_DB987654321CC-0:0-part2'

alias bnkB='veracrypt --mount /dev/disk/by-id/usb-JMicron_JMicron_DB987654321CC-0:0-part3 --slot=13'
alias bnkB!='veracrypt -t -d /dev/disk/by-id/usb-JMicron_JMicron_DB987654321CC-0:0-part3'

alias lnxB='veracrypt --mount /dev/disk/by-id/usb-JMicron_JMicron_DB987654321CC-0:0-part6 --slot=14'
alias lnxB!='veracrypt -t -d /dev/disk/by-id/usb-JMicron_JMicron_DB987654321CC-0:0-part6'

alias w10B='veracrypt --mount /dev/disk/by-id/usb-JMicron_JMicron_DB987654321CC-0:0-part7 --slot=15'
alias w10B!='veracrypt -t -d /dev/disk/by-id/usb-JMicron_JMicron_DB987654321CC-0:0-part7'

alias extC='veracrypt --mount /dev/disk/by-id/wwn-0x5002538900000000-part2 --slot=16'
alias extC!='veracrypt -t -d /dev/disk/by-id/wwn-0x5002538900000000-part2'

alias bnkC='veracrypt --mount /dev/disk/by-id/wwn-0x5002538900000000-part3 --slot=17'
alias bnkC!='veracrypt -t -d /dev/disk/by-id/wwn-0x5002538900000000-part3'

alias lnxC='veracrypt --mount /dev/disk/by-id/wwn-0x5002538900000000-part5 --slot=18'
alias lnxC!='veracrypt -t -d /dev/disk/by-id/wwn-0x5002538900000000-part5'

alias winC='veracrypt --mount /dev/disk/by-id/wwn-0x5002538900000000-part6 --slot=19'
alias winC!='veracrypt -t -d /dev/disk/by-id/wwn-0x5002538900000000-part6'

alias MD='veracrypt --mount /dev/disk/by-id/usb-SABRENT_SABRENT_DB98765432143-0:0-part2 --slot=20'
alias MD!='veracrypt -t -d /dev/disk/by-id/usb-SABRENT_SABRENT_DB98765432143-0:0-part2'

alias gryEx='veracrypt --mount /dev/disk/by-id/usb-Seagate_BUP_Slim_SL_NA794A75-0:0-part2 --slot=21'
alias gryEx!='veracrypt -t -d /dev/disk/by-id/usb-Seagate_BUP_Slim_SL_NA794A75-0:0-part2'

alias gryNt='veracrypt --mount /dev/disk/by-id/usb-Seagate_BUP_Slim_SL_NA794A75-0:0-part3 --slot=22'
alias gryNt!='veracrypt -t -d /dev/disk/by-id/usb-Seagate_BUP_Slim_SL_NA794A75-0:0-part3'

alias blkEx='veracrypt --mount /dev/disk/by-id/usb-Seagate_Backup+_BK_NA75NCP3-0:0-part2 --slot=23'
alias blkEx!='veracrypt -t -d /dev/disk/by-id/usb-Seagate_Backup+_BK_NA75NCP3-0:0-part2'

alias bk_extAB='sudo rclone sync /media/veracrypt8 /media/veracrypt12 --verbose'
alias bk_extAC='sudo rclone sync /media/veracrypt8 /media/veracrypt16 --verbose'
alias bk_extBA='sudo rclone sync /media/veracrypt12 /media/veracrypt8 --verbose'
alias bk_extBC='sudo rclone sync /media/veracrypt12 /media/veracrypt16 --verbose'
alias bk_extCA='sudo rclone sync /media/veracrypt16 /media/veracrypt8 --verbose'
alias bk_extCB='sudo rclone sync /media/veracrypt16 /media/veracrypt12 --verbose'

alias bk_bnkA='sudo rclone sync /mnt/BNK /media/veracrypt9 --verbose'
alias bk_bnkB='sudo rclone sync /mnt/BNK /media/veracrypt13 --verbose'
alias bk_bnkC='sudo rclone sync /mnt/BNK /media/veracrypt17 --verbose'

alias bk_lnxA='sudo dd if=/dev/sda8 of=/media/veracrypt10/XX-XX-XX.img status=progress'
alias bk_lnxB='sudo dd if=/dev/sda8 of=/media/veracrypt14/XX-XX-XX.img status=progress'
alias bk_lnxC='sudo dd if=/dev/sda8 of=/media/veracrypt18/XX-XX-XX.img status=progress'

alias fournierDesktop_chrome='google-chrome --profile-directory="Profile 1" --app-id=gbchcmhmhahfdphkhkmpfmihenigjmpp'
