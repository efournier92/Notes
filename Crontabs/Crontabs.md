# Crontabs

## Overview
- The below sections capture details around my `crontab` configuration for various machines.

## Commands

### Edit `crontab`

```bash
crontab -e
```

## Machine Configurations

### lb  

```text
0  8 * * 1,5 /home/misigno/.scripts/rc_remote_audio_recieve '12:00:00' '/home/misigno/bnk/rc' 'Creation' 'USB PnP Audio Device'
0 21 * * * /home/misigno/.scripts/rc_process '/home/misigno/bnk/rc'
```

### lb  

```text
0 10 * * 1-7 /home/misigno/.scripts/rc_record '14:00:00' '/home/misigno/bnk/rc' 'plughw:CARD=microphone,DEV=0'
0  6 * * 1-5 /home/misigno/.scripts/rc_process '/home/misigno/bnk/rc' 'mono'
```

