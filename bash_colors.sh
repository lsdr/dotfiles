# Terminal Colors
#
# Attribute codes:
#   00 = None
#   01 = Bold/bright
#   04 = Underscore 
#   05 = Blink
#   07 = Reverse
#   08 = Concealed
#
# Text color codes:
#   30 = Black/Grey
#   31 = Red
#   32 = Green
#   33 = Yellow
#   34 = Blue
#   35 = Magenta
#   36 = Cyan
#   37 = White
#
# Background color codes:
#   40 = Black
#   41 = Red
#   42 = Green
#   43 = Yellow
#   44 = Blue
#   45 = Magenta
#   46 = Cyan
#   47 = White
#
# Example: \[\e[01;36m\]
#

export NO_CLR="\[\033[0m\]"

export RED="\[\033[0;31m\]"
export GREEN="\[\033[0;32m\]"
export YELLOW="\[\033[0;33m\]"
export BLUE="\[\033[0;34m\]"
export MAGENTA="\[\033[0;35m\]"
export CYAN="\[\033[0;36m\]"
export WHITE="\[\033[0;37m\]"

export B_GRAY="\[\033[1;30m\]"
export B_RED="\[\033[1;31m\]"
export B_GREEN="\[\033[1;32m\]"
export B_YELLOW="\[\033[1;33m\]"
export B_BLUE="\[\033[1;34m\]"
export B_MAGENTA="\[\033[1;35m\]"
export B_CYAN="\[\033[1;36m\]"
export B_WHITE="\[\033[1;37m\]"
