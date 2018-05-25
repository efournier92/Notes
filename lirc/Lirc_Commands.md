# `lirc` Configuration

## Commands

### Modify Results in X11
```bash
sudo vim /etc/X11/xorg.conf.d/00-ir.conf 
```

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

### Install `ir-keytable` Tool
```bash
sudo apt-get install ir-keytable
```

### Run `ir-keytable`
```bash
sudo ir-keytable -d /dev/input/event4
```

### Check Remote Configuration with `irw`
```bash
irw
```

### Important Directories
* `/usr/share/lirc/`
* `/etc/lirc/`
* `/etc/lirc/lircd.conf.d/`
* `/var/run/lirc/`
* `/dev/input/`

