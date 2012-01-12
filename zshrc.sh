# vim: ft=sh:
#
# Using oh-my-zsh, while I get the hang on zsh (or not)
#
# references:
# http://zsh.sourceforge.net/Intro/intro_3.html

## oh-my-zsh bootstrap:
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="gozilla"

# sorin, josh, blinks, clean, lukerandall, Soliah, robbyrussell/gozilla
# theunraveler, example, superjarin, zhann

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
plugins=(git brew rvm)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# don't like the colors oh-my-zsh forces into 'ls'
unset LSCOLORS

# iTerm2 needs this to show utf-8 correctly
export LC_ALL="en_US.UTF-8"

# export PATH=
# /Users/lsdr/.rvm/gems/ruby-1.9.3-p0/bin:
# /Users/lsdr/.rvm/gems/ruby-1.9.3-p0@global/bin:
# /Users/lsdr/.rvm/rubies/ruby-1.9.3-p0/bin:
# /Users/lsdr/.rvm/bin:
# /usr/local/bin:
# /usr/local/sbin:
# /usr/local/share/python:
# /usr/bin:
# /bin:
# /usr/sbin:
# /sbin:
# /usr/local/bin:
# /usr/texbin:
# /usr/X11/bin:
# /Users/lsdr/Scripts:
# /Users/lsdr/.cabal/bin

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

# general settings
export EDITOR=vim
export VIM_APP_DIR=~/Code

# java-related settings
export JAVA_HOME=`/usr/libexec/java_home`
export ANT_HOME=/usr/share/ant
export ANT_OPTS="-Xms512m -Xmx512m"

# scala-related settings
if [ -d /usr/local/Cellar/scala/2.9.1/libexec ]; then
  export SCALA_HOME=/usr/local/Cellar/scala/2.9.1/libexec
fi

# node settings
if [ -d /usr/local/lib/node_modules ]; then
  export NODE_PATH=/usr/local/lib/node_modules
fi

# groovy setting
if [ -d /usr/local/Cellar/groovy/1.8.5/libexec ]; then
  export GROOVY_HOME=/usr/local/Cellar/groovy/1.8.5/libexec
fi



# bootstrap rvm if avaliable
if [ -s ~/.rvm/scripts/rvm ]; then source ~/.rvm/scripts/rvm; fi

# bootstrap nvm (node.js version manager) if avaliable
if [ -s ~/.nvm/nvm.sh ]; then source ~/.nvm/nvm.sh; fi