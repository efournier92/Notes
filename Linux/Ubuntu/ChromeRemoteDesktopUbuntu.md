# [Chrome Remote Desktop Server](https://remotedesktop.google.com/)
# [Ubuntu](https://ubuntu.com/) Configuration

## Contents
- [Overview](#overview)
- [Commands](#commands)
  - [Download](#download)
  - [Install](#install)
  - [Stop the server](#stop-the-server)
  - [Backup the configuration file](#backup-the-configuration-file)
  - [Edit the configuration file](#edit-the-configuration-file)
  - [Configure resolution for default display](#configure-resolution-for-default-display)
  - [Configure default display number](#configure-default-display-number)
  - [Start the server](#start-the-server)

## Overview
When it comes to [remote desktops](https://en.wikipedia.org/wiki/Remote_desktop_software), I find [Google's](https://remotedesktop.google.com/) to be as sufficient and simple to install as anything. I find the following commands useful when setting up a server in [Ubuntu](https://ubuntu.com/).

## Commands

### Download

#### Description
Download from the package repository.

#### Command
```bash
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
```

### Install

#### Description
Install the [deb](https://en.wikipedia.org/wiki/Deb_(file_format)) package.

#### Command
```bash
sudo dpkg -i google-chrome-stable_current_amd64.deb
```

### Start

#### Description
Start the [remote desktop](https://en.wikipedia.org/wiki/Remote_desktop_software) server.

#### Command
```bash
/opt/google/chrome-remote-desktop/chrome-remote-desktop --stop
```

### Stop

#### Description
Stop the [remote desktop](https://en.wikipedia.org/wiki/Remote_desktop_software) server.

#### Command
```bash
/opt/google/chrome-remote-desktop/chrome-remote-desktop --stop
```

### Edit Configs

#### Description
Edit your [Chrome Remote Desktop](https://remotedesktop.google.com/) configuration file.

#### Command
```bash
sudo vim /opt/google/chrome-remote-desktop/chrome-remote-desktop
```

### Backup Configs

#### Description
Backup your [Chrome Remote Desktop](https://remotedesktop.google.com/) configuration file.

#### Command
```bash
sudo cp /opt/google/chrome-remote-desktop/chrome-remote-desktop /opt/google/chrome-remote-desktop/chrome-remote-desktop.orig
```

### Configure Resolution

#### Description
Configure screen resolution for your default display.

#### Command
```bash
DEFAULT_SIZES = "1920x1080"
```

### Configure Default Display

#### Description
Configure your default display number.

#### Command
```bash
FIRST_X_DISPLAY_NUMBER = 0
```

#### Comment the following from configs
```bash
# while os.path.exists(X_LOCK_FILE_TEMPLATE % display):
#   display += 1
```

### Configure `launch_session`

#### Description
Configure how the [Chrome Remote Desktop](https://remotedesktop.google.com/) session launches.

#### Command
```bash
def launch_session(self, x_args):
  self._init_child_env()
  self._setup_pulseaudio()
  self._setup_gnubby()
  #self._launch_x_server(x_args)
  #self._launch_x_session()
  display = self.get_unused_display_number()
  self.child_env["DISPLAY"] = ":%d" % display
```

