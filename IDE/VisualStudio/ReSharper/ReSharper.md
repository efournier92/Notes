# [ReSharper](https://www.jetbrains.com/resharper/)

## Contents
- [Overview](#overview)
- [Performance Optimization](#performance-optimization)
- [Keyboard Shortcuts](#keyboard-shortcuts)

## Overview
[ReSharper](https://www.jetbrains.com/resharper/) provides some awesome tooling capabilities, which extend the power of [Visual Studio](https://visualstudio.microsoft.com/). Below are some tip surrounding its use.

## Performance Optimization

### Description
When left unchecked, [ReSharper](https://www.jetbrains.com/resharper/) can slow your system's performance to a crawl. Below are some performance optimizations that can improve usability on slower systems. Beware toggling all of them, lest you render [ReSharper](https://www.jetbrains.com/resharper/) virtually useless.

### Solution-Wide Analysis
1. `ReSharper -> Options -> Code Inspection -> Settings`
2. Ensure `Do not show Visual Studio Light Bulb` is selected and `Merge Visual Studio Light Bulb actions into ReSharper bulb` is cleared.
3. Disable `solution-wide analysis`

### Extraneous Features
1. `ReSharper -> Options -> Environment -> Products & Features`
2. Disable any ReSharper features that you do not use

### Solution Caches
1. `ReSharper -> Options -> Environment -> General`
2. Choose `System TEMP` in `Store solution caches`
3. In `Store solution caches in`, choose `System TEMP`

### Completion
1. `ReSharper -> Options -> Environment -> IntelliSense -> Completion Appearance`
2. Clear `Show member signatures`
3. Clear `Show symbol types`
4. Clear `Show summary`.

### IntelliSense
1. `ReSharper -> Options -> Environment -> IntelliSense -> General`
2. Turn off ReSharper's IntelliSense for specific languages (Custom IntelliSense) or turn it off altogether (Visual Studio).

### Language-Specific Typos
1. `ReSharper -> Options -> Environment -> Editor -> Editor Behavior`
2. Disable `Auto-format on semicolon`
3. Disable `Auto-format on closing brace`
4. Disable `Correct common language-specific typos`

### Highlighting
1. `ReSharper -> Options -> Environment -> Editor -> Editor Appearance`
2. Disable `Highlight current line`
3. Disable `Highlight matching delimiters`

### Extensions
1. `ReSharper -> Options -> Environment -> Extension Manager`
2. Disable `ReSharper` extensions that you do not use.

### `ReSharper` Build
1. `ReSharper -> Options -> Tools -> Build`
2. Enable `ReSharper` build

### Context Actions
1. `ReSharper -> Options -> Code Editing -> Context Actions`
2. Disable the context actions that are not helpful to you.

### Automatic Language Injections
1. `ReSharper -> Options -> Code Editing -> Language Injections`
2. Disable automatic language injections that are of no interest to you.

### Disable Code Analysis | _Nuclear Option_
1. `ReSharper -> Options -> Environment -> General `
2. Disable `Enable code analysis`

## Shortcuts

### Description
Below is a list of hotkeys that ship as [ReSharper's](https://www.jetbrains.com/resharper/) default keyboard layout.

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

