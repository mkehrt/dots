#!/bin/bash
#
#  Idea from SCM Breeze by Nathan Broadbent, but I wanted something lighter.
# https://github.com/ndbroadbent/scm_breeze

git_numbers_clear () {
  unset git_numbers
}

git_numbers_status () {
  git_numbers_clear
  local i=0

  OLDIFS="$IFS"
  IFS=$'\n'
  for line in `git status  | sed -e "s/^$/ /g"` ; do
    if [[ $line =~ ^$'\t'(modified:|added:|deleted:|updated:) ]] ; then
      i=$((i+1))
      git_numbers[$i]=$(echo $line | sed -e "s/.*:  *\\(.*\\)/\\1/")
      echo "$line" | sed -e "s/\\(.*:  *\\)\\(.*\\)/\\1[$i] \\2/"
    else
      echo $line
    fi
  done
  IFS="$OLDIFS"
}

git_numbers_command () {
  for word in "$@"; do
    if [[ $word =~ [0-9][0-9]* ]] ; then
      local newword=${git_numbers[$word]}
      args=${args}" "${newword}
    else
      args=${args}" "${word}
    fi
    echo $args
  done
  eval $args
}
