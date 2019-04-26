# Disable Wake on Lid in Ubuntu 18.04

## List Wakeup Devices
```bash
cat /proc/acpi/wakeup
```

## Reload System Daemons
```bash
sudo systemctl daemon-reload 
```

## Create or Edit `disable-lid-wakeup` Service
```bash
sudo vim /etc/systemd/system/disable-lid-wakeup.service 
```

## Add Content to `disable-lid-wakeup` Service
```service
[Unit]
Description=disable-lid-wakeup

[Service]
ExecStart=/bin/bash -c "echo LID0 >> /proc/acpi/wakeup"

[Install]
WantedBy=multi-user.target
```

## Check Status of `disable-lid-wakeup` Service
```bash
systemctl status disable-lid-wakeup.service
```

## Boot with `disable-lid-wakeup` Service
```bash
sudo systemctl enable disable-lid-wakeup.service
```

