#!/bin/bash

RED="\[\e[1;31m\]"
GREEN="\[\e[1;32m\]"
YELLOW="\[\e[1;33m\]"
BLUE="\[\e[1;34m\]"
MAGENTA="\[\e[1;35m\]"
CYAN="\[\e[1;36m\]"
RESET_COLOR="\[\e[0m\]"

HOST_COLOR="${BLUE}"
if [[ "${TERM}" =~ .*screen.* ]] ; then
  HOST_COLOR="${YELLOW}"
elif [ -n "${SSH_CONNECTION}" ] ; then
  HOST_COLOR="${MAGENTA}"
fi

# Prompt
function set_prompt() {
    EXIT_CODE="$?"

    EXIT_CODE_COLOR="${BLUE}"
    if [[ "${EXIT_CODE}" -ne 0 ]] ; then
      EXIT_CODE_COLOR="${RED}"
    fi
    export PS1="${BLUE}(${EXIT_CODE_COLOR}${EXIT_CODE}${BLUE}) \d \T \w\n\u@${HOST_COLOR}\h${BLUE}\$(__git_ps1 \" (%s)\") \$${RESET_COLOR} "
    export PS1="$RED red $RESET_COLOR$GREEN green $RESET_COLOR$YELLOW yellow $RESET_COLOR$BLUE blue $RESET_COLOR$MAGENTA magenta $RESET_COLOR$CYAN cyan $RESET_COLOR$WHITE white $RESET_COLOR"
}

PROMPT_COMMAND=set_prompt
