# [Visual Studio](https://visualstudio.microsoft.com/)

## Contents
- [Overview](#overview)
- [ReSharper](#resharper)
- [Team Foundation Server](#team-foundation-server)
- [Performance Optimization](#vs-performance-optimization)
- [Keyboard Shortcuts](#visual-studio-keyboard-shortcuts)

## Overview
I use Visual Studio as my IDE for a large corporate [ASP.NET](https://docs.microsoft.com/en-us/aspnet/#pivot=aspnet) application I work on. I typically use it in conjunction with
[JetBrains](https://www.jetbrains.com/) [ReSharper](https://www.jetbrains.com/resharper/) and [Team Foundation Server](https://en.wikipedia.org/wiki/Team_Foundation_Server), to extend its power. Below are some configurations I find useful.

## [ReSharper](https://www.jetbrains.com/resharper/)

### Description
[ReSharper](https://www.jetbrains.com/resharper/) provides some awesome tooling capabilities, which extend the power of [Visual Studio](https://visualstudio.microsoft.com/). I've compiled more information about using [ReSharper](https://www.jetbrains.com/resharper/) at the following location.

### Location
[Github](https://github.com/efournier92/Notes/blob/master/IDE/ReSharper/ReSharper.md)

## [Team Foundation Server](https://en.wikipedia.org/wiki/Team_Foundation_Server)

### Description
I use TFS in conjunction with Visual Studio as a centralized version control system for a large corporate [ASP.NET](https://docs.microsoft.com/en-us/aspnet/#pivot=aspnet) application I work on. I've compiled more information at the following location.

### Location
[Github](https://github.com/efournier92/Notes/blob/master/IDE/VisualStudio/TFS/TFS.md)

## Performance Optimization

### Description
The following are options that can improve [VS](https://visualstudio.microsoft.com/) performance. Many of them disable potentially-useful functionality, so be aware of the costs and benefits to toggling these settings.

### Settings

#### Visual Experience
1. `Environment -> General`
2. Disable Automatically adjust visual experience based on client performance
3. Disable Enable rich client visual experience
4. Enable Use hardware graphics acceleration if available

#### Startup Environment
1. `Environment -> Startup`
2. Choose to show empty environment at startup and disable downloading content

#### Auto-Recover
1. `Environment -> AutoRecover`
2. Disable `Save AutoRecover information`

#### Track Changes
1. `Text Editor -> General`
2. Disable Track changes

#### Scroll Bar Annotation
1. `Text Editor -> All Languages -> Scroll Bars`
2. Disable Show annotations over vertical scroll bar

#### CodeLens
1. `Text Editor -> All Languages -> CodeLens`: 
2. Disable CodeLens

#### Debugging
1. `Debugging -> Just-In-Time`
2. Disable Just-In-Time Debugging for Script

#### Web Forms Designer
1. `Web Forms Designer -> General`
2. Disable Web Forms Designer

#### XAML Designer
1. `XAML Designer -> General`
2. Disable XAML Designer

#### Auto-Formatting
1. `Text Editor -> [Language] -> Formatting`
2. Disable all auto-formatting preferences

#### Semantic Colorization 1. `Text Editor -> C/C++ -> Advanced`
2. Set the `IntelliSense -> Disable Semantic Colorization` preference to `True`

#### Synchronized Settings
1. `Environment -> Accounts -> Synchronized settings`
2. Disable `Synchronize settings accross devices`

### Full Solution Analysis
1. `Text Editor -> C# -> Advanced`
2. Disable `Full Solution Analysis`

## Keyboard Shortcuts

### Description
Below is a list of default hotkeys that ship with Visual Studio.

### Shortcuts

#### Go To Line #
- `ctrl-g`

#### Go To Matching Brace
- `ctrl-]`

#### Go To Declaration
- `ctrl-F12`

#### Go To Definition
- `F12`

#### Go To File
- `ctrl-1, ctrl-f`

#### Go To Member
- `ctrl-1, ctrl-m`

#### Go To Symbol
- `ctrl-1, ctrl-s`

#### Go To Symbol
- `ctrl-1, ctrl-t`

#### Go To Next Location
- `F8`

#### Go To Previous Location
- `shift-F8`

#### Go To TFS Home
- `ctrl-0, ctrl-h`

#### Go To TFS Pending Changes
- `ctrl-0, ctrl-p`

#### Go To TFS Build
- `ctrl-0, ctrl-b`

#### Go To TFS Connect
- `ctrl-0, ctrl-c`

#### Go To TFS Reports
- `ctrl-0, ctrl-r`

#### Hide Selection
- `ctrl-m, ctrl-h`

#### Incremental Search
- `ctrl-i`

#### Transpose Line
- `shift-alt-t`

#### Move Selected Lines Up/Down
- `alt-arrow`

#### Delete Line
- `Ctrl+Shift+L`

#### Comment Line/Selection
- `crtl-k, ctrl-c`

#### Uncomment Line/Selection
- `crtl-k, ctrl-u`

#### Format Document
- `crtl-k, ctrl-d`

#### Format Selection
- `crtl-k, ctrl-f`

#### Make Selection Lowercase
- `ctrl-u`

#### Make Selection Uppercase
- `ctrl-shift-u`

#### Rename Item
- `ctrl-r, ctrl-r`

#### Move Item
- `ctrl-r, ctrl-o`

#### Show Quick Actions For Cursor Position
- `ctrl-.`

#### List Members
- `ctrl-j`

#### Show Call Hierarchy for Member
- `ctrl-k, ctrl-t`

#### Save All Open Files
- `ctrl-shift-s`

#### Wrap HTML Line With Div
- `shift-alt-w`

#### Extract Method
- `ctrl-r, ctrl-m`

#### Extract Interface
- `ctrl-r, ctrl-i`

#### Activate Solution Explorer
- `ctrl-alt-l`

#### Open Solution Explorer Files Filter
- `ctrl-[, ctrl-o`

#### Open Solution Explorer Pending Changes Filter
- `ctrl-[, ctrl-p`

#### Open Solution Explorer Pending Changes Filter
- `ctrl-[, ctrl-p`

#### Search Team Explorer
- `ctrl-'`

#### Bookmark Current Window
- `ctrl-k, ctrl-w`

#### Got To Next Bookmark
- `ctrl-k, ctrl-n`

#### Show Class View
- `ctrl-k, ctrl-w`

#### Show Command Window
- `ctrl-alt-a`

#### Go To Last Cursor Location
- `ctrl-{-}`

#### Go To Next Cursor Location
- `ctrl-shift-{-}`

#### Show Object Browser
- `ctrl-alt-j`

#### View Server Page Code
- `F7`

#### Toggle Server Page Designer/Markup
- `shift-F7`

#### Search Solution Explorer
- `ctrl-;`

#### Close Document Window
- `ctrl-F$`

#### Close Current Document Window
- `ctrl-F4`

#### Close All Open Windows
- `alt-w, alt-l`

#### Go To Next Open Document
- `F6`

#### Go To Next Window Pane
- `alt-F6`

#### Go To Last Window Pane
- `alt-shift-F6`

#### Show Dock Menu
- `alt-{-}`

#### Show Test Explorer
- `ctrl-e, ctrl-t`

#### Switch to Saved Window Layout
- `ctrl-alt-{0-9}`

