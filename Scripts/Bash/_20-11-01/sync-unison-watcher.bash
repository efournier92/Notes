#!/bin/bash

IP="$1"
USER="$2"
LOCAL_BASE="$3"
DIR="$4"
BASH_FILE="$5"
WATCH_DIR="$LOCAL_BASE/$DIR"

if [[ -z "$IP" || -z "$USER" || -z "$LOCAL_BASE" || -z "$DIR" || -z "$BASH_FILE" ]]; then
  echo 'USAGE: $ unison.bash ${IP} ${USER} ${LOCAL_BASE} ${DIR} ${BASH_FILE}'
  exit
fi


echo "COMMAND: inotifywait -mr -e modify,close,open,move,create,delete ${WATCH_DIR} && ${BASH_FILE} ${IP} ${USER} ${LOCAL_BASE} ${DIR}" >> /home/misigno/unison.log

inotifywait -mr -e open,move,delete "$WATCH_DIR" && \
  /home/misigno/scripts/unison.bash "$IP" "$USER" "$LOCAL_BASE" "$DIR"

