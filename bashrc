# vim: ft=sh:

# iTerm2 needs this to show utf-8 correctly
export LC_ALL="en_US.UTF-8"

# PATH setup bonanza
PATH="$PATH:/Users/lsdr/Scripts"

if [ -d /Users/lsdr/.cabal/bin ]; then
  PATH="$PATH:/Users/lsdr/.cabal/bin"
fi

if [ -d /usr/local/share/python ]; then
  PATH="/usr/local/share/python:$PATH"
fi

PATH="/usr/local/bin:/usr/local/sbin:$PATH"
MANPATH="$MANPATH:/usr/local/man"
export PATH MANPATH

# editor settings
export EDITOR=vim
export VIM_APP_DIR=~/Code
alias gvim='vim -g --servername `_basedir`'

# java-related settings
export JAVA_HOME=`/usr/libexec/java_home`
export ANT_HOME=/usr/share/ant
export ANT_OPTS="-Xms512m -Xmx512m"

# scala-related settings
if [ -d /usr/local/Cellar/scala/2.9.1-1/libexec ]; then
  export SCALA_HOME=/usr/local/Cellar/scala/2.9.1-1/libexec
fi

# node settings
if [ -d /usr/local/lib/node_modules ]; then
  export NODE_PATH=/usr/local/lib/node_modules
fi

# groovy setting
if [ -d /usr/local/Cellar/groovy/1.8.5/libexec ]; then
  export GROOVY_HOME=/usr/local/Cellar/groovy/1.8.5/libexec
fi

# set x86_64 flags
export CFLAGS="-arch x86_64 -O2"
export ARCHFLAGS="-arch x86_64"

export CLICOLOR=1
export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth
export RUBYOPT=rubygems
#export SKIP_MEMCACHED=true
#export EVENT_NOKQUEUE=1

# pip now requires a virtualenv to run
export PIP_REQUIRE_VIRTUALENV=true
# pip respects the current virtualenv in use
export PIP_RESPECT_VIRTUALENV=true
# virtualenv uses distribute by default
export VIRTUALENV_DISTRIBUTE=true

# amazon web services
export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem)"
export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-*.pem)"
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.6.1.2/jars"
export EC2_URL='https://ec2.sa-east-1.amazonaws.com'

# git prompt pimpin'
if [ -e /usr/local/etc/git-prompt.sh ]; then
  source /usr/local/etc/git-prompt.sh
fi
export GIT_PS1_SHOWDIRTYSTATE=true

# oracle instant client support
if [ -d /usr/local/lib/oracle/instantclient_10_2 ]; then
  export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/lib/oracle/instantclient_10_2
fi

# "private" helper functions
function _basedir {
  basename `pwd`
}

function _rvm_prompt {
  $rvm_path/bin/rvm-prompt v
}

# bash options
shopt -s checkwinsize
shopt -s cdspell
shopt -s globstar
shopt -s autocd

shopt -u mailwarn
unset MAILCHECK

# setup bash completion
if [ -s /usr/local/etc/bash_completion ]; then
  source /usr/local/etc/bash_completion || echo 'bash completions unavaliable.'
fi

# bootstrap rvm if avaliable
if [ -s ~/.rvm/scripts/rvm ]; then source ~/.rvm/scripts/rvm; fi

# bootstrap core virtualenv if avaliable
if [ -s ~/.pvm/core ]; then source ~/.pvm/core/bin/activate; fi

# bootstrap nvm (node.js version manager) if avaliable
# if [ -s ~/.nvm/nvm.sh ]; then source ~/.nvm/nvm.sh; fi

# setting the bash PS1 prompt to my liking
# example: export PS1="\u@\h: \W \$ "
# if [ -s ~/.bash_colors ]; then source ~/.bash_colors; fi
PS1='[$(_rvm_prompt)] \[\033[1;32m\]\u@\h\[\033[0m\] \[\033[1;34m\]\w\[\033[0m\]\[\033[1;36m\]$(__git_ps1)\[\033[0m\]\n\[\033[1;34m\]\$\[\033[0m\] '

# references:
# http://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
# http://ss64.com/osx/
# http://gnu.org/software/bash/manual/bashref.html#Bash-Conditional-Expressions
