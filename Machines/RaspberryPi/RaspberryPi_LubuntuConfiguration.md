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
1. Cut the tail to a reasonable length

## Download `Raspberry Pi Imager`

### Application Description
- This tool is useful for flashing operating-system images to an SD card without any hassle
  - The same can also be accomplished via the command line, albeit more tediously

### Ubuntu
- `$ sudo apt install rpi-imager`

### Manjaro
- `$ sudo pamac build rpi-imager`

## Install Ubuntu

### Flash Ubuntu to an SD Card
1. Use the `Raspberry Pi Imager` GUI to choose and flash an image to your SD card.
    - Can download the supported operating system image of our choice.
    - Can install a pre-downloaded image we already have.

### Complete Setup
1. Follow Ubuntu's first-boot prompts to complete the setup process.

### Configure `config.txt`
1. Open `config.txt` via the following command
    - `$ sudo vim /boot/firmware/config.txt`
1. Ensure the following custom configurations are present
    - `gpu_mem=512`
    - `disable_overscan=1`
    - `hdmi_force_edid_audio=1`
    - `hdmi_drive=2`
    - `disable_splash=1`
    - `boot_delay=0`
    - `disable_fw_kms_setup=1`
    - `force_turbo=1`
1. Reboot

### Install `Lubuntu`
1. Install `Lubuntu` via the following command
    - `$ sudo apt install lubuntu`

### Launch `Lubuntu`
1. Log out of the default `Gnome` shell
1. From the `gdm` display manager, select the gear icon, then `Lubuntu`
1. Enter passwords to boot into `Lubuntu`
1. Launch a terminal instance

### Update `apt`
- `$ sudo apt update`

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
  lxqt-notificationd \
  lxqt-powermanagement \
  lxqt-powermanagement-l10n \
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
  update-notifier \
  usb-creator-gtk \
  vino \
  zeitgeist-core
```

#### Hunt Down Even More Extraneous Packages
1. Open the `Applications Menu`
1. Locate any other unnecessary packages
    - Uninstall them individually via `sudo apt purge`

#### Run `apt` Cleanup Commands
1. `$ sudo apt autoremove`
1. `$ sudo apt remove`
1. `$ sudo apt autoclean`
1. `$ sudo apt clean`
1. `$ sudo apt update`

## Install Additional Packages

### Kodi
- `$ sudo apt install kodi`

### Veracrypt
- `$ sudo add-apt-repository ppa:unit193/encryption`
- `$ sudo apt install veracrypt`

### VLC
- `$ sudo apt install bleachbit`

### BleachBit
- `$ sudo apt install bleachbit`

### Firefox
- `$ sudo apt install firefox`

### Remmina
- `$ sudo apt install remmina`

### Curl
- `$ sudo apt install curl`

### Progress
- `$ sudo apt install progress`

### Eog
- `$ sudo apt install eog`

### Vim
- `$ sudo apt install vim-gtk3`

### Tmux
- `$ sudo apt install tmux`

### Zsh
- `$ sudo apt install zsh`

### OpenVPN
- `$ sudo apt install openvpn`

### TigerVNC
- `$ sudo apt install tigervnc-scraping-server`

### Oh-My-Zsh
- `$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

### Power Manager
- `$ sudo apt install xfce4-power-manager`

## Configure Monitor Settings
1. `Application Menu > Preferences > LXQt settings > Monitor settings`
1. In the `Setup` tab, configure the following
    - `Resolution` : `1920x1080`

## Configure the Main Panel
1. Right click the main panel
1. Use the following as guidelines for suggested panel configuration

### Panel
- `Size` : `26px`
- `Icon Size` : `20px`
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
1. Select the gear icon from the right-hand panel
1. In the `Removable Media Settings` window
    - `When a device is connected` : `Do nothing`

#### Configure `Volume control`
1. Select `Removable Media`
1. Select the gear icon from the right-hand panel
1. In the `Volume Control Settings` window, configure the following
    - `Device to control` : `PulseAudio` : `Built-in Audio Stereo`
    - `Mute on middle click` : `enabled`
    - `Show on mouse click` : `enabled`
    - `Allow volume beyond 100% (odB)` : `disabled`
    - `Always notify about volume changes` : `disabled`
    - `Notify about volume changes with keyboard` : `enabled`
    - `Volume adjust step` : `5`
    - `External Mixer` : `pavucontrol-qt`

