#!/bin/bash

# Fooling around with term colors.

# comments are xterm colors
# Chroma 0.125, lightness 0.85
HEX_BG=101010 # 234
HEX_FG=aeaeae # 252

HEX_BG_BLACK=000000
HEX_FG_BLACK=000000

HEX_BG_WHITE=ffffff
HEX_FG_WHITE=ffffff

HEX_BG_RED=ee8bab # 161, hue 0
HEX_FG_RED=ee8bab # 167

# Unused.
HEX_BG_ORANGE=e79a57 # Hue 60
HEX_FG_ORANGE=e79a57 

HEX_BG_YELLOW=cdaa45 # 214, hue 90
HEX_FG_YELLOW=cdaa45 # 220

HEX_BG_GREEN=82c174 # 28, hue 140, but maybe try 150
HEX_FG_GREEN=82c174 # 34

HEX_BG_CYAN=1fc7bf # 30, hue 190
HEX_FG_CYAN=1fc7bf # 36

HEX_BG_BLUE=47bcee # 26, hue 230
HEX_FG_BLUE=47bcee # 32

HEX_BG_PURPLE=ba9bf1 # 105, hue 300
HEX_FG_PURPLE=ba9bf1 # 99 

# Unused; uses purple instead.
HEX_BG_MAGENTA=da90d4 # 105, hue 330
HEX_FG_MAGENTA=da90d4 # 99 

# Use magic escape sequences to set set iterm colors.
# Mapping ansi colors to xterm colors I can use in vim.
if [ "${TERM_PROGRAM}" == "iTerm.app" ] ;
then
  echo -e "\033]Pg${HEX_FG}\033\\" # FG
  echo -e "\033]Ph${HEX_BG}\033\\" # BG

  echo -e "\033]P0${HEX_FG_BLACK}\033\\" # Black
  echo -e "\033]P1${HEX_FG_RED}\033\\" # Red
  echo -e "\033]P2${HEX_FG_GREEN}\033\\" # Green
  echo -e "\033]P3${HEX_FG_YELLOW}\033\\" # Yellow
  echo -e "\033]P4${HEX_FG_BLUE}\033\\" # Blue
  echo -e "\033]P5${HEX_FG_PURPLE}\033\\" # Magenta
  echo -e "\033]P6${HEX_FG_CYAN}\033\\" # Cyan
  echo -e "\033]P7${HEX_FG_WHITE}\033\\" # White

  echo -e "\033]P8${HEX_BG_BLACK}\033\\" # Black2
  echo -e "\033]P9${HEX_BG_RED}\033\\" # Red2
  echo -e "\033]Pa${HEX_BG_GREEN}\033\\" # Green2
  echo -e "\033]Pb${HEX_BG_YELLOW}\033\\" # Yellow22
  echo -e "\033]Pc${HEX_BG_BLUE}\033\\" # Blue2
  echo -e "\033]Pd${HEX_BG_PURPLE}\033\\" # Magenta2
  echo -e "\033]Pe${HEX_BG_CYAN}\033\\" # Cyan2
  echo -e "\033]Pf${HEX_BG_WHITE}\033\\" # White2
  clear
fi



