# Raspberry Pi | Lubuntu Configuration

## Overview

### Purpose
- Since the release of the `Rasberry Pi 4` with 8GB of RAM, it started to seem feasible to use it as a decent media box. I predominately wanted to use it to run `Kodi`, but didn't want to settle for distribution built specifically for that purpose like `LibreElec` or `LibreElec`. Instead, I wanted a full desktop environment, from which I could also launch a browser and perform other general-purpose tasks. After much trial and error testing all Linux distributions available for Pi in 2021, I settled on an `Lubuntu` build. Below is a collection of commands and configurations I used to accomplish this task.

### Notes
- Much as I've often seen recent editions of `Lubuntu` slammed online, I've been impressed with the `20.10` build I installed in February of 2021. The default `Gnome` build is too resource hungry to consistently run smoothly on the `Raspberry Pi 4`, while `LXDE` trims enough fat to get rid of the lag I was facing on `Gnome`. I find the `Lununtu` flavor of `LXDE` gives me a solid base to build upon, without having to perform too much configuration in order to get a decent-looking UI. It still lacks on the eye candy as compared to `Gnome`, but provides a suitable trade off for running on underpowered architecture.
- As of February 2021, `Ubuntu` does not offer an `Lubuntu` flavored installer for the Pi. In order to achieve as close as possible to a minimal build, the below instructions include steps to removing all packages specific to `Gnome`. I prefer to trim all that fat to begin with, then reinstall packages as I find a need for them.
- The below should work if you have a `Rasberry Pi 4` with 8GB of RAM, which you plan to attach to a hi-res LED TV. Certain tweaks would be necessary if your needs differ from the parameters under which I was testing.

## Prepare the SD Card
1. Using a piece of black duct tape, fold around the top of the card to form a tail
  - This is critical for easy retrieval from the Pi's slot
    - Improper retrieval can easily break the card
2. Cut the tail to a reasonable length

## Download `Raspberry Pi Imager`

### Application Description
- This tool is useful for flashing operating-system images to an SD card without any hassle
  - The same can also be accomplished via the command line, albeit more tediously

### Ubuntu
- `sudo apt install rpi-imager`

### Manjaro
- `sudo pamac build rpi-imager`

## Install Ubuntu

### Flash Ubuntu to an SD Card
1. Use the `Raspberry Pi Imager` GUI to choose and flash an image to your SD card.
    - Can download the supported operating system image of our choice.
    - Can install a pre-downloaded image we already have.

### Complete Setup
1. Follow Ubuntu's first-boot prompts to complete the setup process.

### Configure `config.txt`
1. Open `config.txt` via the following command
    - `sudo vim /boot/firmware/config.txt`
2. Ensure the following custom configurations are present
    - `gpu_mem=512`
    - `disable_overscan=1`
3. Reboot

### Install `Lubuntu`
1. Install `Lubuntu` via the following command
    - `sudo apt install lubuntu`

### Launch `Lubuntu`
1. Log out of the default `Gnome` shell
2. From the `gdm` display manager, select the gear icon, then `Lubuntu`
3. Enter passwords to boot into `Lubuntu`
4. Launch a terminal instance

### Update `apt`
- `sudo apt update`

### Delete Extraneous Packages

#### Delete Gnome Packages
1. Run the following commands to delete all packages pre-installed for Gnome
  - This essentially reverts to a minimal build (_not offered for Pi as of 2021_)

```bash
sudo apt purge --auto-remove \
  ubuntu-gnome-desktop \
  gnome* \
  libreoffice* \
  aisleriot \
  baobab \
  branding-ubuntu \
  cheese \
  deja-dup \
  example-content \
  gir1.2-rb-3.0 \
  gir1.2-totem-1.0 \
  gir1.2-totemplparser-1.0 \
  guile-2.0-libs \
  hyphen-en-us \
  k3b \
  librhythmbox-core10 \
  libtotem0 \
  mythes-en-us \
  rhythmbox \
  rhythmbox-data \
  rhythmbox-plugin-alternative-toolbar \
  rhythmbox-plugins \
  shotwell \
  shotwell-common \
  simple-scan \
  thunderbird \
  thunderbird-gnome-support \
  thunderbird-locale-en \
  thunderbird-locale-en-us \
  totem \
  totem-common \
  totem-plugins \
  transmission-common \
  transmission-gtk \
  ubuntu-web-launchers \
  uno-libs3 \
  usb-creator-gtk \
  vino \
  zeitgeist-core
```

#### Hunt Down Even More Extraneous Packages
1. Open the `Applications Menu`
2. Locate any other unnecessary packages
    - Uninstall them individually via `sudo apt purge`

