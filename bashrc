# vim: ft=sh:
#
# references:
# http://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
# http://ss64.com/osx/
# http://gnu.org/software/bash/manual/bashref.html#Bash-Conditional-Expressions
#

# iTerm2 needs this to show utf-8 correctly
export LC_ALL="en_US.UTF-8"

# PATH setup bonanza
PATH="/usr/local/bin:/usr/local/sbin:$PATH:/Users/lsdr/Scripts"
MANPATH="$MANPATH:/usr/local/man"
export PATH MANPATH

# editor settings
export EDITOR=vim
export VIM_APP_DIR=~/Code
alias gvim='vim -g --servername `__basedir`'

# docker environment
# export DOCKER_HOST=tcp://localhost:4243

# java-related settings
export JAVA_HOME="$(/usr/libexec/java_home)"

# node settings
if [ -d /usr/local/lib/node_modules ]; then
  export NODE_PATH=/usr/local/lib/node_modules
fi

# rust-related settings
if [ -d /Users/lsdr/.cargo ]; then
  export PATH=$PATH:$HOME/.cargo/bin
  export RUST_SRC_PATH=$HOME/.cargo/rust-src/src
fi

# haskell-related settings
if [ -d /Users/lsdr/.cabal ]; then
  export PATH=$PATH:$HOME/.cabal/bin
fi

# set x86_64 flags for my macs
if [[ $OSTYPE == darwin* ]]; then
  export CFLAGS="-arch x86_64 -O2"
  export ARCHFLAGS="-arch x86_64"
#  export CC="/usr/bin/gcc-4.2"
fi

export CLICOLOR=1
export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth

# amazon web services
if [ -e /usr/local/bin/aws ]; then
  # aws-cli autocomplete
  complete -C aws_completer aws
fi

# git prompt pimpin'
if [ -e /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
  source /usr/local/etc/bash_completion.d/git-prompt.sh
  export GIT_PS1_SHOWDIRTYSTATE=true
fi

# bash options
shopt -s checkwinsize
shopt -s cdspell
shopt -s globstar
shopt -s nocaseglob
shopt -s extglob
shopt -s autocd

shopt -u mailwarn
unset MAILCHECK

# setup bash completion
if [ -s /usr/local/etc/bash_completion ]; then
  source /usr/local/etc/bash_completion || echo 'bash completions unavaliable.'
fi

# bootstrap python environment if avaliable
if [ -s ~/.pvm/current ]; then
  # export PYTHON_VERSION=$(cat ~/.pvm/core/VERSION)

  # pip now requires a virtualenv to run
  export PIP_REQUIRE_VIRTUALENV=true
  export PIP_RESPECT_VIRTUALENV=true
  export VIRTUALENV_DISTRIBUTE=true

  # pipup script needs requires columns
  export PIP_FORMAT=columns

  # activate core virtualenv
  source ~/.pvm/current/bin/activate
  # add homebrewed libs to PYTHONPATH
  # export PYTHONPATH="/usr/local/lib/python$PYTHON_VERSION/site-packages"

  # enable pip autocompletion
  eval "`pip completion --bash`"
fi

# bootstrap rbenv if avaliable
if [ -s ~/.rbenv/shims ]; then eval "$(rbenv init -)"; fi

# "private" helper functions
function __basedir {
  basename `pwd`
}

function __rbenv_ps1 {
  rbenv version | awk '{print $1}' | sed -e 's/\-.*$//'
}

function __setup_prompt {
  history -a
  history -c
  history -r

  local NO_COLOR="\[\e[0m\]"
  local RED="\[\033[0;31m\]"
  local LIGHT_RED="\[\033[1;31m\]"
  local GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local ORANGE="\[\033[0;33m\]"
  local YELLOW="\[\033[1;33m\]"
  local BLUE="\[\033[0;34m\]"
  local LIGHT_BLUE="\[\033[1;34m\]"
  local PURPLE="\[\033[1;35m\]"
  local MAGENTA="\[\033[1;35m\]"
  local CYAN="\[\033[1;36m\]"
  local LIGHT_CYAN="\[\033[1;36m\]"
  local GRAY="\[\033[1;30m\]"
  local LIGHT_GRAY="\[\033[0;37m\]"
  local WHITE="\[\033[1;37m\]"

  local RUBY_PROMPT="${NO_COLOR}${CYAN}[$(__rbenv_ps1)]${NO_COLOR} "
  local PATH_PROMPT="${NO_COLOR}${PWD/#$HOME/~}${NO_COLOR}"
  local GIT_PROMPT="${NO_COLOR}${MAGENTA}$(__git_ps1)${NO_COLOR}"

  # setting the bash PS1 prompt to my liking
  # example: export PS1="\u@\h: \W \$ "
  # PS1='[$(__rbenv_ps1)] \[\033[1;32m\]\u@\h\[\033[0m\] \[\033[1;34m\]\w\[\033[0m\]\[\033[1;36m\]$(__git_ps1)\[\033[0m\]\n\[\033[1;34m\]\$\[\033[0m\] '
  PS1="\n${RUBY_PROMPT}${PATH_PROMPT}${GIT_PROMPT}\n\$ "
}

PROMPT_COMMAND=__setup_prompt

### setting the fuck up
eval "$(thefuck --alias)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

