#!/bin/bash

alias rm="rm -ir"
alias ls="ls -Fa"
alias open="open -F -g"
alias reveal="open -R"
alias cd="pushd . > /dev/null; cd"

alias first="head -n 1"
alias second="head -n 2 | tail -n 1"
alias third="head -n 3 | tail -n 1"
nth() { head -n "$1" | tail -n 1 ; }
alias last="tail -n 1"

alias gv="grep -v"
alias histg="history | grep -i"
alias search="find . -iname"

alias tag="ctags -R --exclude=.git"

alias weather="curl http://wttr.in/New_York"
alias moon="curl http://wttr.in/Moon"
