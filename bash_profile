# vim: ft=sh:

if [ -e ~/.bashrc ]; then
  source ~/.bashrc
fi

if [ -e ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

# if which fortune > /dev/null; then
#   echo "________________________________________________________________________________"
#   echo
#   fortune -l
#   echo "________________________________________________________________________________"
#   echo
# fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### SSL CERT; brew install curl-ca-bundle
export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt

