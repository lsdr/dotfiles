# vim: ft=sh:

if [ -e ~/.bashrc ]; then
  source ~/.bashrc
fi

if which fortune > /dev/null; then
  echo "________________________________________________________________________________"
  echo
  fortune -l
  echo "________________________________________________________________________________"
  echo
fi