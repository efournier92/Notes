# Nexus 5X Configuration

## Apps
* ADE
* Calculator
* Camera
* Chrome
* Clock
* Compass
* Drive
* Double Twist
* I Can't Wake Up (Alarm)
* Jess(CereProc)
* Kodi
* Lyft
* Maps
* MTA eTix
* Native Clipboard
* Oculus
* OpenVPN
* Out Loud
* Outlook
* Phone
* Photo Gallery
* Pushbullet
* Score
* Shazam
* SimpleNote
* Skype
* Solid Explorer
* Substratum
* Textra
* Transit
* Uber
* Voice Recorder
* WearOS
* WhatsApp

## Root Commands

### Fastboot
```
fastboot flash boot boot.img
fastboot flash bootloader bootloader-bullhead-bhz11m.img
fastboot reboot-bootloader
fastboot flash radio radio-bullhead-m8994f-2.6.37.2.21.img
fastboot flash recovery twrp-3.0.2-0-bullhead.img
fastboot flash system system.img
fastboot flash vendor vendor.img
fastboot format cache
fastboot format userdata
```

### ADB
```
adb sideload SuperSU-v2.82-201705271822.zip
adb sideload purenexus_bullhead-7.1.2-20170612-OFFICIAL.zip
adb sideload BeansGapps-Mini-7.1.x-20170610.zip
```


