# Find Network Devices

## Overview

## Steps

### 1. Find Your IP Address

- `$ ip a`

### 2. Locate Your Network

- `wlp*`for WiFi
- `tun*`for VPN

### 3. Get the Private IP Address

- Locate `inet` IP below your network
- Example: `10.8.0.14`

### 4. Get the Router IP Address

- Replace the last octet from private IP with 0
- Example: `10.8.0.0`

### 5. Detect Other On-Network Devices

- `$ nmap -sP 10.8.0.0/24`

### 6. Test IPs from `nmap` Output

- `$ ssh user@10.8.0.14`

