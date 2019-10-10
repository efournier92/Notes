# Ubuntu Install Commands

## Bookworm
```bash
sudo add-apt-repository ppa:bookworm-team/bookworm
sudo apt-get install bookworm
```

## BleachBit
```bash
sudo apt-get install bleachbit 
```

## Grive2
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

## .grive.sh
```bash
#!/bin/bash

cd /mnt/BNK/Sync
grive
```

## Crontab
```bash
crontab -e
```
```txt
*/5 * * * * /mnt/BNK/Sync/.grive.sh
```

## Chrome
```bash
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update 
sudo apt-get install google-chrome-stable
```

## Chromium
```bash
sudo apt install chromium-browser
```

## Citrix Receiver
```bash
firefox https://www.citrix.com/downloads/citrix-receiver/linux/receiver-for-linux-latest.html 
```

## CopyQ
```bash
sudo add-apt-repository ppa:hluk/copyq
sudo apt update
sudo apt install copyq
```

## Disk Analyzer
```bash
sudo apt-get install baobab 
```

## ffmpeg
```bash
sudo apt-get install ffmpeg
```

## FileZilla
```bash
sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu xenial-getdeb apps" >> /etc/apt/sources.list.d/getdeb.list'
wget -q -O - http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
sudo apt update
sudo apt install filezilla
```

## Handbrake
```bash
sudo apt-get install handbrake
sudo apt-get install ubuntu-restricted-extras
sudo apt-get install libdvd-pkg
sudo dpkg-reconfigure libdvd-pkg
```

## Jumpapp
```bash
sudo add-apt-repository ppa:mkropat/ppa
sudo apt-get update
sudo apt-get install jumpapp
```

## Kid3 (TagEditor)
```bash
sudo add-apt-repository ppa:ufleisch/kid3
sudo apt-get update
sudo apt-get install kid3-qt
```

## Kodi
```bash
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:team-xbmc/ppa
sudo apt-get update
sudo apt-get install kodi
```

## OpenVpn
```bash
sudo apt-get install openvpn
```

## MongoDB
```bash
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org
```

## NodeJS
```bash
curl -sL https://deb.nodesource.com/setup_{version-major}.x | sudo -E bash -
sudo apt-get install -y nodejs
```

## Pinta
```bash
sudo add-apt-repository ppa:pinta-maintainers/pinta-stable
sudo apt-get update
sudo apt-get install pinta
```

## Powerline Fonts
```bash
sudo apt-get install fonts-powerline
```

## Python
```bash
sudo apt-get install python 
```

## RedShift
```bash
sudo apt-get install redshift redshift-gtk
```

## Rsync/Rclone
```bash
sudo apt-get install rsync grsync
sudo apt-get install rclone
```

## Ruby
```bash
sudo apt-get install ruby
```

## Simplenote
```bash
wget https://github.com/Automattic/simplenote-electron/releases/download/v1.0.8/simplenote-1.0.8.deb
sudo dpkg -i simplenote-1.0.8.deb
```

## Simple Scan
```bash
sudo apt-get install simple-scan
```

## SQLite Browser
```bash
sudo apt-get install sqlitebrowser
```

## VLC
```bash
sudo apt-get install vlc
```

## Vim
```bash
sudo apt-get install vim-gnome
```

## VirtualBox
```bash
sudo apt-get install virtualbox
```

## Visual Studio Code
```bash
sudo apt-get install code
```

## Tor
```bash
sudo apt-get install torbrowser-launcher
```

## Xsane
```bash
sudo apt-get install sane sane-utils libsane-extras xsane
```

## youtube-dl
```bash
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
```

