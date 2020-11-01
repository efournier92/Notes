#!/bin/bash

sync_dir="$1"
rclonesync="/home/misigno/scripts/rclonesync.py"
process_name="rsinc"

# Ensure proper sync_dir
if [[ $sync_dir == "" || ! -d "$sync_dir" ]]; then
  echo "Must supply valid directory as 1st parameter"
  exit
fi

# Ensure another process is not already running
if pgrep "$process_name" >/dev/null 2>&1; then
  echo "$process_name is already running"
fi

# Execute rsinc process
rsinc --default --auto --recover --dry

