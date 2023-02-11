#!/bin/bash

expression=$1

if [[ -z $1 ]]; then
  echo "Must supply a RegEx as 1st argument"
  exit
fi

find . -regextype sed -regex ".*/${expression}" >> "./find-by-regex.log"

