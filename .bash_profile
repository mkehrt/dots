#!/bin/bash
source $HOME/.bash/path.bash

#git magic
source ~/.git-completion.bash
source ~/.git-prompt.sh

hostColor="1;34m"
if [ $TERM = "screen" ] ; then
  hostColor="1;33m"
elif [ -n "$SSH_CONNECTION" ] ; then
  hostColor="1;35m"
fi

# Prompt
export PS1="\[\033[1;34m\](\$?) \d \T \w\n\u@\[\033[$hostColor\]\h\[\033[1;34m\]\$(__git_ps1 \" (%s)\")\$\[\033[0m\] "

# naming things
function tabname { printf "\e]1;$1\a"; }
function winname { printf "\e]2;$1\a"; }

# Aliases
alias rm="rm -ir"
alias ls="ls -Fa"
alias open="open -F -g"
alias reveal="open -R"
alias cd="pushd . > /dev/null; cd"

alias shuf="awk 'BEGIN{srand()}{printf \"%06d %s\n\", rand()*1000000, $0;}' | sort -n | cut -c8-"

alias first="head -n 1"
alias second="head -n 2 | tail -n 1"
alias third="head -n 3 | tail -n 1"
nth() { head -n $1 | tail -n 1 ; }
alias last="tail -n 1"

alias gv="grep -v"
alias histg="history | grep -i"
alias search="find . -iname"

alias ts='date -j -f "%a %b %d %T %Z %Y" "`date`" "+%s"'

alias tag="ctags -R --exclude=.git"

alias weather="curl http://wttr.in/San_Fransisco"
alias moon="curl http://wttr.in/Moon"

# Use the prefix of what you have typed already to search backwards when
# pressing up/down to navigate history
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

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

# Source term color stuff.
source $HOME/.bash/colors.bash

# Source bash completions.
source $HOME/.bash/completion.bash

# Source local bash settings.
if [ -a $HOME/.bash_local.sh ]
then
  source $HOME/.bash_local.sh
fi

# gittery
#source $HOME/.bash/git_numbers.bash

# Autoadded stuff.
export PATH="/Users/mkehrt/anaconda/bin:$PATH"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
