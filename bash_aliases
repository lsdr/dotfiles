# useful day-to-day aliases
alias c='clear'
alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -la'
alias pse='ps -ef | grep -i'
alias lsof='lsof -i -Pn'
alias lsize='ls | xargs du -sh'

# use GNU Awk/Sed in MacOS/BSD too
alias awk='gawk'
alias sed='gsed'

# python virtualenv shortcuts
alias pyenv='virtualenv --python=/usr/bin/python --clear --no-site-packages --distribute'
alias pyenv3='virtualenv --python=/usr/bin/python3 --clear --no-site-packages --distribute'

# emacs alias
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'

# development and coding aliases
alias ipy='ipython --no-banner'
alias bexec='bundle exec'
alias octave='octave -qf'
alias lisp='rlwrap sbcl'

# networking tools
alias netlisten='ngrep -q -W byline "^(GET|POST) .*"'