#### Run `apt` Cleanup Commands
1. `sudo apt autoremove`
2. `sudo apt remove`
3. `sudo apt autoclean`
4. `sudo apt clean`
5. `sudo apt update`

## Install Additional Packages

### Kodi
- `sudo apt install kodi`

### Veracrypt
- `sudo add-apt-repository ppa:unit193/encryption`
- `sudo apt install veracrypt`

### VLC
- `sudo apt install bleachbit`

### BleachBit
- `sudo apt install bleachbit`

### Firefox
- `sudo apt install firefox`

### Remmina
- `sudo apt install remmina`

### Curl
- `sudo apt install curl`

### Progress
- `sudo apt install progress`

### Eog
- `sudo apt install eog`

### Vim
- `sudo apt install vim-gtk3`

### Tmux
- `sudo apt install tmux`

### Zsh
- `sudo apt install zsh`

### Oh-My-Zsh
- `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

## Configure Monitor Settings
1. `Application Menu > Preferences > LXQt settings > Monitor settings`
2. In the `Setup` tab, configure the following
    - `Resolution` : `1920x1080`

## Configure the Main Panel
1. Right click the main panel
2. Use the following as guidelines for suggested panel configuration

### Panel
- `Size` : `32px`
- `Icon Size` : `22px`
- `Length` : `100%`
- `Rows` : `1`
- `Alignment` : `Left`
- `Position` : `Bottom of desktop`
- `Auto-hide` : `disabled`
- `Reserve space on display` : `enabled`
- `Override icon theme` : `enabled`
- `Icon theme for panels` : `Papirus-Dark`

### Widgets
- `Application menu`
- `Task manager`
- `Removable media`
- `Volume control`
- `System tray`
- `World clock`

#### Configure `Removable Media`
1. Select `Removable Media`
2. Select the gear icon from the right-hand panel
3. In the `Removable Media Settings` window
    - `When a device is connected` : `Do nothing`

#### Configure `Volume control`
1. From the main panel, right click the audio icon, then select `Configure "Volume control"`
2. In the `Volume Control Settings` window, configure the following
    - `Device to control` : `PulseAudio` : `Built-in Audio Stereo`
    - `Mute on middle click` : `enabled`
    - `Show on mouse click` : `enabled`
    - `Allow volume beyond 100% (odB)` : `disabled`
    - `Always notify about volume changes` : `disabled`
    - `Notify about volume changes with keyboard` : `enabled`
    - `Volume adjust step` : `5`
    - `External Mixer` : `pavucontrol-qt`

#### Configure `PulseAudio Volume Control`
1. From the `Application Menu`, open `Sound & Video > PulseAudio Volume Control`
2. Click the `Output Devices` tab
3. Find the section with port named `Analog Output`
4. Select `Set as fallback` in the `Analog Output` section

#### Configure `Desktop Notifications`
1. `Application Menu > Preferences > LXQt settings > Destop Notifications`
2. In the `Desktop Notifications` window, configure the following

##### Basic Settings
- `Position on screen` : `Top left`

##### Advanced Settings
- `Default Duration` : `1 sec`
- `Width` : `300 px`
- `Spacing` : `6 px`
- `How many to save` : `0`

## Configure Terminal
1. Install `gnome-terminal`
    - `sudo apt install gnome-terminal`
2. Set `gnome-terminal` as default
    - `Application Menu > Preferences > LXQt settings > Session Settings`
    - Select `default Applications`
      - Next to `terminal Emulation` selection `Search`
      - Locate and select `/usr/bin/gnome-terminal`
3. Add config files from the following location
    - `git clone https://github.com/efournier92/Notes`
    - `cd Notes/Terminal/Configs`
    - `cp tmux* vim* zsh* ~`
4. Load `Material` profile
    - `git clone https://github.com/efournier92/Notes`
    - `cd Notes/Terminal/Colors`
    - Find the UUID of default profile via the following command
      - `dconf dump /org/gnome/terminal/legacy/profiles:/`
    - Load the saved profile to the existing default profile via the following command
      - `dconf load /org/gnome/terminal/legacy/profiles:/$UUID < material-dark-profile.conf`
5. Finish configuration
    - Launch `gnome-terminal`
    - Right click the terminal
    - Select `Preferences`
    - From the left-hand menu, select `General` and configure the following
      - `Show menubar by default in new terminals` : `disabled`
      - `Enable mnemonics` : `disabled`
      - `Enable the menu accelerator key` : `enabled`
      - `Theme variant` : `Dark`
      - `New tab position` : `Last`
    - Under `Profiles` select `Material`, then navigate to the `Command` tab and configure the following
      - `Run command as a login shell` : `disabled`
      - `Run a custom command instead of my shell` : `enabled`
      - `Custom command` : `zsh /home/${user}/.tmux/sessions/base.session`
      - `Preserve working directory` : `Shell only`
      - `When command exits` : `Restart the command`

