#!/bin/bash

sync_folder="/mnt/BNK/Sync"
process="grive"

function is_sync_dir_present {
  [[ -d "$sync_folder" ]]
}

function is_grive_process_running {
  if pgrep "$process" >/dev/null 2>&1; then
    true
  else
    false
  fi
}

if is_sync_dir_present && ! is_grive_process_running; then
  echo "Syncing $sync_folder"
  cd "$sync_folder"
  grive
fi

