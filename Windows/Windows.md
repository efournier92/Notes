# Windows

## Contents

- [Overview](#overview)
- [Commands](#commands)
  - [Set Default Apps](#set-default-apps)
  - [Always Edit with Vim](#always-edit-with-vim)
- [Slmgr](#slmgr)
- [Fonts](#fonts)
- [dotNET](#dotnet)
- [Applications](#applications)
  - [Home](#home)
  - [Pro](#pro)

## Overview

Sometimes, operating in a [Windows](https://en.wikipedia.org/wiki/Microsoft_Windows) environment is a necessary evil. When forced to do so, I sometimes use the following commands and configurations to enhance my workflow.

## Commands

### Set Default Apps

#### Description

Configure a default app for system to open for any file type.

#### Command

```dos
assoc .="No Extension"
ftype "No Extension"="C:\path\to\my editor.exe" "%1"
```

### Always Edit with [Vim](https://www.vim.org/)

#### Description

[Vim](https://www.vim.org/) is my preferred text editor for writing [mardown](https://daringfireball.net/projects/markdown/) and small projects. To make [Windows](https://en.wikipedia.org/wiki/Microsoft_Windows) favor [Vim](https://www.vim.org/) as the system text editor, add the following entry to you [Registry](https://en.wikipedia.org/wiki/Windows_Registry).

#### Command

```dos
REGEDIT4
[HKEY_CLASSES_ROOT\Unknown\shell]
@="vim"
[HKEY_CLASSES_ROOT\Unknown\shell\vim]
[HKEY_CLASSES_ROOT\Unknown\shell\vim\command]
@="\"C:\\Program Files (x86)\\Vim\\vim81\\gvim.exe\" \"%1\""
```

## [Slmgr](https://docs.microsoft.com/en-us/windows/deployment/volume-activation/activate-using-key-management-service-vamt)

### Description

[Slmgr](https://docs.microsoft.com/en-us/windows/deployment/volume-activation/activate-using-key-management-service-vamt) is a [Windows](https://en.wikipedia.org/wiki/Microsoft_Windows) service that ensures you're licensed, and sometimes acts buggy. If you find this service misbehaving, the following commands may come in handy.

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

#### Description

Use the following command to enable system [Scroll Lock](https://en.wikipedia.org/wiki/Scroll_Loc://en.wikipedia.org/wiki/Scroll_Lock) in [DOS](https://en.wikipedia.org/wiki/DOS).

#### Command

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

### Disable Updates

1. Type "Services" in Start Menu
2. Right Click `Windows Update`
3. Select `Disabled` in `Startup type` drop down

### Remove Default Software

#### In [PowerShell](https://en.wikipedia.org/wiki/PowerShell)

- 3D Builder 
  - `Get-AppxPackage *3dbuilder* | Remove-AppxPackage`
- Calendar and Mail 
  - `Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage`
- Get Office 
  - `Get-AppxPackage *officehub* | Remove-AppxPackage`
- Get Skype
  - `Get-AppxPackage *skypeapp* | Remove-AppxPackage`
- Get Started
  - `Get-AppxPackage *getstarted* | Remove-AppxPackage`
- Groove Music 
  - `Get-AppxPackage *zunemusic* | Remove-AppxPackage`
- Maps 
  - `Get-AppxPackage *windowsmaps* | Remove-AppxPackage`
- Solitaire Collection 
  - `Get-AppxPackage *solitairecollection* | Remove-AppxPackage`
- Money 
  - `Get-AppxPackage *bingfinance* | Remove-AppxPackage`
- Movies & TV
  - `Get-AppxPackage *zunevideo* | Remove-AppxPackage`
- News 
  - `Get-AppxPackage *bingnews* | Remove-AppxPackage`
- OneNote 
  - `Get-AppxPackage *onenote* | Remove-AppxPackage`
- People 
  - `Get-AppxPackage *people* | Remove-AppxPackage`
- Phone Companion 
  - `Get-AppxPackage *windowsphone* | Remove-AppxPackage`
- Sports 
  - `Get-AppxPackage *bingsports* | Remove-AppxPackage`
- Weather
  - `Get-AppxPackage *bingweather* | Remove-AppxPackage`
- Xbox 
  - `Get-AppxPackage *xboxapp* | Remove-AppxPackage`

## Fonts

### `DejaVu Sans for Powerline`

#### Location

[Github](https://github.com/efournier92/Notes/blob/master/Windows/Fonts/DejaVuSansMonoForPowerline.ttf)

## [dotNET](https://dotnet.microsoft.com/) 

### Description

[.NET](https://dotnet.microsoft.com/) is [Microsoft's](https://www.microsoft.com/en-us) core [Software Framework](https://en.wikipedia.org/wiki/Software_framework), which has been available to developers since 2002. I mostly use it with [ASP.NET](https://dotnet.microsoft.com/apps/aspnet), for developing enterprise web applications. I've compiled a great deal more information at the following location.

### Location

[Github](https://github.com/efournier92/Notes/blob/master/Windows/DotNet/DotNet.md)

## Applications

### Home

- [7-Zip](https://sourceforge.net/projects/sevenzip/)
- [Backup & Sync](https://www.google.com/drive/download/)
- [Chrome](https://www.google.com/chrome/)
- [ContextEdit](https://www.softpedia.com/get/System/OS-Enhancements/ContextEdit.shtml)
- [CopyQ](https://sourceforge.net/projects/copyq/files/latest/download)
- [FileZilla](https://filezilla-project.org/download.php?platform=win64)
- [Git CLI](https://git-scm.com/download/win)
- [gVim](https://www.vim.org/download.php)
- [f.lux](https://justgetflux.com/)
- [OpenVPN](https://openvpn.net/)
- [Q-Dir](https://www.techspot.com/downloads/6482-q-dir.html)
- [SharpKeys](https://www.randyrants.com/category/sharpkeys/)
- [SimpleNote](https://simplenote.com/category/windows/)
- [Veracrypt](https://www.veracrypt.fr/en/Downloads.html)
  - `"C:/Program Files/VeraCrypt/VeraCrypt.exe" /l Z /v \\?\Volume{e68c8ec3-9c49-489c-9a0f-339f866920d6}\ /q`
- [VLC](https://www.videolan.org/vlc/download-windows.html)
- [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-manual)

### Pro

- [7-Zip](https://sourceforge.net/projects/sevenzip/)
- [Adobe Acrobat Reader](https://get.adobe.com/reader/otherversions/)
- [Adobe Digital Editions](https://www.adobe.com/solutions/ebook/digital-editions/download.html)
- [Backup & Sync](https://www.google.com/drive/download/)
- [BlueJeans](https://www.bluejeans.com/downloads)
- [Brio Screen Projector](https://www.christiedigital.com/en-us/products/apps)
- [Chrome Canary](https://www.google.com/chrome/canary/)
- [Chrome](https://www.google.com/chrome/)
- [Chromium](https://www.chromium.org/)
- [CopyQ](https://hluk.github.io/CopyQ/)
- [DB Browser for SQL Lite](https://sqlitebrowser.org/dl/)
- [Git CLI](https://git-scm.com/download/win)
- [gVim](https://www.vim.org/download.php)
- [f.lux](https://justgetflux.com/)
- [FileZilla](https://filezilla-project.org/download.php?platform=win64)
- [FireFox](https://www.mozilla.org/en-US/firefox/)
- [IIS Express](https://www.microsoft.com/en-us/download/details.aspx?id=48264)
- [MS SQL Server](https://www.microsoft.com/en-us/sql-server/sql-server-editions-express)
- [NodeJS](https://nodejs.org/en/download/)
- [Notepad++](https://notepad-plus-plus.org/downloads/)
- [Q-Dir](https://www.techspot.com/downloads/6482-q-dir.html)
- [ReSharper](https://www.jetbrains.com/resharper/download/)
- [SharpKeys](https://www.randyrants.com/category/sharpkeys/)
- [SimpleNote](https://simplenote.com/category/windows/)
- [Skype](https://www.skype.com/en/get-skype/)
- [Visual Studio Code](https://code.visualstudio.com/download)
- [Winaero Tweaker](https://winaero.com/download.php?view.1796)
- [WinHotKey](https://www.softpedia.com/get/System/Launchers-Shutdown-Tools/WinHotKey.shtml)