#### Configure `PulseAudio Volume Control`
1. Open `Application Menu`, open `Sound & Video > PulseAudio Volume Control`
1. Click the `Output Devices` tab
1. Find the section with port named `Analog Output`
1. Select `Set as fallback` in the `Analog Output` section

#### Configure `Desktop Notifications`
1. `Application Menu > Preferences > LXQt settings > Destop Notifications`
1. In the `Desktop Notifications` window, configure the following

##### Basic Settings
- `Position on screen` : `<top right>`

##### Advanced Settings
- `Default Duration` : `3 sec`
- `Width` : `300 px`
- `Spacing` : `6 px`
- `How many to save` : `0`

## Configure Terminal 

### Rpi User
1. Install `gnome-terminal`
    - `$ sudo apt install gnome-terminal`
1. Set `gnome-terminal` as default
    - `Application Menu > Preferences > LXQt settings > Session Settings`
    - Select `default Applications`
      - Next to `terminal Emulation` selection `Search`
      - Locate and select `/usr/bin/gnome-terminal`
1. Add config files from the following location
    - `$ mkdir ~/cs`
    - `$ git clone https://github.com/efournier92/Notes`
    - `$ cd ~/cs/Notes`
    - `$ cd Notes/Terminal/Configs`
    - `$ cp tmux* vim* zsh* ~`
1. Use `zsh` as the default shell
    - `$ chsh`
      - `$ /bin/zsh`
1. Create a `dconf` entry for our `gnome-terminal` profile
    - Load `gnome-terminal` via command
    - Right click anywhere in the terminal, then click `preferences`
    - Select the only item under `Profiles`
    - Change any configuration value
1. Load `Material` profile
    - `$ git clone https://github.com/efournier92/Notes`
    - `$ cd Notes/Terminal/Colors`
    - Find the UUID of default profile via the following command
      - `$ dconf dump /org/gnome/terminal/legacy/profiles:/`
    - Load the saved profile to the existing default profile via the following command
      - `$ dconf load /org/gnome/terminal/legacy/profiles:/$UUID/ < material-dark-profile.conf`
1. Finish configuration
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

### Root User
1. Start a session as root
    - `$ sudo su`
1. Add config files from the following location
    - `$ cd /home/rpi/cs/Terminal/Configs`
    - `$ cp tmux* vim* zsh* ~`
