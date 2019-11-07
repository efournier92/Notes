# [LIRC](http://www.lirc.org/) Configuration

## Contents
- [Overview](#overview)
- [Commands](#commands)
  - [Install](#install)
  - [Start Process](#start-process)
  - [Stop Process](#stop-process)
  - [Kill Process](#kill-process)
  - [Refresh Configuration](#refresh-configuration)
  - [Record Button Presses to File](#record-button-presses-to-file)
  - [Check IR Input](#check-ir-input)
  - [Check Remote Control Configuration](#check-remote-control-configuration)
  - [Modify Remote Controls](#modify-remote-controls)
  - [Start `ir-keytable`](#start-ir-keytable)
  - [Start `Kodi`](#start-kodi)
- [Custom Configuration Files](#custom configuration files)
  - [`lircmap`](#lircmap)
- [Important Directories](#important-directories)
- [Important Files](#important-files)
- [Useful Links](#useful-links)

## Overview
[LIRC](http://www.lirc.org/) is a handy open-source tool sending and decoding infra-red signals. It has to power to enable any device with a USB slot to receive signals from most universal remote. I use this with my home theatre setup, and find the following commands useful.

## Commands

### Install

#### Description
Install [LIRC](http://www.lirc.org/) via [apt](https://en.wikipedia.org/wiki/APT_(software)).

#### Command
```bash
sudo apt-get install lirc
```

### Start Process

#### Description
Start the [LIRC](http://www.lirc.org/) process.

#### Command
```bash
sudo lircd -n --driver=devinput --device=/dev/input/event4 ~/HARMONY_350.lircd.conf
```

### Stop Process

#### Description
Attempt to stop [LIRC](http://www.LIRC.org/) process gracefully.

#### Command
```bash
/etc/init.d/lircd stop
```

### Kill Process

#### Description
Kill [LIRC](http://www.lirc.org/) process.

#### Command
```bash
sudo kill $(pidof lircd)
```

### Refresh Configuration

#### Description
Refresh [LIRC](http://www.lirc.org/) configuration cache.

#### Command
```bash
/etc/init.d/lircd reload
```

### Record Button Presses to File

#### Description
Record [IR](https://en.wikipedia.org/wiki/Consumer_IR) button presses to a system file.

#### To a New File
```bash
sudo irrecord -n -d /dev/input/event4 -H devinput
```

#### To a Preexisting File
```bash
sudo irrecord -n -d /dev/input/event4 -H devinput -u
```

### Check IR Input

#### Description
View [IR](https://en.wikipedia.org/wiki/Consumer_IR) input details using [mode2](http://www.lirc.org/html/mode2.html).

#### Command
```bash
sudo mode2 -d /dev/input/event4
```

### Check Remote Control Configuration

#### Description
View Remote Configuration details via [irw](http://www.lirc.org/html/irw.html).

#### Command
```bash
irw
```

### Modify Remote Controls

#### Description
Update remote mappings for [X11](https://en.wikipedia.org/wiki/X_Window_System) systems.

#### Command
```bash
sudo vim /etc/X11/xorg.conf.d/00-ir.conf 
```

### Install [ir-keytable](http://manpages.ubuntu.com/manpages/bionic/man1/ir-keytable.1.html)

#### Description
Install [ir-keytable](http://manpages.ubuntu.com/manpages/bionic/man1/ir-keytable.1.html) via [apt](https://en.wikipedia.org/wiki/APT_(software)), for additional remote control functionality.

#### Command
```bash
sudo apt-get install ir-keytable
```

### Start [ir-keytable](http://manpages.ubuntu.com/manpages/bionic/man1/ir-keytable.1.html)

#### Description
Open [ir-keytable](http://manpages.ubuntu.com/manpages/bionic/man1/ir-keytable.1.html) from the terminal.

#### Command
```bash
sudo ir-keytable -d /dev/input/event4
```

### Start [Kodi](https://kodi.tv/)

#### Description
Open [Kodi](https://kodi.tv/) from the terminal.

#### Command
```bash
kodi -l /var/run/lirc/lircd
```

## Custom Configuration Files

### `00-ir`

#### Location
[Github](https://github.com/efournier92/Notes/blob/master/lirc/00-ir.conf)

### `HARMONY_350.lircd.conf`

#### Location
[Github](https://github.com/efournier92/Notes/blob/master/Lirc/HARMONY_350.lircd.conf)

### `lircmap`

#### Location
[Github](https://github.com/efournier92/Notes/blob/master/Lirc/lircmap.conf)

## Important Directories
- `/usr/share/lirc/`
- `/etc/lirc/`
- `/etc/lirc/lircd.conf.d/`
- `/var/run/lirc/`
- `/dev/input/`
- `~/.kodi/userdata/`

## Important Files
- `/etc/lirc/lircd.conf.d/HARMONY_350.lircd.conf`
- `~/.kodi/userdata/lircmap.xml`
- `/etc/X11/xorg.conf.d/00-ir.conf`

## Useful Links
- [LIRC Configuration Guide](http://www.lirc.org/html/configuration-guide.html)
- [Ubuntu HTPC on a Mac mini (late 2012)](https://davidlfvr.wordpress.com/2016/11/12/mac-mini-ubuntu-htpc/)
- [Ubuntu + MacMini + Harmony 650 + OpenPHT + Plex Media Server](https://trustdarkness.com/blog/2016/07/17/ubuntu-macmini-harmony-650-openpht-plex-media-server/)
- [Kodi - How to set up lirc](https://kodi.wiki/view/HOW-TO:Set_up_lirc#Download_and_install_lirc)
- [ir-keytable` Thread Reference](https://askubuntu.com/questions/908810/ir-remote-ubuntu-17-04)

