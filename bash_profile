# vim: ft=sh:

if [ -e ~/.bashrc ]; then
  source ~/.bashrc
fi

if [ -e ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

if which fortune > /dev/null; then
  echo "________________________________________________________________________________"
  echo
  fortune dune dune-messiah children-of-dune
  echo "________________________________________________________________________________"
  echo
fi