1. Install `Oh-My-Zsh`
    - `$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
1. Use `zsh` as the default shell
  - `$ chsh`
    - `$ /bin/zsh`

## Automatic Login
1. Create or edit file `/etc/sddm.conf`
    - `$ sudo vim /etc/sddm.conf`
1. Add the following contents to that file

```txt
[Autologin]
Session=Lubuntu.desktop
User=pi
```

## Add Gnome-Terminal to `Applications Menu`
1. Create a new `desktop` item via the following command
    - `sudo vim /usr/share/applications/gterminal.desktop`
1. Add the following contents in the new file

```txt
[Desktop Entry]
Type=Application
Categories=System
Name=GTerminal
Icon=utilities-terminal
Exec=gnome-terminal
```

## Boot Script

### Purpose
- I like to use a script to run a set of boot tasks when my system starts up. This file can be configured in any way, but an example of mine is available at the following location.
  - [boot_tasks](https://raw.githubusercontent.com/efournier92/Notes/master/Scripts/Bash/boot_tasks)

### Create Boot Script
1. Copy the `boot_tasks` file from the repository we created above to our `scripts` directory
    - `$ mkdir -p ~/scripts`
    - `$ cp ~/cs/Notes/Scripts/Bash/boot_tasks ~/scripts`
1. Regardless of how we choose to configure this file, the block pertinent to a Lubuntu build on Raspberry Pi goes as follows.

```bash
run_pi_media_tasks() {
  $HOME/scripts/connect_vpn_persistently &
  $HOME/scripts/connect_vnc_server_persistently &
  setxkbmap -option caps:escape
  pacmd set-default-sink alsa_output.platform-bcm2835_audio.stereo-fallback
  m_md
  kodi -fs &
  gnome-terminal --window --maximize &
}
```

### Run Script on Boot
1. Create a new `desktop` file in `autostart`
    - `$ vim ~/.config/autostart/boot.desktop`
1. Paste the following block into that file

```txt
[Desktop Entry]
Type=Application
Name=boot
Exec=/home/${user}/scripts/boot_tasks pi_media
```

### VPN-Server Configuration

#### Purpose
- Having an active VNC server is useful for remoting into this machine's shell from elsewhere.
  - Enable this with discretion and be sure to have a strong password!

#### Start OpenVPN on Boot
1. Copy the `connect_vpn_persistly` file from the repository we created above to our `scripts` directory
    - `$ cp ~/cs/Notes/Scripts/Bash/connect_vpn_persistently ~/scripts`
1. Open `boot-tasks`
    - `$ vim ~/scripts/boot_tasks`
1. Ensure the following line is present in the `run_pi_media_tasks` function
    - `$HOME/scripts/connect_vpn_persistently &`

#### Add a VPN Connection
1. Download a `.ovpn` file for our host
    - Save file anywhere temporarily
1. Open `Application Menu > Preferences > Advanced Network Configuration`
    - Select the `+` icon in the bottom-left corner
    - Select `Import a saved VPN configuration` under `Connection Type`
    - Select `Create...`
    - Input username and password in the next dialog
    - Select `People` icon next to the password field
      - Select `Store the password for all users`
    - Select `Save`

#### View/Edit VPN Connection Details
1. Run the following command to view the contents of our VPN configuration
    - `$ sudo vim /etc/NetworkManager/system-connections/Calypso.nmconnection`

### VNC-Server Configuration

#### Purpose
- Having an active VNC server is useful for remoting into this machine's GUI from elsewhere.

#### Start TigerVNC Server on Boot
1. Copy the `connect_vnc_persistently` file from the repository we created above to our `scripts` directory
    - `$ cp ~/cs/Notes/Scripts/Bash/connect_vnc_persistently ~/scripts`
1. Open `boot-tasks`
    - `$ vim ~/scripts/boot_tasks`
1. Ensure the following line is present in the `run_pi_media_tasks` function
    - `$HOME/scripts/connect_vnc_persistently &`

### Fix HDMI Audio

#### Purpose
- Because the Raspberry pie has both HDMI and headphone-jack outputs, PulseAudio tends to be inconsistent with which index it loads assigns to each, which leads to a frustrating experience of not having audio after boot 50% of the time. I choose to address this with a script I wrote, available in the same repository we cloned above, to be executed once at boot time.

#### Detect PulseAudio HDMI Sink on Boot
1. Copy the `connect_vnc_persistently` file from the repository we created above to our `scripts` directory
    - `$ cp ~/cs/Notes/Scripts/Bash/pulseaudio_set_default_sink ~/scripts`
1. Open `boot-tasks`
    - `$ vim ~/scripts/boot_tasks`
1. Ensure the following line is present in the `run_pi_media_tasks` function
    - `$HOME/scripts/pulseaudio_set_default_sink &`

#### Useful PulseAudio Commands

##### Edit the default configuration at system level
- `$ sudo vim /etc/pulse/default.pa`

##### Edit the default configuration for user
- `$ cp /etc/pulse/default.pa ~/.config/pulse/`
- `$ vim ~/.config/pulse/default.pa`

##### List all sinks
- `$ pactl list sinks`
- `$ pactl list short sinks`
- `$ pacmd list-sinks`

##### Edit a Sound Profile
- `$ sudo vim /usr/share/pulseaudio/alsa-mixer/paths/...`

## Shortcuts

### Open `Shortcut Keys` Settings
1. Navigate to `Application Menu > Preferences > LXQt settings > Shortcut Keys`

### Terminal
1. Locate and select the shortcut with description `Launch Terminal`
1. In the right-hand menu, select `Modify...`
1. Enter the following in the `Command` field
    - `gnome-terminal --window --maximize`
1. Select `OK`

### Web Browser
1. Locate and select the shortcut with description `Web browser`
1. In the right-hand menu, select `Modify...`
1. Enter the following in the `Description` field
    - `Launch Browser`
1. Enter the following in the `Command` field
    - `firefox`
1. Select `OK`

### Kodi
1. In the right-hand menu, click `Add...`
1. Select the `Shortcut` field, then press `Control+Alt+K`
1. Enter the following in the `Description` field
    - `Launch Kodi`
1. Enter the following in the `Command` field
    - `kodi -fs`

## Theming

### Resources
- [How I Theme My Raspberry Pi OS | Novaspirit Tech](https://www.youtube.com/watch?v=gHUjO6MK5fg)

### Install Theme Packages
1. Install `Arc`, `Papirus`, and `Breeze` via the following command
    - `$ sudo apt install arc-theme papirus-icon-them breeze-cursor-theme`

### Change the Main Theme
1. Open `Application Menu > Preferences > LXQt settings > Appearance`
1. Select `Widget Style`
    - Select `Breeze` for `Qt Style`
    - Select `Arc-Dark` for `GTK 2 Theme`
    - Select `Arc-Dark` for `GTK 3 Theme`
1. Select `Icons Theme`
    - Select `Papirus-Dark`
1. Select `Cursor`
    - Select `Breeze`
1. In the main window, select `Apply`
1. In the main window, select `Close`

#### Change the `Application Menu` Icon
1. Right click the `Application Menu` in main bottom panel
1. Select `Manage Widgets`
1. Select `Appliction Menu`, then click the right-hand gear icon for settings
1. Select the checkbox next to `Icon`
1. Click the folder icon, then navigate to the following file
    - `/usr/share/icons/Papirus-Dark/22x22/actions/application-menu.svg`
1. Select open
1. Close the `Main Menu settings` window

#### OpenBox

##### Install the `Arc-Openbox` Theme
1. `cd /usr/share/themes`
1. `sudo git clone https://github.com/dglava/arc-openbox`
1. `sudo mv arc-openbox Arc-Openbox`

