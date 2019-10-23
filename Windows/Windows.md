# Windows Commands

## Overview
Sometimes, operating in a [Windows](https://en.wikipedia.org/wiki/Microsoft_Windows) environment is a necessary evil. When forced to do so, I sometimes use the following commands and configurations to enhance my workflow.

## Commands

### Set Default Program to Open Files

#### Description

#### Command
```dos
assoc .="No Extension"
ftype "No Extension"="C:\path\to\my editor.exe" "%1"
```

### Always Edit with [`vim`](https://www.vim.org/)

#### Description
[`vim`](https://www.vim.org/) is my preferred text editor for [`mardown`](https://daringfireball.net/projects/markdown/) and small projects. To make [Windows](https://en.wikipedia.org/wiki/Microsoft_Windows) favor [`vim`](https://www.vim.org/) as the system text editor, add the following entry to you [Registry](https://en.wikipedia.org/wiki/Windows_Registry).

#### Command
```dos
REGEDIT4
[HKEY_CLASSES_ROOT\Unknown\shell]
@="vim"
[HKEY_CLASSES_ROOT\Unknown\shell\vim]
[HKEY_CLASSES_ROOT\Unknown\shell\vim\command]
@="\"C:\\Program Files (x86)\\Vim\\vim81\\gvim.exe\" \"%1\""
```

## [`slmgr`](https://docs.microsoft.com/en-us/windows/deployment/volume-activation/activate-using-key-management-service-vamt)

### Description
[`slmgr`](https://docs.microsoft.com/en-us/windows/deployment/volume-activation/activate-using-key-management-service-vamt) is a [Windows](https://en.wikipedia.org/wiki/Microsoft_Windows) service that ensures you're licensed, and sometimes acts buggy. If you find this service misbehaving, the following commands may come in handy.

### Commands

#### Show Details

```dos
slmgr -dli
```

#### Rearm

```dos
slmgr -rearm
```

### Set `SHELL` Environment Variable to `zsh` for [Cygwin](https://www.cygwin.com/)

1. Press `Windows` Key
2. Find & `Environment Variables`
3. Set `Variable` as `SHELL`
5. Set `Value` as `/usr/bin/zsh`

### Enable Scroll Lock
Use the following command to enable system [`Scroll Lock`](https://en.wikipedia.org/wiki/Scroll_Loc://en.wikipedia.org/wiki/Scroll_Lock) in [DOS](https://en.wikipedia.org/wiki/DOS).

```dos
wsh = New-Object -ComObject WScript.Shell
wsh.SendKeys('{SCROLLLOCK}')
```

### Open Sound Settings in `Windows 10`
```dos
control.exe /name Microsoft.Sound
```

### Launch `gnome-terminal`
```dos
"C:\Program Files (x86)\Xming\Xming.exe" -clipboard -multiwindow &
wsl -- export DISPLAY=:0; sudo gvim; sudo pkill gvim; sudo gnome-terminal
```

## Apps

### Home
- [7-Zip](https://sourceforge.net/projects/sevenzip/)
- [Backup & Sync](https://www.google.com/drive/download/)
- [Chrome](https://www.google.com/chrome/)
- [ContextEdit](https://www.softpedia.com/get/System/OS-Enhancements/ContextEdit.shtml)
- [CopyQ](https://sourceforge.net/projects/copyq/files/latest/download)
- [FileZilla](https://filezilla-project.org/download.php?platform=win64)
- [Git CLI](https://git-scm.com/download/win)
- [gVim](https://www.vim.org/download.php)
- [Flux](https://justgetflux.com/)
- [OpenVPN](https://openvpn.net/)
- [Q-Dir](https://www.techspot.com/downloads/6482-q-dir.html)
- [SharpKeys](https://www.randyrants.com/category/sharpkeys/)
- [SimpleNote](https://simplenote.com/category/windows/)
- [Veracrypt](https://www.veracrypt.fr/en/Downloads.html)
  - `"C:/Program Files/VeraCrypt/VeraCrypt.exe" /l Z /v \\?\Volume{e68c8ec3-9c49-489c-9a0f-339f866920d6}\ /q`
- [VLC](https://www.videolan.org/vlc/download-windows.html)
- [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-manual)

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


