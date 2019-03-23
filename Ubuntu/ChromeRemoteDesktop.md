# Chrome Remote Desktop Server Ubuntu Configuration

## Download the package
```bash
sudo dpkg -i ~/Downloads/chrome-remote-desktop_current_amd64.deb
```

## Install the package
```bash
sudo apt-get install -f
```

## Stop the server
```bash
/opt/google/chrome-remote-desktop/chrome-remote-desktop --stop
```

## Backup the config file
```bash
sudo cp /opt/google/chrome-remote-desktop/chrome-remote-desktop /opt/google/chrome-remote-desktop/chrome-remote-desktop.orig
```

## Open the config file for edit
```bash
sudo vim /opt/google/chrome-remote-desktop/chrome-remote-desktop
```

## Configure resolution for default display
```bash
DEFAULT_SIZES = "1920x1080"
```

## Configure default display number
```bash
FIRST_X_DISPLAY_NUMBER = 0
```

## Comment the following
```bash
# while os.path.exists(X_LOCK_FILE_TEMPLATE % display):
#   display += 1
```

## Configure `launch_session` as follows
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

## Start the server
```bash
/opt/google/chrome-remote-desktop/chrome-remote-desktop --stop
```

