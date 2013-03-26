# useful day-to-day aliases
alias c='clear'
alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -la'
alias pse='ps -ef | grep -i'
alias lsof='lsof -i -Pn'

# use GNU Awk in MacOS/BSD too
alias awk='gawk'

# python virtualenv shortcuts
alias pyenv='virtualenv --python=/usr/local/bin/python --clear --no-site-packages --distribute'
alias pyenv3='virtualenv --python=/usr/local/bin/python3 --clear --no-site-packages --distribute'

# emacs alias
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'

# bundler exec shortcut
alias bexec='bundle exec'

# networking tools
alias netlisten='ngrep -q -W byline "^(GET|POST) .*"'
