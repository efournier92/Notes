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

## Custom ROM Installation

### Unlock Bootloader

1. Enable USB Debugging in the `Developer Options`
2. Enable OEM unlock in the `Developer Options`
3. Connect device to computer
4. Enter `fastboot` mode: `$ sudo adb reboot bootloader` or reboot while holding `Volume Down + Power`
5. Verify device connection: `$ sudo fastboot devices`
6. Unlock device `$ fastboot flashing unlock`
7. Reboot

### Install TWRP
1. [Download TWRP](https://dl.twrp.me/bullhead/twrp-3.0.2-2-bullhead.img)
2. Connect device to computer
3. Enter `fastboot` mode: `$ sudo adb reboot bootloader` or reboot while holding `Volume Down + Power`
4. Verify device connection: `$ sudo fastboot devices`
5. `$ fastboot flash recovery twrp-3.0.2-2-bullhead.img`

### Root Device
1. [Download SuperSU](http://www.supersu.com/download)
2. Copy downloaded zip file to device
3. Enter `fastboot` mode: `$ sudo adb reboot bootloader` or reboot while holding `Volume Down + Power`
4. Enter `recovery` mode using via bootloader
5. Select `Install`, locate the SuperSU zip file, and install it
6. Select `reboot` from the main TWRP menu

### Flash Custom ROM
1. Choose & Download Desired Custom ROM
2. Copy downloaded zip file to device
3. Enter `fastboot` mode: `$ sudo adb reboot bootloader` or reboot while holding `Volume Down + Power`
4. Enter `recovery` mode using via bootloader
5. Select `Install`, locate the ROM zip file, and install it
6. Select `reboot` from the main TWRP menu

## Root Commands

### `fastboot`
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

### `adb` 
```
sudo adb devices
adb sideload SuperSU-v2.82-201705271822.zip
adb sideload purenexus_bullhead-7.1.2-20170612-OFFICIAL.zip
adb sideload BeansGapps-Mini-7.1.x-20170610.zip
```

