# Scripts

## Contents
- [Overview](#overview)
- [Bash](#bash)
  - [bk-bnk](#bk-bnk)
  - [bk-drive](#bk-drive)
  - [bk-gry](#bk-gry)
  - [boot-cmds](#boot-cmds)
  - [dev-env](#dev-env)
  - [launch-citrix](#launch-citrix)
  - [livestream](#livestream)
  - [open-chrome-tabs](#open-chrome-tabs)
- [Ruby](#ruby)
  - [audio_logger](#audio_logger)
- [AppleScript](#applescript)
  - [RunTime](#runtime)
  - [Printercisor](#printercisor)
  - [Waker](#waker)
  - [KbRightClick](#kbrightclick)

## Overview
[Scripting languages](https://en.wikipedia.org/wiki/Scripting_language) are useful tools, and awesome for introducing oneself to writing code. My first lines of code were in [AppleScript](https://en.wikipedia.org/wiki/AppleScript), which makes [coding](https://en.wikipedia.org/wiki/Computer_programming) so simple, you barely know you're doing it. Still, I fairly quickly abandoned [AppleScript](https://en.wikipedia.org/wiki/AppleScript), in favor of more robust languages. [Ruby](https://www.ruby-lang.org/en/) was my all-around go-to language for a couple years, and now I tend to lean on [Bash](https://www.gnu.org/software/bash/) for my [scripting](https://en.wikipedia.org/wiki/Scripting_language) needs.

## [Bash](https://www.gnu.org/software/bash/)

### Description
[Bash](https://www.gnu.org/software/bash/) has been around since 1989, when it was released as an open-source extension of [sh](https://en.wikipedia.org/wiki/Shell_script). It's since come to be the default [shell](https://en.wikipedia.org/wiki/Shell_(computing)) for most [Linux](https://www.linux.org/) distributions. Although I work in a [Zsh](https://en.wikipedia.org/wiki/Z_shell) shell for the most part, I tend to write my scripts in plain [Bash](https://www.gnu.org/software/bash/), in the name of compatibility.

### `bk-bnk`

#### Description
Used to periodically [zip](https://en.wikipedia.org/wiki/Zip_(file_format)) a directory recursively, for archival purposes.

#### Location
[Github](https://raw.githubusercontent.com/efournier92/Notes/master/Scripts/Bash/.bk-bnk.bash)

### `bk-drive`

#### Description
Synced two back-up directories, as a [DRP](https://en.wikipedia.org/wiki/Disaster_recovery_and_business_continuity_auditing#Disaster_recovery_plan).

#### Location
[Github](https://raw.githubusercontent.com/efournier92/Notes/master/Scripts/Bash/.bk-drive.bash)

### `bk-gry`

#### Description
Selectively syncs a smaller back-up directory, into a larger one.

#### Location
[Github](https://raw.githubusercontent.com/efournier92/Notes/master/Scripts/Bash/.bk-gry.bash)

### `boot-cmds`

#### Description
Configure system and launch some utilities on [Ubuntu](https://ubuntu.com/) system boot.

#### Location
[Github](https://raw.githubusercontent.com/efournier92/Notes/master/Scripts/Bash/.boot-cmds.bash)

### `dev-env`

#### Description
Opens appropriate [tmux](https://github.com/tmux/tmux/wiki) tabs and panes for development on an [Angular](https://angular.io/) project.

#### Location
[Github](https://raw.githubusercontent.com/efournier92/Notes/master/Scripts/Bash/.dev-env.bash)

### `launch-citrix`

#### Description
Launches a [Citrix Receiver](https://en.wikipedia.org/wiki/Citrix_Receiver) session.

#### Location
[Github](https://raw.githubusercontent.com/efournier92/Notes/master/Scripts/Bash/.launch-citrix.bash)

### `livestream`

#### Description
Feeds a [live stream](https://en.wikipedia.org/wiki/Live_streaming) to [Twitch](https://www.twitch.tv/), complete with [soundtrack](https://en.wikipedia.org/wiki/Soundtrack) from a disk storage directory.

#### Location
[Github](https://raw.githubusercontent.com/efournier92/Notes/master/Scripts/Bash/.livestream.bash)

### `open-chrome-tabs`

#### Description
A quick-and-dirty approach to opening a fresh [Chrome](https://www.google.com/chrome/), while loading a specific set of app tabs. This example opens a window with several tabs, each a different product on [Amazon Fresh](https://www.amazon.com/AmazonFresh), to make for a faster shopping experience.

#### Location
[Github](https://raw.githubusercontent.com/efournier92/Notes/master/Scripts/Bash/.open-chrome-tabs)

## [Ruby](https://www.ruby-lang.org/en/)

### Description
[Ruby](https://www.ruby-lang.org/en/) is an extremely versatile [language](https://en.wikipedia.org/wiki/Programming_language), which was first developed in the 1990s. Although it's now most commonly seen in conjunction with [Rails](https://rubyonrails.org/) for web development, it supports multiple paradigms, and is capable of handling most any [scripting](https://en.wikipedia.org/wiki/Scripting_language) tasks.

### `audio_logger`

#### Description
Compresses a directory of `.WAV` files, outputting `.mp3` files to a different directory.

#### Location
[Github](https://raw.githubusercontent.com/efournier92/Notes/master/Scripts/Ruby/audio_logger.rb)

## [AppleScript](https://en.wikipedia.org/wiki/AppleScript)

### Description
[AppleScript](https://en.wikipedia.org/wiki/AppleScript) has [Apple's](https://www.apple.com/) proprietary system scripting and automation language since 1993. Much as it may lack in versatility, it's undeniably one of the simplest and most English-like languages ever invented. I used it a lot as a kid, and it helped me learn to think like a [programmer](https://en.wikipedia.org/wiki/Programmer).

### `RunTime`

#### Description
I used to run this little [AppleScript](https://en.wikipedia.org/wiki/AppleScript) application whenever my [OS X](https://en.wikipedia.org/wiki/MacOS) system booted. It automated care of some desktop and app-launching operations. I didn't know what I was doing when I wrote it, but it continued to mostly work for my purposes for years of intermittent tweaking, before I abandoned [MacOS](https://en.wikipedia.org/wiki/MacOS).

#### Location
[Github](https://raw.githubusercontent.com/efournier92/Notes/master/Scripts/AppleScript/RunTime.scpt)

### `Printercisor`

#### Description
I wrote this script as part of a failed attempt to configure an [Epson Workforce 30](https://files.support.epson.com/pdf/wf30__/wf30__qg.pdf) printer with a [Continuous Ink Supply System](https://en.wikipedia.org/wiki/Continuous_ink_system). My idea was that, since I wouldn't be using the printer every day, I should write a script print a page every couple days, to prevent the [heads](https://en.wikipedia.org/wiki/Inkjet_printing#Disposable_head) from drying out. I keep the result of this effort at the following location.

#### Location
[Github](https://github.com/efournier92/Notes/blob/master/Scripts/AppleScript/Printercisor/Printercisor/)

### `Waker`

#### Description
This script would fire on the system-wakeup event, to fix some bugs on a [Mac Mini](https://en.wikipedia.org/wiki/Mac_Mini#2nd_generation_(Intel-based,_2006-2009)) media center machine.

#### Location
[Github](https://raw.githubusercontent.com/efournier92/Notes/master/Scripts/AppleScript/Waker.scpt)

### `KbRightClick`

#### Description
I don't specifically recall writing this script, but I guess it was meant to simulate a right click for [scripting](https://en.wikipedia.org/wiki/Scripting_language) purposes. I guess it seemed important at the time, so I've kept it in the following location.

#### Location
[Github](https://github.com/efournier92/Notes/blob/master/Scripts/AppleScript/KbRightClick/)

