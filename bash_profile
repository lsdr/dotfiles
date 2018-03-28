# vim: ft=sh:

if [ -e ~/.bashrc ]; then
  source ~/.bashrc
fi

if [ -e ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

FORTUNES='dune dune-messiah red-mars green-mars quotes ursula tyson sagan
dispossessed blue-mars career freedom engineering'

if which fortune > /dev/null; then
  echo "________________________________________________________________________________"
  echo
  fortune $FORTUNES
  echo "________________________________________________________________________________"
  echo
fi

