# vim: ft=sh:

# PATH setup
PATH="$PATH:/usr/local/sbin"
PATH="$PATH:/Users/lsdr/Scripts"
PATH="$PATH:/opt/mongodb/current/bin"
PATH="$PATH:/Applications/ejabberd/2.1.4/bin"

MANPATH="$MANPATH:/usr/local/man"
export PATH MANPATH

export EDITOR=vim
export VIM_APP_DIR=~/Code
# export JAVA_HOME=/Library/Java/Home
export JAVA_HOME=`/usr/libexec/java_home`

# ant settings
export ANT_HOME=/usr/share/ant
export ANT_OPTS="-Xms512m -Xmx512m"

# set x86_64 flags
export CFLAGS="-arch x86_64 -O2"
export ARCHFLAGS="-arch x86_64"

export CLICOLOR=1
export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth
export GREP_OPTIONS="--color=auto"
export RUBYOPT=rubygems
#export SKIP_MEMCACHED=true
#export EVENT_NOKQUEUE=1

export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/lib/oracle/instantclient_10_2

# "private" helper functions
function _basedir {
  basename `pwd`
}

function _git_current_branch {
  git symbolic-ref HEAD 2>/dev/null | sed 's/refs\/heads\///' | awk '{print "(" $1 ") "}'
}

function _git_prompt {
  local git_dir="$(git rev-parse --git-dir 2>/dev/null)"
  if [ -n "$git_dir" ]; then _git_current_branch; fi
}

function _rvm_prompt {
  $rvm_path/bin/rvm-prompt i v g |
  sed 's/\-/ /' |
  sed 's/\@/ /' |
  awk '{ sub(/\-[a-zA-Z0-9.-]+/, "", $2); print $2, $3"|"$1 }'
  # local INTERPRETER=`$rvm_path/bin/rvm-prompt i`
  # local VERSION=`$rvm_path/bin/rvm-prompt v`
  # local GEMSET=`$rvm_path/bin/rvm-prompt g`
  # 
  # echo "${WHITE}${VERSION} ${GEMSET}|${INTERPRETER}${NO_CLR}"
}

alias c='clear'
alias s='script/server'
alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -la'
alias pse='ps -ef | grep -i'
alias awk='gawk'
alias lsof='lsof -i -Pn'
alias labs='cd ~/Code/labs'

alias pendrive='cd /Volumes/PENDRIVEL'

alias vim='/Applications/MacVim.app/Contents/MacOS/Vim '
alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim --remote-tab'
alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g --servername `_basedir`'

alias pyenv='virtualenv --python=/usr/local/bin/python --clear --no-site-packages'

shopt -s checkwinsize
unset MAILCHECK

BASH_COMPLETION='/usr/local/etc/bash_completion'
if [ -f $BASH_COMPLETION ]; then
  source $BASH_COMPLETION || echo 'bash completions unavaliable.'
fi

# bootstrap rvm if avaliable
if [ -s ~/.rvm/scripts/rvm ]; then source ~/.rvm/scripts/rvm; fi

# setting the bash PS1 prompt to my liking
# example: export PS1="\u@\h: \W \$ "
if [ -s ~/.bash_colors ]; then source ~/.bash_colors; fi
PS1='[$(_rvm_prompt)] \[\033[1;32m\]\u@\h\[\033[0m\] \[\033[1;34m\]\w\[\033[0m\] \[\033[1;36m\]$(_git_prompt "%s")\[\033[0m\]\n\[\033[1;34m\]\$\[\033[0m\] '

# references:
# http://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
# http://ss64.com/osx/
# http://gnu.org/software/bash/manual/bashref.html#Bash-Conditional-Expressions
