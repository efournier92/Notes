# Visual Studio Performance Configuration

## Contents
- [Overview](#overview)
- [ReSharper Performance Optimization](#resharper-performance-optimization)
- [Visual Studio Keyboard Shortcuts](#visual-studio-keyboard-shortcuts)
- [ReSharper Shortcuts](#resharper-shortcuts)

## Overview
I use Visual Studio as my IDE for a large corporate [ASP.NET](https://docs.microsoft.com/en-us/aspnet/#pivot=aspnet) application I work on. I typically use it in conjuntion with
[JetBrains](https://www.jetbrains.com/) [ReSharper](https://www.jetbrains.com/resharper/). Below are some configurations I find useful.

## VS Performance Optimization

### Description
The following are options that can improve VS performance. Many of them disable potentially-useful functionality, so be aware of the costs and benefits to toggling these settings.

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

#### Semantic Colorization
1. `Text Editor -> C/C++ -> Advanced`
2. Set the `IntelliSense -> Disable Semantic Colorization` preference to `True`

#### Synchronized Settings
1. `Environment -> Accounts -> Synchronized settings`
2. Disable `Synchronize settings accross devices`

### Full Solution Analysis
1. `Text Editor -> C# -> Advanced`
2. Disable `Full Solution Analysis`

## [ReSharper](https://www.jetbrains.com/resharper/) Performance Optimization

### Description
[ReSharper](https://www.jetbrains.com/resharper/) is provides awesome tooling capabilities, but can also slow system performance to a crawl if left unchecked. Below are some performance optimizations that can improve usability on slower systems. Beware toggling all of them, lest you render [ReSharper](https://www.jetbrains.com/resharper/) virtually useless.

### Settings

#### Solution-Wide Analysis
1. `ReSharper -> Options -> Code Inspection -> Settings`
2. Ensure `Do not show Visual Studio Light Bulb` is selected and `Merge Visual Studio Light Bulb actions into ReSharper bulb` is cleared.
3. Disable `solution-wide analysis`

#### Extraneous Features
1. `ReSharper -> Options -> Environment -> Products & Features`
2. Disable any ReSharper features that you do not use

#### Solution Caches
1. `ReSharper -> Options -> Environment -> General`
2. Choose `System TEMP` in `Store solution caches`
3. In `Store solution caches in`, choose `System TEMP`

#### Completion
1. `ReSharper -> Options -> Environment -> IntelliSense -> Completion Appearance`
2. Clear `Show member signatures`
3. Clear `Show symbol types`
4. Clear `Show summary`.

#### IntelliSense
1. `ReSharper -> Options -> Environment -> IntelliSense -> General`
2. Turn off ReSharper's IntelliSense for specific languages (Custom IntelliSense) or turn it off altogether (Visual Studio).

#### Language-Specific Typos
1. `ReSharper -> Options -> Environment -> Editor -> Editor Behavior`
2. Disable `Auto-format on semicolon`
3. Disable `Auto-format on closing brace`
4. Disable `Correct common language-specific typos`

#### Highlighting
1. `ReSharper -> Options -> Environment -> Editor -> Editor Appearance`
2. Disable `Highlight current line`
3. Disable `Highlight matching delimiters`

#### Extensions
1. `ReSharper -> Options -> Environment -> Extension Manager`
2. Disable `ReSharper` extensions that you do not use.

#### `ReSharper` Build
1. `ReSharper -> Options -> Tools -> Build`
2. Enable `ReSharper` build

#### Context Actions
1. `ReSharper -> Options -> Code Editing -> Context Actions`
2. Disable the context actions that are not helpful to you.

#### Automatic Language Injections
1. `ReSharper -> Options -> Code Editing -> Language Injections`
2. Disable automatic language injections that are of no interest to you.

#### Disable Code Analysis | _Nuclear Option_
1. `ReSharper -> Options -> Environment -> General `
2. Disable `Enable code analysis`

## [Visual Studio]() Keyboard Shortcuts

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

## [ReSharper](https://www.jetbrains.com/resharper/) Shortcuts

### Description
Below is a list of hotkeys that ship as ReSharper's default keyboard layout.

### Shortcuts

#### Search Everything
- `ctrl-t`

#### Search Everything
- `ctrl-t`

#### Go To File
- `ctrl-shift-t`

#### Go To Symbol
- `alt-shift-t`

#### Show Cursor Actions List
- `alt-enter`

#### Go To Word
- `ctrl-t-t-t`

#### Find Usages
- `shift-F12`

#### Navigate To
- `alt-{``}`

#### Show Find Results Window
- `ctrl-alt-F12`

#### Go To Declaration
- `F12`

#### Go To Implementation
- `ctrl-F12`

#### Go To Usage
- `alt-shift-F12`

#### Move Type or Static Member
- `ctrl-r, ctrl-o`

#### Change Method Signature
- `ctrl-r, ctrl-s`