##### Enable the `Arc-Openbox` Theme
1. From the `Application Launcher`, open `Menu > Preferences > LXQt settings > Openbox Settings`
1. Select the `Theme` tab
1. Select `Install a new theme...`
1. Navigate to `/usr/share/themes/Arc-Openbox`
    - Select `arc-dark.obt`
    - Click `Open`
1. Back in the menu, select `Arc-Dark`, then click `Close`

## Power Settings

### Enable Sleep On Idle
1. Open `Application Menu > Preferences > Power Manager`
1. Select the `Display` tab
1. Configure the following
    - `Blank after` : `<60 minutes>`
    - `Put to sleep after` : `<60 minutes>`
    - `Switch off after` : `<60 minutes>`

## Fix Choppy Audio
1. Open the `PulseAudio` default configuration file
    - `$ sudo vim /etc/pulse/default.pa`
1. Find the following line
    - `$ load-module module-udev-detect`
1. Modify the above line to the below
    - `$ load-module module-udev-detect tsched=0`

## Change User Properties
1. Run `User and Group Settings` as root via the following command
    - `$ sudo lxqt-admin-user`
1. Use to GUI tools to alter basic user properties

### Change a User's Name
1. Launch `User and Group Settings` as root via the following command
    - `$ sudo lxqt-admin-user`
1. Use to the GUI tools to create a new user
    - Name the user `alt`
1. Disable auto login
    - `$ sudo vim /etc/sddm.conf`
    - Comment out all lines in `/etc/sddm.conf`
1. Reboot
1. Login as `alt`
1. `$ sudo lxqt-admin-user`
1. Change the original user's name
1. Move the user's `home` directory to match the new name
    - `$ sudo mv /home/${ORIGINAL_NAME} /home/${NEW_NAME}`
1. Reboot
1. Login as the under the new username
1. `$ sudo lxqt-admin-user`
1. Use to the GUI tools to delete the `alt` user

## Backup via `Clonezilla`
1. Boot up a `Clonezilla Live` image
1. Select `device-image`
1. Select `local_dev`
1. Wait for all necessary devices to be recognized, then press `Ctrl-C`
1. Select the directory where we want the backup image to be stored, then select `<Done>`
1. Choose `Beginner` mode for the wizard
1. Select `savedisk`
1. Input a name for our image
1. Choose the SD card as the disk we want to back up
1. Select `Skip checking/repairing the file system`
1. Select `Yes, check the saved image`
1. Select `Encrpyt the image`
1. Select `Shutdown` as the action once everything is finished
1. Enter our password for recovering the backup later
1. Accept all subsequent prompts
1. Wait for the backup process to complete and our machine to power off

## Disable Update Notifications

### Disable Auto Starting `upgNotifier`
1. Open `Application Menu > Preferences > LXQt settings > Session Settings`
1. Select the `Autostart` tab
1. Uncheck `upgNotifier`

### Minimize System Update Notifications
1. Open `Application Menu > Preferences > Software & Updates`
1. Select the `Updates` tab
1. Configure the following
    - `For other packages, subscribe to` : `Security updates only`
    - `Automatically check for updates` : `Never`
    - `When there are security updates` : `<empty>`
    - `When there are other updates` : `<empty>`
    - `Notify me of a new Ubuntu version` : `Never`

