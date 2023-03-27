# Android

## Contents
- [Overview](#overview)
- [TWRP](#twrp)
- [Install Custom ROMs](#install-custom-roms)
- [Rooting Commands](#rooting-commands)
- [Applications](#applications)

## Overview
- When it comes to mobile device Operating Systems, [Android](https://www.android.com/) has become the norm across a multitude of non-desktop devices. I like it because it's based on the Linux kernel, and is a lot more open than [iOS](https://www.apple.com/ios/). I usually install a [custom ROM](https://en.wikipedia.org/wiki/List_of_custom_Android_distributions) and a whole bunch of apps, as detailed below.

## [TWRP](https://twrp.me/about/)

### Description
- A custom Recovery tool, used for installing custom software, backup, restoration, and more.

#### Backup
1. Boot into TWRP recovery mode.
1. Select `Backup`.
1. Uncheck everything except `Data (excl. storage)`.
1. Swipe to Backup.
1. Copy `/TWRP` directory contents to backup location.

#### Restore
1. Copy ROM, `OpenGApps`, and `SuperSU` to device.
1. Boot into `TWRP` recovery mode.
1. Install ROM.
1. Install `SuperSU`.
1. Reboot to system and skip setup.
1. Reboot to recovery.
1. Install `OpenGApps`.
1. Reboot to system.
1. Reboot to recovery.
1. Select `Backup`.
1. Uncheck everything except `Boot`.
1. Swipe to Backup.
1. Copy TWRP from backup location to the backup folder created in step 12.
1. Select `Restore`.
1. Uncheck everything except `Data (excl. storage)`.
1. Swipe to restore.
1. Reboot to system.

## Installing [Custom ROMs](https://en.wikipedia.org/wiki/List_of_custom_Android_distributions)

### Description
- In order to install a [custom ROM](https://en.wikipedia.org/wiki/List_of_custom_Android_distributions) on a device, the following steps must first be performed.

### Steps

#### 1. Unlock Bootloader
1. Enable USB Debugging in the `Developer Options`.
1. Enable OEM unlock in the `Developer Options`.
1. Connect device to computer.
1. Enter `fastboot` mode: `$ sudo adb reboot bootloader` or reboot while holding `Volume Down + Power`.
1. Verify device connection: `$ sudo fastboot devices`.
1. Unlock device `$ fastboot flashing unlock`.
1. Reboot the device.

#### 2. Install TWRP
1. [Download TWRP](https://dl.twrp.me/bullhead/twrp-3.0.2-2-bullhead.img).
1. Connect device to computer.
1. Enter `fastboot` mode: `$ sudo adb reboot bootloader` or reboot while holding `Volume Down + Power`.
1. Verify device connection: `$ sudo fastboot devices`.
1. `$ fastboot flash recovery twrp-3.0.2-2-bullhead.img`>

#### 3. Root Device
1. [Download SuperSU](http://www.supersu.com/download)>
1. Copy downloaded zip file to device.
1. Enter `fastboot` mode: `$ sudo adb reboot bootloader` or reboot while holding `Volume Down + Power`.
1. Enter `recovery` mode using via bootloader.
1. Select `Install`, locate the SuperSU zip file, and install it.
1. Select `reboot` from the main TWRP menu.

#### 4. Flash Custom ROM
1. Choose & Download Desired Custom ROM.
1. Copy downloaded zip file to device.
1. Enter `fastboot` mode: `$ sudo adb reboot bootloader` or reboot while holding `Volume Down + Power`.
1. Enter `recovery` mode using via bootloader.
1. Select `Install`, locate the ROM zip file, and install it.
1. Select `reboot` from the main TWRP menu.

## [Rooting](https://en.wikipedia.org/wiki/Rooting_(Android)) Commands

### Description
- The following commands come in handy while [rooting](https://en.wikipedia.org/wiki/Rooting_(Android)) an Android device.

### Commands

#### List Available Devices

```bash
sudo adb devices
```

#### Install [SuperSU](http://www.supersu.com/)

```bash
adb sideload SuperSU-v2.82-201705271822.zip
```

#### Install [Custom ROM](https://en.wikipedia.org/wiki/List_of_custom_Android_distributions)

```bash
adb sideload purenexus_bullhead-7.1.2-20170612-OFFICIAL.zip
```

#### Install [Open GAPS](https://opengapps.org/)

```bash
adb sideload BeansGapps-Mini-7.1.x-20170610.zip
```

#### Flash Boot

```bash
fastboot flash boot boot.img
```

#### Flash Bootloader

```bash
fastboot flash bootloader bootloader-bullhead-bhz11m.img
```

#### Reboot Bootloader

```bash
fastboot reboot-bootloader
```

#### Flash Radio

```bash
fastboot flash radio radio-bullhead-m8994f-2.6.37.2.21.img
```

#### Flash Recovery

```bash
fastboot flash recovery twrp-3.0.2-0-bullhead.img
```

#### Flash System

```bash
fastboot flash system system.img
```

#### Flash Vendor

```bash
fastboot flash vendor vendor.img
```

#### Format Cache

```bash
fastboot format cache
```

#### Format User Data

```bash
fastboot format userdata
```

## Applications

### Description
- This is a comprehensive list of Android Apps I find useful, and usually install on my devices.

### List
- ADE
- Calculator
- Camera
- Chrome
- Clock
- Compass
- Drive
- Double Twist
- Good Vibrations
- I Can't Wake Up (Alarm)
- Jess(CereProc)
- Kodi
- Lyft
- Maps
- MTA eTix
- MYmta
- Native Clipboard
- Oculus
- OpenVPN
- Out Loud
- Outlook
- Phone
- Photo Gallery
- Play Store
- Pushbullet
- Score
- Shazam
- SimpleNote
- Skype
- Solid Explorer
- Substratum
- Swift Dark
- Textra
- Transit
- Tuner
- TWRP
- Uber
- Voice Recorder
- WearOS
- Weather
- WhatsApp

