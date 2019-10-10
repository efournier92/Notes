# Visual Studio Code

## Overview
I like [Visual Studio Code](https://code.visualstudio.com/) as an IDE when working on client-side projects, particularly when using [Angular](https://angular.io/) and similar frameworks. Below are some tips I've learned while using it.

## Configurations

### Format On Save

#### Description
Format files when saving.

#### Steps
1. _File -> Preferences -> Settings_
2. `"editor.formatOnSave": true`

### Tab Indentation

#### Description
Change how tabs are treated.

#### Steps
1. _File -> Preferences -> Settings_
2. Set number of spaces in a Tab
  - Overridden based on the file contents if `editor.detectIndentation` is true
  - `"editor.tabSize": 2`
3. Insert spaces when pressing Tab
  - Overridden based on the file contents if `editor.detectIndentation` is true
  - `"editor.insertSpaces": true`
4. Detect `editor.tabSize` & `editor.insertSpaces` based on file contents
  - Set to false to force above values
  - `"editor.detectIndentation": false`

