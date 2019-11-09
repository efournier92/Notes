# Ubuntu

## Contents
- [Overview](#overview)
- [Boot Commands](#boot-commands)
  - [Kernel](#kernel)
  - [grub2](#grub2)
  - [initramfs](#initramfs)
- [polkit](#polkit)
  - [Policies](#policies)
- [fstab](#fstab)
  - [Edit](#edit)
  - [File Contents](#file-contents)
- [Disable Lid Wake](#disable-lid-wake)
  - [List Wakeup Devices](#list-wakeup-devices)
  - [Reload System Daemons](#reload-system-daemons)
  - [Create or Edit `disable-lid-wakeup` Service](#create-or-edit-disable-lid-wakeup-service)
  - [Add Content to `disable-lid-wakeup` Service](#add-content-to-disable-lid-wakeup-service)
  - [Check Status of `disable-lid-wakeup` Service](#check-status-of-disable-lid-wakeup-service)
  - [Boot with `disable-lid-wakeup` Service](#boot-with-disable-lid-wakeup-service)
- [Applications](#applications)

## Overview
When I bought a new [Macbook Pro](https://www.apple.com/macbook-pro/) at the start of 2018, I sought to turn it into a triple-boot system, with bootable environments for [OS X](https://en.wikipedia.org/wiki/MacOS), [Windows](https://en.wikipedia.org/wiki/Microsoft_Windows), and [Linux](https://www.linux.org/). When I first installed [Ubuntu](https://ubuntu.com/), I did so purely for novelty; once I started using it, I never went back. Not only did I find it an adequate free and open-source alternative to the others, but I quickly grew to prefer the [Gnome](https://ubuntugnome.org/) [desktop environment](https://en.wikipedia.org/wiki/Desktop_environment) to anything the other players have to offer. It can also be run on virtually any machine, and somehow runs more buttery-smooth on my [Macbook](https://www.apple.com/macbook-pro/) than [Apple's](https://www.apple.com/) own [OS](https://en.wikipedia.org/wiki/MacOS). I've played around with some other [flavors](https://en.wikipedia.org/wiki/Linux_distribution#Widely_used_distributions) of [Linux](https://www.linux.org/), but [Ubuntu](https://ubuntu.com/) is my go-to: the environment in which I belong.

## Boot Commands

### Kernel

#### Echo System Kernel
```bash
uname -r
```

### `grub2`

#### Update `grub2`
```bash
sudo update-grub
```

#### Edit Grub Defaults
```bash
sudo vim /etc/default/grub
sudo update-grub
```

#### Edit Grub Config
```bash
sudo vim /boot/grub/grub.cfg
```

### `initramfs`

#### Fix `resume` Slow Boot
```bash
sudo vim /etc/initramfs-tools/conf.d/resume
  > RESUME=none
sudo update-initramfs -u
```

## [polkit](https://en.wikipedia.org/wiki/Polkit)

### Description
[pkexec](http://manpages.ubuntu.com/manpages/trusty/man1/pkexec.1.html) is a useful alternative to [sudo](http://manpages.ubuntu.com/manpages/trusty/man8/sudo_root.8.html), particularly when elevating access from within a script routine. Writing custom [polkit](https://en.wikipedia.org/wiki/Polkit) [policies](http://manpages.ubuntu.com/manpages/bionic/man8/polkit.8.html) extends control over [polkit](https://en.wikipedia.org/wiki/Polkit)).

### Policies

#### Create New
```bash
/usr/share/polkit-1/actions
```

#### _Important Note_
When adding a new policy, copy the file to different directory, edit it, then copy it back to the `actions` folder.

### Examples
- [ex.dmidecode.policy](https://github.com/efournier92/Notes/blob/master/Linux/Polkit/policies/ex.dmidecode.policy)
- [ex.livestream.policy](https://github.com/efournier92/Notes/blob/master/Linux/Polkit/policies/ex.livestream.policy)
- [ex.mongod.policy](https://github.com/efournier92/Notes/blob/master/Linux/Polkit/policies/ex.mongod.policy)

## [fstab](https://help.ubuntu.com/community/Fstab)

### Description
[fstab](https://help.ubuntu.com/community/Fstab) is a system configuration file found on most [Linux]() systems. The following info is useful when editing that configuration file.

### Edit
```bash
sudo vim /etc/fstab
```

### File Contents
```
# /etc/fstab: static file system information.

# Use 'blkid' to print the universally unique identifier for a
# device; this may be used with UUID= as a more robust way to name devices
# that works even if disks are added and removed. See fstab(5).

# <file system>  <mount point>  <type>  <options>  <dump>  <pass>

# EFI
UUID=67E3-17ED /boot/efi  vfat  umask=0077  0  1

# SWAP
UUID=80d3fdc8-5af3-4ed6-8013-86ffef4c6d53 none  swap  sw  0  0

# ROOT
UUID=508a55ea-33a9-40c7-b316-e97e8f1850bb  /  ext4  errors=remount-ro  0  1
```

## Disable Lid Wake

### List Wakeup Devices
```bash
cat /proc/acpi/wakeup
```

### Reload System Daemons
```bash
udo systemctl daemon-reload 
```

### Create or Edit `disable-lid-wakeup` Service
```bash
sudo vim /etc/systemd/system/disable-lid-wakeup.service 
```

### Add Content to `disable-lid-wakeup` Service
```service
[Unit]
Description=disable-lid-wakeup

[Service]
ExecStart=/bin/bash -c "echo LID0 >> /proc/acpi/wakeup"

[Install]
WantedBy=multi-user.target
```

### Check Status of `disable-lid-wakeup` Service
```bash
systemctl status disable-lid-wakeup.service
```

### Boot with `disable-lid-wakeup` Service
```bash
sudo systemctl enable disable-lid-wakeup.service
```

## Applications

### Audacity
```bash
sudo add-apt-repository ppa:ubuntuhandbook1/audacity
sudo apt-get install audacity
```

### Bookworm
```bash
sudo add-apt-repository ppa:bookworm-team/bookworm
sudo apt-get install bookworm
```
### BleachBit
```bash
sudo apt-get install bleachbit 
```

### Grive2
```bash
sudo apt-get install git cmake build-essential libgcrypt11-dev libyajl-dev libboost-all-dev libcurl4-openssl-dev libexpat1-dev libcppunit-dev binutils-dev debhelper zlib1g-dev dpkg-dev pkg-config
git clone https://github.com/vitalif/grive2
dpkg-buildpackage -j4
mkdir build
cd build
cmake ..
make -j4
sudo make install
```

### .grive.sh
```bash
#!/bin/bash

cd /mnt/BNK/Sync
grive
```

### Crontab

#### Edit File
```bash
crontab -e
```

#### File Contents
```text
*/5 * * * * /mnt/BNK/Sync/.grive.sh
```

### Chrome
```bash
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update 
sudo apt-get install google-chrome-stable
```

### Chromium
```bash
sudo apt install chromium-browser
```

### Citrix Receiver
```bash
firefox https://www.citrix.com/downloads/citrix-receiver/linux/receiver-for-linux-latest.html 
```

### CopyQ
```bash
sudo add-apt-repository ppa:hluk/copyq
sudo apt update
sudo apt install copyq
```

### Disk Analyzer
```bash
sudo apt-get install baobab 
```

### ffmpeg
```bash
sudo apt-get install ffmpeg
```

### FileZilla
```bash
sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu xenial-getdeb apps" >> /etc/apt/sources.list.d/getdeb.list'
wget -q -O - http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
sudo apt update
sudo apt install filezilla
```

### Handbrake
```bash
sudo apt-get install handbrake
sudo apt-get install ubuntu-restricted-extras
sudo apt-get install libdvd-pkg
sudo dpkg-reconfigure libdvd-pkg
```

### ImageMagick
```bash
sudo apt build-dep imagemagick
wget https://www.imagemagick.org/download/ImageMagick.tar.gz
tar xf ImageMagick.tar.gz
cd ImageMagick-7*
./configure
make
sudo make install
```

### Inkscape
```bash
sudo add-apt-repository ppa:inkscape.dev/stable
sudo apt install inkscape 
```

### Jumpapp
```bash
sudo add-apt-repository ppa:mkropat/ppa
sudo apt-get update
sudo apt-get install jumpapp
```

### Kid3 | _ID3 Tag Editor_
```bash
sudo add-apt-repository ppa:ufleisch/kid3
sudo apt-get update
sudo apt-get install kid3-qt
```

### Kodi
```bash
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:team-xbmc/ppa
sudo apt-get update
sudo apt-get install kodi
```

### Open Shot
```bash
sudo add-apt-repository ppa:openshot.developers/ppa
sudo apt-get install openshot-qt
```

### OpenVpn
```bash
sudo apt-get install openvpn
```

### MongoDB
```bash
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org
```

### NodeJS
```bash
curl -sL https://deb.nodesource.com/setup_{version-major}.x | sudo -E bash -
sudo apt-get install -y nodejs
```

### Pinta
```bash
sudo add-apt-repository ppa:pinta-maintainers/pinta-stable
sudo apt-get update
sudo apt-get install pinta
```

### Powerline Fonts
```bash
sudo apt-get install fonts-powerline
```

### Python
```bash
sudo apt-get install python 
```

### RedShift
```bash
sudo apt-get install redshift redshift-gtk
```

### Rsync/Rclone
```bash
sudo apt-get install rsync grsync
sudo apt-get install rclone
```

### Ruby
```bash
sudo apt-get install ruby
```

### Simplenote
```bash
wget https://github.com/Automattic/simplenote-electron/releases/download/v1.0.8/simplenote-1.0.8.deb
sudo dpkg -i simplenote-1.0.8.deb
```

### Simple Scan
```bash
sudo apt-get install simple-scan
```

### SQLite Browser
```bash
sudo apt-get install sqlitebrowser
```

### VLC
```bash
sudo apt-get install vlc
```

### Vim
```bash
sudo apt-get install vim-gnome
```

### VirtualBox
```bash
sudo apt-get install virtualbox
```

### Visual Studio Code
```bash
sudo apt-get install code
```

### Tor
```bash
sudo apt-get install torbrowser-launcher
```

### Xsane
```bash
sudo apt-get install sane sane-utils libsane-extras xsane
```

### youtube-dl
```bash
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
```

