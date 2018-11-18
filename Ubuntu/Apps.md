# Ubuntu

## Bookworm
```
sudo add-apt-repository ppa:bookworm-team/bookworm
sudo apt-get install bookworm
```

## BleachBit
```
sudo apt-get install bleachbit 
```

## Grive2
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

## .grive.sh
```
#!/bin/bash

cd /mnt/BNK/Sync
grive
```

## Crontab
```
crontab -e
```
```
*/5 * * * * /mnt/BNK/Sync/.grive.sh
```

## Chrome
```
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update 
sudo apt-get install google-chrome-stable
```

## Chromium
```
sudo apt install chromium-browser
```

## Citrix Receiver
```
firefox https://www.citrix.com/downloads/citrix-receiver/linux/receiver-for-linux-latest.html 
```

## CopyQ
```
sudo add-apt-repository ppa:hluk/copyq
sudo apt update
sudo apt install copyq
```

## Disk Analyzer
```
sudo apt-get install baobab 
```

## ffmpeg
```
sudo apt-get install ffmpeg
```

## FileZilla
```
sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu xenial-getdeb apps" >> /etc/apt/sources.list.d/getdeb.list'
wget -q -O - http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
sudo apt update
sudo apt install filezilla
```

## Handbrake
```
sudo apt-get install handbrake
sudo apt-get install ubuntu-restricted-extras
sudo apt-get install libdvd-pkg
sudo dpkg-reconfigure libdvd-pkg
```

## Jumpapp
```
sudo add-apt-repository ppa:mkropat/ppa
sudo apt-get update
sudo apt-get install jumpapp
```

## Kid3 (TagEditor)
```
sudo add-apt-repository ppa:ufleisch/kid3
sudo apt-get update
sudo apt-get install kid3-qt
```

## Kodi
```
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:team-xbmc/ppa
sudo apt-get update
sudo apt-get install kodi
```

## OpenVpn
```
sudo apt-get install openvpn
```

## MongoDB
```
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org
```

## NodeJS
```
curl -sL https://deb.nodesource.com/setup_{version-major}.x | sudo -E bash -
sudo apt-get install -y nodejs
```

## Pinta
```
sudo add-apt-repository ppa:pinta-maintainers/pinta-stable
sudo apt-get update
sudo apt-get install pinta
```

## Powerline Fonts
```
sudo apt-get install fonts-powerline
```

## Python
```
sudo apt-get install python 
```

## RedShift
```
sudo apt-get install redshift redshift-gtk
```

## Rsync/Rclone
```
sudo apt-get install rsync grsync
sudo apt-get install rclone
```

## Ruby
```
sudo apt-get install ruby
```

## Simplenote
```
wget https://github.com/Automattic/simplenote-electron/releases/download/v1.0.8/simplenote-1.0.8.deb
sudo dpkg -i simplenote-1.0.8.deb
```

## Simple Scan
```
sudo apt-get install simple-scan
```

## SQLite Browser
```
sudo apt-get install sqlitebrowser
```

## VLC
```
sudo apt-get install vlc
```

## Vim
```
sudo apt-get install vim-gnome
```

## VirtualBox
```
sudo apt-get install virtualbox
```

## Visual Studio Code
```
sudo apt-get install code
```

## Tor
```
sudo apt-get install torbrowser-launcher
```

## Xsane
```
sudo apt-get install sane sane-utils libsane-extras xsane
```

## youtube-dl
```
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
```

# OSX

