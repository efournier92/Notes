#!/bin/zsh

#----------------
# Name          : sb.zsh
# Description   : Aliases for tmux sessions
# Author        : E Fournier
# Dependencies  : zsh
#----------------

## Configuration
server_name="Calypso"
server_domain="whatbox.ca"

## SSH

### Connect to SSH Session
alias sbssh="ssh misigno@${server_name}.${server_domain}"

## VPN

### Connect to VPN
alias sbvpn="sudo openvpn --daemon --config /etc/openvpn/keys/${server_name}.ovpn"

### Disconnect from VPN
alias sbvpn!="sudo killall openvpn"

## Local Filesystem

### Mount slot to local filesystem
alias sbfs=". $HSCRIPTS/mount_sbfs $SB"

### Unmount slot from local filesystem
alias sbfs!="fusermount -u $SB"

