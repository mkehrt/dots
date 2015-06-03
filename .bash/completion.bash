#! /bin/bash

alias comp="complete -o bashdefault"

# ssh from know_hosts.  Idea from Blackmad.
#comp -C 'cat ~/.ssh/known_hosts | sed -e "s/\([^,]*\).*/\\1/" | grep -v ==' ssh scp rsync

_completeHdfs () {
  local cur
  local path
  local matches
  COMPREPLY=()   # Array variable storing the possible completions.

  cur=${COMP_WORDS[COMP_CWORD]}
  path=`dirname $cur  2> /dev/null`

  matches=`hadoop fs -ls $path | awk '{ print $8 }'`

  for x in $matches ; do
    grep -F "$cur" <( echo $x ) > /dev/null
    if [ $? -eq 0 ] ; then
      COMPREPLY=("${COMPREPLY[@]}" "$x")
    fi
  done
}

complete -o filenames -F _completeHdfs hls hrm hmv hcat hadoop 
