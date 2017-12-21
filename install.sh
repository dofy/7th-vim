#!/bin/bash

# prints colored text
print_style () {
    if [ "$2" == "info" ] ; then
        COLOR="96m";
    elif [ "$2" == "succ" ] ; then
        COLOR="92m";
    elif [ "$2" == "warn" ] ; then
        COLOR="95m";
    elif [ "$2" == "error" ] ; then
        COLOR="91m";
    else #default color
        COLOR="0m";
    fi

    STARTCOLOR="\e[$COLOR";
    ENDCOLOR="\e[0m";

    printf "$STARTCOLOR%b$ENDCOLOR" "$1\n";
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
  error "$1"
  exit 1
}

logo () {
  warn '======================================'
  warn '  _____ _   _             _           '
  warn ' |___  | |_| |__   __   _(_)_ __ ___  '
  warn '    / /| __| `_ \  \ \ / / | `_ ` _ \ '
  warn '   / / | |_| | | |  \ V /| | | | | | |'
  warn '  /_/   \__|_| |_|   \_/ |_|_| |_| |_|'
  warn '======================================'
}

backup () {
  # remove and backup old files
  info '>>> Remove and backup old files ...'
  rm -rf ~/7th-vim-bak
  mkdir ~/7th-vim-bak
  #  mv ~/.vim ~/7th-vim-bak
  #  mv ~/.viminfo ~/7th-vim-bak
  mv ~/.vimrc ~/7th-vim-bak
  mv ~/.vimrc.local ~/7th-vim-bak
}

install () {
  # download .vimrc file
  info '>>> Download .vimrc file ...'
  curl -fLo ~/.vimrc \
    https://raw.githubusercontent.com/dofy/7th-vim/master/vimrc

  # download .vimrc.local file
  info '>>> Download .vimrc.local file ...'
  curl -fLo ~/.vimrc.local \
    https://raw.githubusercontent.com/dofy/7th-vim/master/vimrc.local

  # download vim-plug
  info '>>> Download vim-plug ...'
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  # install plugins
  info '>>> Install plugins ...'
  vim +PlugUpdate +qal

  # append settings
  curl -f \
    https://raw.githubusercontent.com/dofy/7th-vim/master/vimrc.append \
    >> ~/.vimrc
}

main () {
  logo
  succ '>>> Thanks for Install 7th-Vim'
  backup
  install
  succ '>>> DONE!'
}

# start >>
main
