# Vnc 

## Overview

The below document outlines commands for configuring and connecting a VNC client. Specifically, these pertain to connection over WAN via SSH.

## Commands

### Server

#### Install OpenSSH

```bash
sudo apt install openssh-server openssh-client
```

#### Install TigerVnc

```bash
sudo apt install tigervnc-standalone-server tigervnc-xorg-extension tigervnc-viewer tigervnc-scraping-server
```

#### Install Ngrok

```bash
snap install ngrok
```

#### Add Ngrok Auth Token

```bash
ngrok authtoken $AUTH_TOKEN
```

#### Start Vnc Server

```bash
x0vncserver -display :0 -SecurityTypes=none
```

#### Start Ngrok

```bash
ngrok tcp 22
```

### Client

#### Install OpenSsh Client

```bash
sudo apt install openssh-client
```

#### Install TigerVNC Viewer

```bash
sudo apt install tigervnc-viewer
```

#### Connect Tunnel

```bash
ssh -p 16799 -L 5900:localhost:5900 mhub@2.tcp.ngrok.io
```

#### Connect VNC

```bash
vncviewer localhost:0
```

