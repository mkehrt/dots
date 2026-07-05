#!/bin/bash

# Apple bullshit
export BASH_SILENCE_DEPRECATION_WARNING=1

export LINODE_NUMBERS="45.56.90.57"
export LINODE_GENERAL="45.79.150.74"

export EDITOR=vim
export PAGER=less

source "${HOME}/dots/bash/xterm_colors.bash"
source "${HOME}/dots/bash/prompt.bash"

source "${HOME}/dots/bash/completion.bash"
source "${HOME}/dots/bash/aliases.bash"
source "${HOME}/dots/bash/options.bash"
source "${HOME}/dots/bash/path.bash"

source "${HOME}/dots/bash/git_numbers.bash"
source "${HOME}/dots/bash/git_completion.bash"
source "${HOME}/dots/bash/git_prompt.sh"

# Source local bash settings.
if [ -a "${HOME}/.bash_local.sh" ]
then
  source "${HOME}/.bash_local.sh"
fi

# Predictable SSH authentication socket location.
SOCK="/tmp/ssh-agent-${USER}-screen"
if test "${SSH_AUTH_SOCK}" && [ "${SSH_AUTH_SOCK}" != "${SOCK}" ]
then
    rm -f "/tmp/ssh-agent-${USER}-screen"
    ln -sf "${SSH_AUTH_SOCK}" "${SOCK}"
    export SSH_AUTH_SOCK="${SOCK}"
fi
