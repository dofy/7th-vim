#!/bin/bash

# prints colored text
print_style () {

    if   [ "$2" == "info" ] ; then COLOR="96m";
    elif [ "$2" == "succ" ] ; then COLOR="92m";
    elif [ "$2" == "warn" ] ; then COLOR="95m";
    elif [ "$2" == "error" ] ; then COLOR="91m";
    else color COLOR="0m"; #default
    fi

    STARTCOLOR="\e[$COLOR";
    ENDCOLOR="\e[0m";

    printf "$STARTCOLOR%b$ENDCOLOR" "$1";
}

info () {
  print_style "$1" "info"
}

succ () {
  print_style "$1" "succ"
}

warn () {
  print_style "$1" "warn"
}

error () {
  print_style "$1" "error"
}

die () {
  error "$1" ; exit 1
}

logo () {
  warn '======================================\n'
  warn '  _____ _   _             _           \n'
  warn ' |___  | |_| |__   __   _(_)_ __ ___  \n'
  warn '    / /| __| `_ \  \ \ / / | `_ ` _ \ \n'
  warn '   / / | |_| | | |  \ V /| | | | | | |\n'
  warn '  /_/   \__|_| |_|   \_/ |_|_| |_| |_|\n'
  warn '======================================\n'
}

help () {
  logo
  echo
  echo 'Usage: install.sh <Options>'
  echo
  echo 'Options:'
  echo '  -i -- install'
  echo '  -u -- update'
  echo '  -c -- check denpendent'
  echo '  -h -- show help'
  echo
  exit 0
}

# TODO:
#
# - check git, python, cmake
# - install fonts

check () {
  E=0
  info 'Checking Git ...'
  if which git > /dev/null ; then
    succ '\t OK!\n'
  else
    E=1
    error '\t NO!\n'
    how_to git
  fi

  info 'Checking Python ...'
  if which python > /dev/null ; then
    succ '\t OK!\n'
  else
    E=1
    error '\t NO!\n'
    how_to python
  fi

  info 'Checking cmake ...'
  if which cmak > /dev/null ; then
    succ '\t OK!\n'
  else
    E=1
    error '\t NO!\n'
    how_to cmake
  fi

  if [ $E -ne 0 ] ; then
    warn '7th-Vim '
    die 'install failed!\n'
  fi
}

how_to () {
  if [ $1 == git ] ; then
    echo 'How to install Git'
    echo '- for macOS'
    echo '- for Linux'
  elif [ $1 == python ] ; then
    echo 'How to install Python'
    echo '- for macOS'
    echo '- for Linux'
  elif [ $1 == cmake ] ; then
    echo 'How to install cmake'
    echo '- for macOS'
    echo '- for Linux'
  fi
}

install_backup () {
  # remove and backup old files
  info '>>> Remove and backup old files ...\n'
  mkdir -p ~/7th-vim-bak
  mv ~/.vimrc ~/7th-vim-bak
  mv ~/.vimrc.local ~/7th-vim-bak
}

update_backup () {
  # remove and backup old files
  info '>>> Remove and backup old files ...\n'
  mkdir -p ~/7th-vim-bak
  mv ~/.vimrc ~/7th-vim-bak
}

load_vimrc () {
  # download .vimrc file
  info '>>> Download .vimrc file ...\n'
  curl -fLo ~/.vimrc \
    https://raw.githubusercontent.com/dofy/7th-vim/master/vimrc
}

append_settings () {
  # append settings
  curl -f \
    https://raw.githubusercontent.com/dofy/7th-vim/master/vimrc.append \
    >> ~/.vimrc
}

install () {
  # download .vimrc.local file
  info '>>> Download .vimrc.local file ...\n'
  curl -fLo ~/.vimrc.local \
    https://raw.githubusercontent.com/dofy/7th-vim/master/vimrc.local

  # download vim-plug
  info '>>> Download vim-plug ...\n'
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  # install plugins
  info '>>> Install plugins ...\n'
  vim +PlugClean! +PlugUpdate +qal
}

update () {
  # update plugins
  info '>>> Update plugins ...\n'
  vim +PlugClean! +PlugUpdate +qal
}

install_ycm () {
  info '>>> Install YouCompleteMe ...\n'
  ~/.vim/bundle/YouCompleteMe/install.py --all
}

run_install () {
  logo
  succ '>>> Thanks for Install 7th-Vim\n'
  install_backup
  load_vimrc
  install
  install_ycm 
  append_settings
  succ '>>> DONE!\n'
}

run_update () {
  logo
  succ '>>> Thanks for Update 7th-Vim\n'
  update_backup
  load_vimrc
  append_settings
  update
  succ '>>> DONE!\n'
}

if [ $# -ne 1 ]; then
  help
fi

while getopts ":iuc" opts; do
  case $opts in
    i)
      run_install;;
    u)
      run_update;;
    c)
      check;;
    :)
      help;;
    ?)
      help;;
  esac
done
