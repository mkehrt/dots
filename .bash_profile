#!/bin/bash
export PATH=~/bin:${PATH}

#git magic
source ~/.git-completion.bash
source ~/.git-prompt.sh

# Prompt
export PS1="\[\033[1;34m\](\$?) \d \T \w\n\u@\h\$(__git_ps1 \" (%s)\")\$\[\033[0m\] "

# Aliases
alias rm="rm -i"
alias ls="ls -Fa"
alias open="open -F -g"
alias reveal="open -R"
alias cd="pushd . > /dev/null; cd"

##
# Your previous /Users/mkehrt/.bash_profile file was backed up as /Users/mkehrt/.bash_profile.macports-saved_2012-10-23_at_16:43:32
##

# MacPorts Installer addition on 2012-10-23_at_16:43:32: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

