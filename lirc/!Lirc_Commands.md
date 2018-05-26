# `lirc` Configuration

## Commands

### Install `lirc`
```bash
sudo apt-get install lirc
```

### Run `lirc`
```bash
sudo lircd -n --driver=devinput --device=/dev/input/event4 ~/HARMONY_350.lircd.conf
```

### Stop `lirc`
```bash
/etc/init.d/lircd stop
```

### Kill `lirc`
```bash
sudo kill $(pidof lircd)
```

### Reload `lirc` Configuration
```bash
/etc/init.d/lircd reload
```

### Record Button Presses to New File
```bash
sudo irrecord -n -d /dev/input/event4 -H devinput
```

### Record Button Presses to Existing File
```bash
sudo irrecord -n -d /dev/input/event4 -H devinput -u
```

### Check IR Input With `mode2`
```bash
sudo mode2 -d /dev/input/event4
```

### Check Remote Configuration With `irw`
```bash
irw
```

### Modify Remotes in X11
```bash
sudo vim /etc/X11/xorg.conf.d/00-ir.conf 
```

### Install `ir-keytable` Tool
```bash
sudo apt-get install ir-keytable
```

### Run `ir-keytable`
```bash
sudo ir-keytable -d /dev/input/event4
```

## Files
* `/etc/lirc/lircd.conf.d/HARMONY_350.lircd.conf`
* `~/.kodi/userdata/Lircmap.xml`
* `/etc/X11/xorg.conf.d/00-ir.conf`

## Directories
* `/usr/share/lirc/`
* `/etc/lirc/`
* `/etc/lirc/lircd.conf.d/`
* `/var/run/lirc/`
* `/dev/input/`
* `~/.kodi/userdata/`

## LINKS
[Lirc Configuration Guide](http://www.lirc.org/html/configuration-guide.html)
[Ubuntu HTPC on a Mac mini (late 2012)](https://davidlfvr.wordpress.com/2016/11/12/mac-mini-ubuntu-htpc/)
[Ubuntu + MacMini + Harmony 650 + OpenPHT + Plex Media Server](https://trustdarkness.com/blog/2016/07/17/ubuntu-macmini-harmony-650-openpht-plex-media-server/)
[Kodi - How to set up lirc](https://kodi.wiki/view/HOW-TO:Set_up_LIRC#Download_and_install_Lirc)
[`ir-keytable` Thread Reference](https://askubuntu.com/questions/908810/ir-remote-ubuntu-17-04)

