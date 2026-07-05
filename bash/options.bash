#!/bin/bash

# History
HISTSIZE=500000
HISTFILESIZE=500000
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE=~/.bash_eternal_history
PROMPT_COMMAND="${PROMPT_COMMAND}; history -a"

# Save multiline commands as one history item
shopt -s cmdhist

# Don't overwrite history.
shopt -s histappend

# Turn off flow control
stty -ixon

# Use the prefix of what you have typed already to search backwards when
# pressing up/down to navigate history
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Prevent accidentally overwriting files when piping output
# echo hello >out.txt will fail if out.txt already exists
set -o noclobber

# Globs match dotfiles.
shopt -s dotglob

# Allow escape sequences in echo.
shopt -s xpg_echo

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
