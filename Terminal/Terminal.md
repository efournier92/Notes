# Terminal

## Contents

- [Overview](#overview)
- [Full Configuration](#full-configuration)
- [Zsh](#zsh)
- [Vim](#vim)
  - [`vimrc` Changelog](#vimrc-changelog)
- [Oh My Zsh](#oh-my-zsh)
- [Midnight Commander](#midnight-commander)

## Overview

Whether it's called a [Terminal](https://en.wikipedia.org/wiki/Terminal_emulator) or a [Command Prompt](https://en.wikipedia.org/wiki/Cmd.exe), it's the most powerful program installed on your machine. I prefer to operate in a [GNOME Terminal](https://en.wikipedia.org/wiki/GNOME_Terminal) environment, and have spent a lot of time configuring my shell. In doing so, I've identified three tools I prefer not to live without: [tmux](https://github.com/tmux/tmux/wiki), [vim](https://www.vim.org/docs.php), and [Oh My Zsh](git clone https://github.com/robbyrussell/oh-my-zsh.git). The following outlines my favorite shell configuration, centered on those. This configuration tends to serve me well in most [Unix-like](https://en.wikipedia.org/wiki/Unix-like) environments.

## Full Configuration

### Description

I maintain the following location as a repository for all the [shell](https://en.wikipedia.org/wiki/Shell_(computing)) configuration files that live in my `home` directory.

### Location

[Github](https://github.com/efournier92/Notes/blob/master/Terminal/configs/)

## [Zsh](https://en.wikipedia.org/wiki/Z_shell)

### Description

[Zsh](https://en.wikipedia.org/wiki/Z_shell) is an improved extension of [Bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell)), with enough enhanced features to warant installing it. It's configured via `~/.zshrc`.

### Installation

#### Via [Apt](https://en.wikipedia.org/wiki/APT_(software))

```bash
sudo apt install zsh
```

#### `.zshrc`

[Github](https://github.com/efournier92/Notes/blob/master/Terminal/configs/.zshrc)

## [Vim](https://en.wikipedia.org/wiki/Vim_(text_editor))

### Description

Vim's been around since 1991, when it was cloned from [vi](https://en.wikipedia.org/wiki/Vi), which came out in 1976. Its staying power can't be denied, but its use today can be controversial. I dig controversy, and use [Vim](https://en.wikipedia.org/wiki/Vim_(text_editor)) on a daily basis. I'm not militant about it, and use other text editors too. However, when it comes to taking notes in [Markdown](https://daringfireball.net/projects/markdown/), editing small projects, or quickly manipulating a large block of text, I choose [Vim](https://en.wikipedia.org/wiki/Vim_(text_editor)) every time. It's configured via the `~/.vimrc` file, which I've been tweaking for years: it was changing so rapidly for a period of time, that I started taking snapshot backups, which are linked below.

### Installation

#### Via [Apt](https://en.wikipedia.org/wiki/APT_(software))

```bash
sudo apt install vim
```

### `.vimrc`

- [Github](https://github.com/efournier92/Notes/blob/master/Terminal/configs/.vimrc)

### `.vimrc` Changelog

- [16-05-21](https://github.com/efournier92/Notes/blob/master/Terminal/Vimrcs/16-05-21_vimrc)
- [16-06-20](https://github.com/efournier92/Notes/blob/master/Terminal/Vimrcs/16-06-20_vimrc)
- [16-12-27](https://github.com/efournier92/Notes/blob/master/Terminal/Vimrcs/16-12-27_vimrc)
- [18-01-14](https://github.com/efournier92/Notes/blob/master/Terminal/Vimrcs/18-01-14_vimrc)
- [18-01-17](https://github.com/efournier92/Notes/blob/master/Terminal/Vimrcs/18-01-17_vimrc)
- [18-01-29](https://github.com/efournier92/Notes/blob/master/Terminal/Vimrcs/18-01-29_vimrc)
- [18-02-06 *viminfo*](https://github.com/efournier92/Notes/blob/master/Terminal/Vimrcs/18-02-06_viminfo)
- [19-11-09](https://github.com/efournier92/Notes/blob/master/Terminal/Vimrcs/19-11-09_vimrc)

## [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)

### Description

[Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) bills itself "a community-driven framework for managing your zsh configuration." I must admit, it's a very nice compliment to [Zsh](https://en.wikipedia.org/wiki/Z_shell), with excellent theming configurations. Although it's less important to me than the others on this list, I still consider it worth installing on most systems.

### Installation

#### Via [Apt](https://en.wikipedia.org/wiki/APT_(software))

```bash
sudo apt-get install powerline fonts-powerline
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
```

### `~/.oh-my-zsh/`

[Github](https://github.com/efournier92/Notes/blob/master/Terminal/configs/.oh-my-zsh)

## [Midnight Commander](https://midnight-commander.org/)

### Description

[Midnight Commander](https://midnight-commander.org/) is an [orthodox file manager](https://en.wikipedia.org/wiki/File_manager#Orthodox_file_managers), for use within the [CLI](https://en.wikipedia.org/wiki/Command-line_interface). I once leaned on it heavily, before I discovered that no [file manager](https://en.wikipedia.org/wiki/File_manager) can match the power of [cp](http://linuxcommand.org/lc3_man_pages/cp1.html), [mv](http://linuxcommand.org/lc3_man_pages/mv1.html), [rm](http://linuxcommand.org/lc3_man_pages/rm1.html), and the array of other power-tools your [shell](https://en.wikipedia.org/wiki/Shell_(computing)) has to offer. When forced to browse a directory tree visually though, I still pop open [mc](https://midnight-commander.org/).

### Installation

#### Via [Apt](https://en.wikipedia.org/wiki/APT_(software))

```bash
sudo apt-get install mc
```

### Shortcuts

#### Description

I've compiled further details about [Midnight Commander](https://midnight-commander.org/), along with a complete list of default [keyboard shortcuts](https://en.wikipedia.org/wiki/Keyboard_shortcut), at the following location.

#### Location

[Github](https://github.com/efournier92/Notes/blob/master/Terminal/MidnightCommander/MidnightCommander.md)