## Automatic Login
1. Create or edit file `/etc/sddm.conf`
    - `sudo vim /etc/sddm.conf`
2. Add the following contents to that file

```txt
[Autologin]
Session=Lubuntu.desktop
User=pi
```

## Shortcuts

### Open `Shortcut Keys` Settings
1. Navigate to `Application Menu > Preferences > LXQt settings > Shortcut Keys`

### Terminal
1. Locate and select the shortcut with description `Launch Terminal`
2. In the right-hand menu, select `Modify...`
3. Enter the following in the `Command` field
    - `gnome-terminal --window --maximize`
4. Select `OK`

### Web Browser
1. Locate and select the shortcut with description `Web browser`
2. In the right-hand menu, select `Modify...`
3. Enter the following in the `Description` field
    - `Launch web browser`
4. Enter the following in the `Command` field
    - `firefox`
5. Select `OK`

### Kodi
1. In the right-hand menu, click `Add...`
2. Select the `Shortcut` field, then press `Control+Alt+K`
3. Enter the following in the `Description` field
    - `Launch Kodi`
4. Enter the following in the `Command` field
    - `kodi -fs`

## Theming

### Resources
- [How I Theme My Raspberry Pi OS | Novaspirit Tech](https://www.youtube.com/watch?v=gHUjO6MK5fg)

### Install Theme Packages
1. Install `Arc`, `Papirus`, and `Breeze` via the following command
    - `sudo apt install arc-theme papirus-icon-them breeze-cursor-theme`

### Change the Main Theme
1. Open `Application Menu > Preferences > LXQt settings > Appearance`
2. Select `Widget Style`
    - Select `Breeze` for `Qt Style`
    - Select `Arc-Dark` for `GTK 2 Theme`
    - Select `Arc-Dark` for `GTK 3 Theme`
3. Select `Icons Theme`
    - Select `Papirus-Dark`
4. Select `Cursor`
    - Select `Breeze`
5. In the main window, select `Apply`
6. In the main window, select `Close`

#### Change the `Application Menu` Icon
1. Right click the `Application Menu` in main bottom panel
2. Select `Manage Widgets`
3. Select `Appliction Menu`, then click the right-hand gear icon for settings
4. Select the checkbox next to `Icon`
5. Click the folder icon, then navigate to the following file
    - `/usr/share/icons/Papirus-Dark/22x22/actions/application-menu.svg`
6. Select open
7. Close the `Main Menu settings` window

#### OpenBox

##### Install the `Arc-Openbox` Theme
1. `cd /usr/share/themes`
2. `sudo git clone https://github.com/dglava/arc-openbox`
3. `sudo mv arc-openbox Arc-Openbox`

##### Enable the `Arc-Openbox` Theme
1. From the `Application Launcher`, open `Menu > Preferences > LXQt settings > Openbox Settings > Theme`
2. Select `Install a new theme...`
3. Navigate to `/usr/share/themes/Arc-Openbox`
    - Select `arc-dark.obt`
    - Click `Open`
4. Back in the menu, select `Arc-Dark`, then click `Close`

## Fix Choppy Audio
1. Open the `PulseAudio` default configuration file
    - `sudo vim /etc/pulse/default.pa`
2. Find the following line
    - `Load-module module-udev-detect`
3. Modify the above line to the below
    - `load-module module-udev-detect tsched=0`

## Change User Properties
1. Run `User and Group Settings` as root via the following command
    - `sudo lxqt-admin-user`
2. Use to GUI tools to alter basic user properties

### Change a User's Name
1. Launch `User and Group Settings` as root via the following command
    - `sudo lxqt-admin-user`
2. Use to the GUI tools to create a new user
    - Name the user `alt`
3. Disable auto login
    - `sudo vim /etc/sddm.conf`
    - Comment out all lines in `/etc/sddm.conf`
4. Reboot
5. Login as `alt`
6. `sudo lxqt-admin-user`
7. Change the original user's name
8. Move the user's `home` directory to match the new name
    - `sudo mv /home/${ORIGINAL_NAME} /home/${NEW_NAME}`
9. Reboot
10. Login as the under the new username
11. `sudo lxqt-admin-user`
12. Use to the GUI tools to delete the `alt` user

## Backup via `Clonezilla`
1. Boot up a `Clonezilla Live` image
2. Select `device-image`
3. Select `local_dev`

