#!/bin/bash
export PATH=${HOME}/bin:/opt/local/bin:/opt/local/sbin:${HOME}/Library/Haskell/bin:${PATH}

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

alias tag="ctags -R --exclude=.git"

# comments are xterm colors
hexbgclr=1c1c1c # 234
hexfgclr=d0d0d0 # 252

hexbgblk=c8c8ff
hexfgblk=c8c8ff

hexbgred=d7005f # 161
hexfgred=d75f5f # 167

hexbggrn=008700 # 28
hexfggrn=00af00 # 34

hexbgylw=afaf00 # 214
hexfgylw=afd75f # 220

hexbgblu=005fd7 # 26
hexfgblu=0087d7 # 32

hexbgpur=8787ff # 105
hexfgpur=875fff # 99 

hexbgcyn=008787 # 30
hexfgcyn=00af87 # 36

hexbgwht=ffffff
hexfgwht=999999

# Use magic escape sequences to set set iterm colors.
# Mapping ansi colors to xterm colors I can use in vim.
if [ $TERM_PROGRAM == iTerm.app ] ;
then
  echo -e "\033]Pg${hexfgclr}\033\\" # FG
  echo -e "\033]Ph${hexbgclr}\033\\" # BG

  echo -e "\033]P0${hexfgblk}\033\\" # Black
  echo -e "\033]P1${hexfgred}\033\\" # Red
  echo -e "\033]P2${hexfggrn}\033\\" # Green
  echo -e "\033]P3${hexfgylw}\033\\" # Yellow
  echo -e "\033]P4${hexfgblu}\033\\" # Blue
  echo -e "\033]P5${hexfgpur}\033\\" # Magenta
  echo -e "\033]P6${hexfgcyn}\033\\" # Cyan
  echo -e "\033]P7${hexfgwht}\033\\" # White

  echo -e "\033]P8${hexbgblk}\033\\" # Black2
  echo -e "\033]P9${hexbgred}\033\\" # Red2
  echo -e "\033]Pa${hexbggrn}\033\\" # Green2
  echo -e "\033]Pb${hexbgylw}\033\\" # Yellow22
  echo -e "\033]Pc${hexbgblu}\033\\" # Blue2
  echo -e "\033]Pd${hexbgpur}\033\\" # Magenta2
  echo -e "\033]Pe${hexbgcyn}\033\\" # Cyan2
  echo -e "\033]Pf${hexbgwht}\033\\" # White2
  clear
fi

  #echo -e "\033]Pg47c8ff\033\\" # Blue


# Predictable SSH authentication socket location.
SOCK="/tmp/ssh-agent-$USER-screen"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
then
    rm -f /tmp/ssh-agent-$USER-screen
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
fi

# source local bash settings
if [ -a .bash_local.sh ]
then
  source .bash_local.sh
fi

# added by Anaconda 1.6.1 installer
export PATH="/Users/mkehrt/anaconda/bin:$PATH"
