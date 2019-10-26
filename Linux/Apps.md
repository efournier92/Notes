# Ubuntu

## Description

## Applications to Install

### Bookworm
```
sudo add-apt-repository ppa:bookworm-team/bookworm
sudo apt-get install bookworm
```

### BleachBit
```
sudo apt-get install bleachbit 
```

### Grive2
```
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
```
#!/bin/bash

cd /mnt/BNK/Sync
grive
```

### Crontab
```
crontab -e
```
```
*/5 * * * * /mnt/BNK/Sync/.grive.sh
```

### Chrome
```
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update 
sudo apt-get install google-chrome-stable
```

### Chromium
```
sudo apt install chromium-browser
```

### Citrix Receiver
```
firefox https://www.citrix.com/downloads/citrix-receiver/linux/receiver-for-linux-latest.html 
```

### CopyQ
```
sudo add-apt-repository ppa:hluk/copyq
sudo apt update
sudo apt install copyq
```

### Disk Analyzer
```
sudo apt-get install baobab 
```

### ffmpeg
```
sudo apt-get install ffmpeg
```

### FileZilla
```
sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu xenial-getdeb apps" >> /etc/apt/sources.list.d/getdeb.list'
wget -q -O - http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
sudo apt update
sudo apt install filezilla
```

### Handbrake
```
sudo apt-get install handbrake
sudo apt-get install ubuntu-restricted-extras
sudo apt-get install libdvd-pkg
sudo dpkg-reconfigure libdvd-pkg
```

### Jumpapp
```
sudo add-apt-repository ppa:mkropat/ppa
sudo apt-get update
sudo apt-get install jumpapp
```

### Kid3 (TagEditor)
```
sudo add-apt-repository ppa:ufleisch/kid3
sudo apt-get update
sudo apt-get install kid3-qt
```

### Kodi
```
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:team-xbmc/ppa
sudo apt-get update
sudo apt-get install kodi
```

### OpenVpn
```
sudo apt-get install openvpn
```

### MongoDB
```
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org
```

### NodeJS
```
curl -sL https://deb.nodesource.com/setup_{version-major}.x | sudo -E bash -
sudo apt-get install -y nodejs
```

### Pinta
```
sudo add-apt-repository ppa:pinta-maintainers/pinta-stable
sudo apt-get update
sudo apt-get install pinta
```

### Powerline Fonts
```
sudo apt-get install fonts-powerline
```

### Python
```
sudo apt-get install python 
```

### RedShift
```
sudo apt-get install redshift redshift-gtk
```

### Rsync/Rclone
```
sudo apt-get install rsync grsync
sudo apt-get install rclone
```

### Ruby
```
sudo apt-get install ruby
```

### Simplenote
```
wget https://github.com/Automattic/simplenote-electron/releases/download/v1.0.8/simplenote-1.0.8.deb
sudo dpkg -i simplenote-1.0.8.deb
```

### Simple Scan
```
sudo apt-get install simple-scan
```

### SQLite Browser
```
sudo apt-get install sqlitebrowser
```

### VLC
```
sudo apt-get install vlc
```

### Vim
```
sudo apt-get install vim-gnome
```

### VirtualBox
```
sudo apt-get install virtualbox
```

### Visual Studio Code
```
sudo apt-get install code
```

### Tor
```
sudo apt-get install torbrowser-launcher
```

### Xsane
```
sudo apt-get install sane sane-utils libsane-extras xsane
```

### youtube-dl
```
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
```

# OSX

## Open
- [Adobe Photoshop](https://www.adobe.com/products/photoshop.html)
- [Adobe Premier Pro](https://www.adobe.com/products/premiere/free-trial-download.html)
  - with [Media Encoder](https://www.adobe.com/products/media-encoder.html)
- [Adobe Indesign](https://www.adobe.com/products/indesign/free-trial-download.html)
- [ChronoSync](https://www.econtechnologies.com/chronosync/overview.html)
- [Paragon NTFS for Mac](https://www.paragon-software.com/us/home/ntfs-mac/)
- [Wondershare PdfElement](https://pdf.wondershare.com)
- [Print Shop Mac](https://www.broderbund.com/the-print-shop-mac-download-macintosh)
- [VueScan](https://www.hamrick.com/download.html)

- [Adobe Digital Editions](https://www.adobe.com/solutions/ebook/digital-editions/download.html)
- [AirMail3](https://airmailapp.com)
- [AppCleaner](https://freemacsoft.net/appcleaner/)
- [Atom](https://atom.io)
- [AudioBookBinder](https://apps.apple.com/us/app/audiobook-binder/id413969927?mt=12)
- [Backup & Sync](https://www.google.com/drive/download/backup-and-sync/)
- [Blisk](https://blisk.io)
- [MenuCal](https://www.macupdate.com/app/mac/16760/menucal)
- [Calibre](https://calibre-ebook.com/download_osx)
- [Chrome](https://www.google.com/chrome/)
- [Chrome Canary](https://www.google.com/chrome/canary/)
- [Chromium](https://www.chromium.org/getting-involved/download-chromium)
- [Citrix Receiver](https://www.citrix.com/downloads/citrix-receiver/)
- [CleanMyMac](https://macpaw.com/download/cleanmymac)
- [CopyClip2]()
- [Commander One]()
- [Electrum (Versions)]()
- [Element Inspector]()
- [FileZilla]()
- [Firefox]()
- [Flux]()
- [GPG Keychain]()
- [iExplorer]()
- [iResize]()
- [iTerm]()
- [Kindle]()
- [Kodi]()
- [MacVim]()
- [MS Remote Desktop]()
- [MS Office Mac (Word, Excel, PowerPoint)]()
- [MyHarmony]()
- [NameChanger]()
- [Paintbrush]()
- [PdfWriter (LisaNet)]()
- [Quicksilver]()
- [ShiftIt]()
- [Simplenote]()
- [SiteSucker]()
- [Skype]()
- [Slack]()
- [Sleipnir (Tor)]()
- [Snagit]()
- [SQLite Browser]()
- [Tag Editor]()
- [Total Video]()
- [Tunnelblick]()
- [UnRarX]()
- [VirtualBox]()
- [Visual Studio Mac]()
- [Visual Studio Code]()
- [VLC]()
- [WinClone]()
- [xCode]()

## B
* Bartender
* Elite Logger
* Launchpad Manager
* Little Snitch
* Path Finder

## S
* Adobe Photoshop
* Adobe Premier Pro (w/ Media Encoder)
* Adobe Indesign 
* ChronoSync
* Paragon NTFS for Mac
* PdfElement (WonderShare)
* Print Shop
* VueScan

## CLI
* Ffmpeg
* MySQL
* Node (NVM)
* PostgreSQL
* Python (pyenv)
* Ruby (RVM)

## Waste Space
* Visual Studio Mac
* Office Mac

## Skipped
* All2MP3
* Audio Splitter
* cDock
* ClipMenu(replaced by CopyClip)
* CMake
* Cutter-Joiner
* Dock Dodger
* DropBox
* Fluid
* G-Cal
* iPod Access
* KCPM Utlity
* ScreenFlow (replaced by SnagIt)
* MetaZ
* Mosaic
* PKL
* QuickTime Pro
* OmniGraffle
* Quiver
* Task Till Dawn?
* Thunderbird (replaced by AirMail3)
* VimTerm
* Wireless Utility


