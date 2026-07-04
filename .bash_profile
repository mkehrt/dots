#!/bin/bash

for file in $(ls ${HOME}/dots/bash); do
  source ${HOME}/dots/bash/$file
done

# Apple bullshit
export BASH_SILENCE_DEPRECATION_WARNING=1

export LINODE_NUMBERS="45.56.90.57"
export LINODE_GENERAL="45.79.150.74"

# Prompt
hostColor="1;34m"
if [ $TERM = "screen" ] ; then
  hostColor="1;33m"
elif [ -n "$SSH_CONNECTION" ] ; then
  hostColor="1;35m"
fi
export PS1="\[\033[1;34m\](\$?) \d \T \w\n\u@\[\033[$hostColor\]\h\[\033[1;34m\]\$(__git_ps1 \" (%s)\")\$\[\033[0m\] "

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
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

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
