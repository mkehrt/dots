#! /bin/bash

alias comp="complete -o bashdefault"

# ssh from know_hosts.  Idea from Blackmad.
comp -W "$(cat ~/.ssh/known_hosts | sed -e "s/\([^,]*\).*/\\1/" | grep -v ==)" ssh scp rsync
