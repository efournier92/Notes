#!/bin/zsh

#----------------
# Name          : ext.zsh
# Description   : Aliases for external drives
# Author        : E Fournier
# Dependencies  : zsh
#----------------

# Linux Aliases

## Dynamically define shortcuts by drive letter
export_ext_by_drive_letter() {
  local letter="$1"
  local base="$2"

  local this_year=`date +"%Y"`
  
  ### External base directory
  export ${letter}BASE="$base"

  ### Annual base directory
  export ${letter}ANN="$base/Annual"

  ### Annual directory for the current year
  export ${letter}YR="$base/Annual/$this_year"

  ### Lg base directory
  local lg="$base/Lg"
  export ${letter}LG="$lg"

  ### Lg audio directory
  export ${letter}ALG="$lg/Audio"

  ### Projects base directory
  local projects="$base/Projects"
  export ${letter}PROJ="$projects"

  ### Family projects directory
  export ${letter}FAM="$projects/FamilyMedia"

  ### Digitization projects directory
  export ${letter}DIG="$projects/Digitization"

  ### LeCoursville directory
  export ${letter}LEC="$projects/LeCoursville"
}

## Media
export_media_by_drive_letter() {
  local letter="$1"
  local base="$2"

  ### Media base directory
  local media="$base/Media"
  export ${letter}MED="$media"
  
  ### Audio directory
  export ${letter}AU="$media/Audio"

  ### Video directory
  local video="$media/Video"
  export ${letter}VID="$video"

  ### Movies directory
  export ${letter}MOV="$video/Movies"

  ### TV directory
  export ${letter}TV="$video/TV"
}

## RC

### Rc record directory
export RCRC="$RC/RECORD"

main() {
  export_ext_by_drive_letter "A" "$EXTA"
  export_ext_by_drive_letter "B" "$EXTB"
  export_ext_by_drive_letter "C" "$EXTC"

  export_media_by_drive_letter "A" "$EXTA"
  export_media_by_drive_letter "B" "$EXTB"
  export_media_by_drive_letter "C" "$EXTC"
  export_media_by_drive_letter "M" "$MD"
}

main "$@"

