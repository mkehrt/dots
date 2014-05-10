#!/bin/bash
#
# Based heavily on SCM Breeze by Nathan Broadbent, but I wanted something lighter.
# https://github.com/ndbroadbent/scm_breeze

git_numbers_clear () {
  unset git_numbers
}

git_numbers_create () {
  git_numbers_clear
  local i=0
  OLDIFS=$IFS
  IFS=""
  for line in `git status`; do
    if [[ $line =~  "\t.*"]]
    echo $line
  done
  IFS=$OLDIFS
}
