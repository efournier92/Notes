# EOL Ubuntu Release | Force Upgrade

## Links

### Ask-Ubuntu Thread

https://askubuntu.com/questions/1361262/how-upgrade-ubuntu-20-10-after-its-eol

## Steps

### Remove the APT Cache

```bash
sudo rm -rf /var/lib/apt/lists/*
sudo apt update
sudo apt upgrade
```

### Upgrade to Intermediate Release Version

```bash
wget http://archive.ubuntu.com/ubuntu/dists/hirsute-updates/main/dist-upgrader-all/current/hirsute.tar.gz
mkdir upgrader
tar -xaf hirsute.tar.gz -C upgrader
cd upgrader
sudo ./hirsute
```

### Update to Latest Release Version

```bash
sudo apt update && sudo apt upgrade
sudo do-release-upgrade
```

