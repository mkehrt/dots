#!/bin/bash

for file in $(ls ${HOME}/dots/bash); do
  source ${HOME}/dots/bash/$file
done

# Apple bullshit
export BASH_SILENCE_DEPRECATION_WARNING=1

export LINODE_NUMBERS="45.56.90.57"
export LINODE_GENERAL="45.79.150.74"

# Turn off flow control
stty -ixon

export EDITOR=vim
export PAGER=less

# Prompt

RED="\[\e[1;31m\]"
GREEN="\[e[1;32m\]"
YELLOW="\[\e[1;33m\]"
BLUE="\[\e[1;34m\]"
MAGENTA="\[\e[1;35m\]"
CYAN="\[\e[1;36m\]"
RESET_COLOR="\[\e[0m\]"

HOST_COLOR=$BLUE
if [[ $TERM =~ .*screen\$ ]] ; then
  HOST_COLOR=$YELLOW
elif [ -n "$SSH_CONNECTION" ] ; then
  HOST_COLOR=$MAGENTA
fi

# Prompt
function set_prompt() {
    EXIT_CODE=$?

    EXIT_CODE_COLOR=$BLUE
    if [[ $EXIT_CODE -ne 0 ]] ; then
      EXIT_CODE_COLOR=$RED
    fi
    export PS1="$BLUE($EXIT_CODE_COLOR$EXIT_CODE$BLUE) \d \T \w\n\u@$HOST_COLOR\h$BLUE\$(__git_ps1 \" (%s)\") \$$RESET_COLOR "
}

PROMPT_COMMAND=set_prompt
#export PS1="\$?"

# Aliases
alias rm="rm -ir"
alias ls="ls -Fa"
alias open="open -F -g"
alias reveal="open -R"
alias cd="pushd . > /dev/null; cd"

alias first="head -n 1"
alias second="head -n 2 | tail -n 1"
alias third="head -n 3 | tail -n 1"
nth() { head -n $1 | tail -n 1 ; }
alias last="tail -n 1"

alias gv="grep -v"
alias histg="history | grep -i"
alias search="find . -iname"

alias tag="ctags -R --exclude=.git"

alias weather="curl http://wttr.in/New_York"
alias moon="curl http://wttr.in/Moon"

# Use the prefix of what you have typed already to search backwards when
# pressing up/down to navigate history
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# History
HISTSIZE=500000
HISTFILESIZE=500000
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE=~/.bash_eternal_history
PROMPT_COMMAND="$PROMPT_COMMAND; history -a"

# Prevent accidentally overwriting files when piping output
# echo hello >out.txt will fail if out.txt already exists
set -o noclobber

# save multiline commands as one history item
shopt -s cmdhist

# Globs match dotfiles.
shopt -s dotglob

# Don't overwrite history.
shopt -s histappend

# Allow escape sequences in echo.
shopt -s xpg_echo

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Predictable SSH authentication socket location.
SOCK="/tmp/ssh-agent-$USER-screen"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
then
    rm -f /tmp/ssh-agent-$USER-screen
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
fi

# Source local bash settings.
if [ -a .bash_local.sh ]
then
  source .bash_local.sh
fi

# Path
# Path stuff at end because so many tools append to this file

export PATH="${HOME}/bin:/opt/local/bin:/opt/local/sbin:${PATH}"

# Added by install tools
export PATH="${HOME}/Library/Haskell/bin:${PATH}"
export PATH=":${HOME}/.local/bin:${PATH}"
export PATH="/Users/mkehrt/anaconda/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.elan/bin:$PATH"
