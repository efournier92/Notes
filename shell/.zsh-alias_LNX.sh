alias bnk_mnt='/home/misigno/.bnk_mnt'
alias icecream='/etc/openvpn;sudo openvpn --daemon --config Icecream.ovpn'
alias fournierDesktop_chrome='google-chrome --profile-directory="Profile 1" --app-id=gbchcmhmhahfdphkhkmpfmihenigjmpp'
alias tor='nohup tor-browser-en.sh &'
alias blank_board='whyteboard ~/.whyteboard/whyteboard.wtbd'

alias extA_mnt='veracrypt --mount /dev/disk/by-id/usb-SABRENT_SABRENT_DB98765432143-0:0-part2 --slot=8'
alias extA_unmnt='veracrypt -t -d /dev/disk/by-id/usb-SABRENT_SABRENT_DB98765432143-0:0-part2'

alias bnkA_mnt='veracrypt --mount /dev/disk/by-id/usb-SABRENT_SABRENT_DB98765432143-0:0-part3 --slot=9'
alias bnkA_unmnt='veracrypt -t -d /dev/disk/by-id/usb-SABRENT_SABRENT_DB98765432143-0:0-part3'

alias lnxA_mnt='veracrypt --mount /dev/disk/by-id/usb-SABRENT_SABRENT_DB98765432143-0:0-part6 --slot=10'
alias lnxA_unmnt='veracrypt -t -d /dev/disk/by-id/usb-SABRENT_SABRENT_DB98765432143-0:0-part6'

alias w10A_mnt='veracrypt --mount /dev/disk/by-id/usb-SABRENT_SABRENT_DB98765432143-0:0-part7 --slot=11'
alias w10A_unmnt='veracrypt -t -d /dev/disk/by-id/usb-SABRENT_SABRENT_DB98765432143-0:0-part7'

alias extB_mnt='veracrypt --mount /dev/disk/by-id/usb-JMicron_JMicron_DB987654321CC-0:0-part2 --slot=12'
alias extB_unmnt='veracrypt -t -d /dev/disk/by-id/usb-JMicron_JMicron_DB987654321CC-0:0-part2'

alias bnkB_mnt='veracrypt --mount /dev/disk/by-id/usb-JMicron_JMicron_DB987654321CC-0:0-part3 --slot=13'
alias bnkB_unmnt='veracrypt -t -d /dev/disk/by-id/usb-JMicron_JMicron_DB987654321CC-0:0-part3'

alias lnxB_mnt='veracrypt --mount /dev/disk/by-id/usb-JMicron_JMicron_DB987654321CC-0:0-part6 --slot=14'
alias lnxB_unmnt='veracrypt -t -d /dev/disk/by-id/usb-JMicron_JMicron_DB987654321CC-0:0-part6'

alias w10B_mnt='veracrypt --mount /dev/disk/by-id/usb-JMicron_JMicron_DB987654321CC-0:0-part7 --slot=15'
alias w10B_unmnt='veracrypt -t -d /dev/disk/by-id/usb-JMicron_JMicron_DB987654321CC-0:0-part7'

alias extC_mnt='veracrypt --mount /dev/disk/by-id/wwn-0x5002538900000000-part2 --slot=16'
alias extC_unmnt='veracrypt -t -d /dev/disk/by-id/wwn-0x5002538900000000-part2'

alias bnkC_mnt='veracrypt --mount /dev/disk/by-id/wwn-0x5002538900000000-part3 --slot=17'
alias bnkC_unmnt='veracrypt -t -d /dev/disk/by-id/wwn-0x5002538900000000-part3'

alias lnxC_mnt='veracrypt --mount /dev/disk/by-id/wwn-0x5002538900000000-part5 --slot=18'
alias lnxC_unmnt='veracrypt -t -d /dev/disk/by-id/wwn-0x5002538900000000-part5'

alias winC_mnt='veracrypt --mount /dev/disk/by-id/wwn-0x5002538900000000-part6 --slot=19'
alias winC_unmnt='veracrypt -t -d /dev/disk/by-id/wwn-0x5002538900000000-part6'

alias blkEx_mnt='veracrypt --mount /dev/disk/by-id/usb-Seagate_Backup+_BK_NA75NCP3-0:0-part2 --slot=5'
alias blkEx_unmnt='veracrypt -t -d /dev/disk/by-id/usb-Seagate_Backup+_BK_NA75NCP3-0:0-part2'

alias gryEx_mnt='veracrypt --mount /dev/disk/by-id/usb-Seagate_BUP_Slim_SL_NA794A75-0:0-part2 --slot=3'
alias gryEx_unmnt='veracrypt -t -d /dev/disk/by-id/usb-Seagate_BUP_Slim_SL_NA794A75-0:0-part2'

alias gryNt_mnt='veracrypt --mount /dev/disk/by-id/usb-Seagate_BUP_Slim_SL_NA794A75-0:0-part3 --slot=4'
alias gryNt_unmnt='veracrypt -t -d /dev/disk/by-id/usb-Seagate_BUP_Slim_SL_NA794A75-0:0-part3'

alias drive_up='sudo rclone sync /mnt/BNK/Sync Drive: --delete-during --drive-skip-gdocs --verbose'
alias drive_dwn='sudo rclone sync Drive: /mnt/BNK/Sync --delete-during --drive-skip-gdocs --verbose'

alias bk_extA-B='sudo rclone sync /media/veracrypt8 /media/veracrypt12 --verbose'
alias bk_extA-C='sudo rclone sync /media/veracrypt8 /media/veracrypt16 --verbose'
alias bk_extB-A='sudo rclone sync /media/veracrypt12 /media/veracrypt8 --verbose'
alias bk_extB-C='sudo rclone sync /media/veracrypt12 /media/veracrypt16 --verbose'
alias bk_extC-A='sudo rclone sync /media/veracrypt16 /media/veracrypt8 --verbose'
alias bk_extC-B='sudo rclone sync /media/veracrypt16 /media/veracrypt12 --verbose'

alias bk_bnkA='sudo rclone sync /mnt/BNK /media/veracrypt9 --verbose'
alias bk_bnkB='sudo rclone sync /mnt/BNK /media/veracrypt13 --verbose'
alias bk_bnkC='sudo rclone sync /mnt/BNK /media/veracrypt17 --verbose'

alias bk_lnxA='sudo dd if=/dev/sda8 of=/media/veracrypt10/XX-XX-XX.img status=progress'
alias bk_lnxB='sudo dd if=/dev/sda8 of=/media/veracrypt14/XX-XX-XX.img status=progress'
alias bk_lnxC='sudo dd if=/dev/sda8 of=/media/veracrypt18/XX-XX-XX.img status=progress'

