# useful day-to-day aliases
alias c='clear'
alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -la'
# alias lt='ls --human-readable --size -1 -S --classify'
alias lt='du -sh * | sort -h'
alias pse='ps -ef | grep -i'
alias lsof='lsof -i -Pn'
alias lsize='ls | xargs -I {} du -sh "{}"'

alias ghist='history|grep'

# use GNU Awk/Sed in MacOS/BSD too
alias awk='gawk'
alias sed='gsed'

# emacs alias
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'

# development and coding aliases
alias ipy='ipython --no-banner'
alias bexec='bundle exec'
alias octave='octave -qf'
alias lisp='rlwrap sbcl'
alias ghci='stack ghci'

# aws docker login
alias docker_login='aws ecr get-login --no-include-email'

# networking tools
alias netlisten='ngrep -q -W byline "^(GET|POST) .*"'
