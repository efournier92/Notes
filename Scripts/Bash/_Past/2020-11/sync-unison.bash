#!/bin/bash

ADDRESS="$1"
USER="$2"
LOCAL_DIR="$3"
REMOTE_DIR="$4"
REMOTE_BIN_DIR="$5"

if [[ -z "$ADDRESS" || -z "$USER" || -z "$LOCAL_DIR" || -z "$REMOTE_DIR" ]]; then
  echo "USAGE: $ unison.bash ${ADDRESS} ${USER} ${LOCAL_DIR} ${REMOTE_DIR} ${REMOTE_BIN_DIR}"
  exit
fi

unison -batch -force newer -perms 0 -servercmd "${REMOTE_BIN_DIR}/unison" "${LOCAL_BASE}/${LOCAL_DIR}" "ssh://${USER}@${ADDRESS}/${REMOTE_DIR}"

