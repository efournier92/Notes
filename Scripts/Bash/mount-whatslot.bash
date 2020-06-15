#!/bin/bash

SLOT_DIR="$1"

function isEmptyDir() {
  [ -z "$(ls -A ${SLOT_DIR})" ]
}

if isEmptyDir; then
  # Mount the slot of target directory is empty
  sshfs misigno@calypso.whatbox.ca:/home/misigno/ "$SLOT_DIR"
fi

# Change working directory to slot directory
cd "$SLOT_DIR"

