alias tor='nohup tor-browser-en.sh &'

alias icecream='/etc/openvpn;sudo openvpn --daemon --config Icecream.ovpn'

alias fournierDesktop_chrome='google-chrome --profile-directory="Profile 1" --app-id=gbchcmhmhahfdphkhkmpfmihenigjmpp'

alias bnk_mnt='/home/misigno/.bnk_mnt'

alias extA_mnt='veracrypt --mount /dev/disk/by-id/usb-SABRENT_SABRENT_DB98765432143-0:0-part2 --slot=1'
alias extA_unmnt='veracrypt -t -d /dev/disk/by-id/usb-SABRENT_SABRENT_DB98765432143-0:0-part2'

alias extB_mnt='veracrypt --mount /dev/disk/by-id/usb-JMicron_JMicron_DB987654321CC-0:0-part2 --slot=2'
alias extB_unmnt='veracrypt -t -d /dev/disk/by-id/usb-JMicron_JMicron_DB987654321CC-0:0-part2'

alias extC_mnt='veracrypt --mount /dev/disk/by-id/wwn-0x5002538900000000-part2 --slot=6'
alias extC_unmnt='veracrypt -t -d /dev/disk/by-id/wwn-0x5002538900000000-part2'

alias bnkC_mnt='veracrypt --mount /dev/disk/by-id/wwn-0x5002538900000000-part3 --slot=7'
alias bnkC_unmnt='veracrypt -t -d /dev/disk/by-id/wwn-0x5002538900000000-part3'

alias osxC_mnt='veracrypt --mount /dev/disk/by-id/wwn-0x5002538900000000-part4 --slot=8'
alias osxC_unmnt='veracrypt -t -d /dev/disk/by-id/wwn-0x5002538900000000-part4'

alias lnxC_mnt='veracrypt --mount /dev/disk/by-id/wwn-0x5002538900000000-part5 --slot=9'
alias lnxC_unmnt='veracrypt -t -d /dev/disk/by-id/wwn-0x5002538900000000-part5'

alias winC_mnt='veracrypt --mount /dev/disk/by-id/wwn-0x5002538900000000-part6 --slot=10'
alias winC_unmnt='veracrypt -t -d /dev/disk/by-id/wwn-0x5002538900000000-part6'

alias blkEx_mnt='veracrypt --mount /dev/disk/by-id/usb-Seagate_Backup+_BK_NA75NCP3-0:0-part2 --slot=5'
alias blkEx_unmnt='veracrypt -t -d /dev/disk/by-id/usb-Seagate_Backup+_BK_NA75NCP3-0:0-part2'

alias gryEx_mnt='veracrypt --mount /dev/disk/by-id/usb-Seagate_BUP_Slim_SL_NA794A75-0:0-part2 --slot=3'
alias gryEx_unmnt='veracrypt -t -d /dev/disk/by-id/usb-Seagate_BUP_Slim_SL_NA794A75-0:0-part2'

alias gryNt_mnt='veracrypt --mount /dev/disk/by-id/usb-Seagate_BUP_Slim_SL_NA794A75-0:0-part3 --slot=4'
alias gryNt_unmnt='veracrypt -t -d /dev/disk/by-id/usb-Seagate_BUP_Slim_SL_NA794A75-0:0-part3'

alias drive_up='sudo rclone sync /mnt/BNK/Sync Drive: --delete-during --drive-skip-gdocs --verbose'
alias drive_dwn='sudo rclone sync Drive: /mnt/BNK/Sync --delete-during --drive-skip-gdocs --verbose'

alias bk_A-B='sudo rclone sync /media/veracrypt1 /media/veracrypt2 --verbose'

alias blank_board='whyteboard ~/.whyteboard/whyteboard.wtbd'