## Open
* ADE (Adobe Digital Editions)
* AirMail3
* AppCleaner
* Atom
* AudioBookBinder
* Backup & Sync (Google Drive)
* Blisk
* Calendar2 [MenuCal]
* Calibre
* Canary
* Chrome
* Chromium
* Citrix Receiver
* CleanMyMac
* CopyClip2
* Commander One
* Electrum (Versions)
* Element Inspector
* FileZilla
* Firefox
* Flux
* GPG Keychain
* iExplorer
* iResize
* iTerm
* Kindle
* Kodi
* MacVim
* MS Remote Desktop
* MS Office Mac (Word, Excel, PowerPoint)
* MyHarmony
* NameChanger
* Paintbrush
* PdfWriter (LisaNet)
* Quicksilver
* ShiftIt
* Simplenote
* SiteSucker
* Skype
* Slack
* Sleipnir (Tor)
* Snagit
* SQLite Browser
* Tag Editor
* Total Video
* Tunnelblick
* UnRarX
* VirtualBox
* Visual Studio Mac
* Visual Studio Code
* VLC
* WinClone
* xCode

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


# Windows
## Home
* 7-Zip
* Backup & Sync
* Chrome
* ContextEdit
* CopyQ
* Cygwin
  - tmux
  - vim
  - zsh
  - mc
* FileZilla
* Git CLI
* gVim
* Flux
* OpenVPN
* PowerIso
* Q-Dir
* SharpKeys
* SimpleNote
* Veracrypt
  - `"C:/Program Files/VeraCrypt/VeraCrypt.exe" /l Z /v \\?\Volume{e68c8ec3-9c49-489c-9a0f-339f866920d6}\ /q`
* VLC

### Disable Updates
1. Type "Services" in Start Menu
2. Right Click `Windows Update`
3. Select `Disabled` in `Startup type` drop down

### Remove Default Software
#### `Powershell`:
* 3D Builder 
  - `Get-AppxPackage *3dbuilder* | Remove-AppxPackage`
* Calendar and Mail 
  - `Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage`
* Get Office 
  - `Get-AppxPackage *officehub* | Remove-AppxPackage`
* Get Skype
  - `Get-AppxPackage *skypeapp* | Remove-AppxPackage`
* Get Started
  - `Get-AppxPackage *getstarted* | Remove-AppxPackage`
* Groove Music 
  - `Get-AppxPackage *zunemusic* | Remove-AppxPackage`
* Maps 
  - `Get-AppxPackage *windowsmaps* | Remove-AppxPackage`
* Solitaire Collection 
  - `Get-AppxPackage *solitairecollection* | Remove-AppxPackage`
* Money 
  - `Get-AppxPackage *bingfinance* | Remove-AppxPackage`
* Movies & TV
  - `Get-AppxPackage *zunevideo* | Remove-AppxPackage`
* News 
  - `Get-AppxPackage *bingnews* | Remove-AppxPackage`
* OneNote 
  - `Get-AppxPackage *onenote* | Remove-AppxPackage`
* People 
  - `Get-AppxPackage *people* | Remove-AppxPackage`
* Phone Companion 
  - `Get-AppxPackage *windowsphone* | Remove-AppxPackage`
* Sports 
  - `Get-AppxPackage *bingsports* | Remove-AppxPackage`
* Weather
  - `Get-AppxPackage *bingweather* | Remove-AppxPackage`
* Xbox 
  - `Get-AppxPackage *xboxapp* | Remove-AppxPackage`
  - ``

## Work
* 7-Zip
* Adobe Acrobat Reader
* Adobe Digital Editions
* Backup & Sync (Google Drive)
* BlueJeans
* Brio Screen Projector
* Canary
* Chrome
* Chromium
* CopyQ
* DB Browser for SQL Lite
* Git CLI
* GVim
* f.lux
* FileZilla
* FireFox
* IIS Express
* Launchy
* MPow Thor (Bluetooth Headphones)
* MS Office
* MS SQL Server
* NodeJS
* Notepad++
* Opera
* Python (2.X, 32bit)
* Q-Dir
* ReSharper
* Ruby
* ScaleOut (Receiver)
* SharpKeys
* Simplenote
* Skype
* USB 3.0 Host Controller Utility
* Vim Command Prompt
* VS 2012
* VS Code
* Winaero Tweaker
* WinHotKey

