#!/bin/zsh

#----------------
# Name          : ext.zsh
# Description   : Aliases for external drives
# Author        : E Fournier
# Dependencies  : zsh
#----------------

# Linux Aliases

## Dynamically define shortcuts by drive letter
export_by_drive_letter() {
  local letter="$1"

  local base="/mnt/ext${letter}"
  export ${letter}BASE="$base"

  export ${letter}ANN="$base/Annual"

  export ${letter}YEAR="$base/Annual/2020"

  local lg="$base/Lg"
  export ${letter}LG="$lg"

  export ${letter}ALG="$lg/Audio"

  local media="$base/Media"
  export ${letter}MED="$media"

  export ${letter}AU="$media/Audio"

  local video="$media/Video"
  export ${letter}VID="$video"

  export ${letter}TV="$video/TV"

  local projects="$base/Projects"
  export ${letter}PROJ="$projects"

  export ${letter}FAM="$projects/FamilyMedia"

  export ${letter}DIG="$projects/Digitization"

  export ${letter}LEC="$projects/LeCoursville"
}

main() {
  export_by_drive_letter A
  export_by_drive_letter B
  export_by_drive_letter C
}

main "$@"

