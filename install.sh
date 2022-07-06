#!/bin/bash

# print colored text
print_style () {

  if   [ "$2" == "info" ] ; then COLOR="96m";
  elif [ "$2" == "succ" ] ; then COLOR="92m";
  elif [ "$2" == "warn" ] ; then COLOR="95m";
  elif [ "$2" == "error" ] ; then COLOR="91m";
  else COLOR="0m"; #default color
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

normal () {
  print_style "$1" "-"
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
  echo '  -c -- check dependencies'
  echo '  -l -- show the list of supported languages'
  echo '  -h -- show help'
  echo
  exit 0
}

language_support_info () {
  info '-------------------------------------------------------------------\n'
  info 'Edit ' ; succ '~/.vimrc.language' ; info ' to enable/disable language support you need.\n'
  info 'Supported languages:\n'
  normal '  - markdown\n'
  normal '  - html\n'
  normal '  - css\n'
  normal '  - js\n'
  normal '  - json\n'
  normal '  - php\n'
  normal '  - python\n'
  #normal '  - c/c++\n'
  normal '  - go\n'
  info '-------------------------------------------------------------------\n'
}

# check dependent
check () {
  E=0
  info '>> Checking Git ...'
  if which git > /dev/null ; then
    succ '\t OK!\n'
  else
    E=1
    error '\t NO!\n'
    how_to git
  fi

  info '>> Checking Python ...'
  if which python3 > /dev/null ; then
    succ '\t OK!\n'
  else
    E=1
    error '\t NO!\n'
    how_to python
  fi

  info '>> Checking cmake ...'
  if which cmake > /dev/null ; then
    succ '\t OK!\n'
  else
    E=1
    error '\t NO!\n'
    how_to cmake
  fi

  if [ $E -ne 0 ] ; then
    warn '>>> The 7th-Vim '
    die 'install failed!\n'
  fi
}

how_to () {
  if [ $1 == git ] ; then
    warn 'How to install Git:\n'
    info '- for macOS, refer to the following url:\n'
    normal 'https://git-scm.com/book/en/v2/Getting-Started-Installing-Git\n'
    info '- for Ubuntu\n'
    info '$ ' ; normal 'sudo apt-get install -y git-all\n'
    info '- for CentOS\n'
    info '$ ' ; normal 'sudo yum install -y git-all\n'
  elif [ $1 == python ] ; then
    warn 'How to install Python:\n'
    info '- for macOS\n'
    info '$ ' ; normal 'brew install python\n'
    info '- for Ubuntu\n'
    info '$ ' ; normal 'sudo apt-get install -y python-dev python3-dev\n'
    info '- for CentOS\n'
    info '$ ' ; normal 'sudo yum install -y python-devel python3-devel\n'
  elif [ $1 == cmake ] ; then
    warn 'How to install cmake:\n'
    info '- for macOS\n'
    info '$ ' ; normal 'brew install gcc cmake\n'
    info '- for Ubuntu\n'
    info '$ ' ; normal 'sudo apt-get install -y cmake\n'
    info '- for CentOS\n'
    info '$ ' ; normal 'sudo yum install -y automake gcc gcc-c++ cmake\n'
  fi
}

create_undo_dir () {
  mkdir -p ~/.vim/.undodir
}

install_backup () {
  # remove and backup old files
  info '>>> Remove and backup old files ...\n'
  mkdir -p ~/7th-vim-bak
  mv ~/.vimrc ~/7th-vim-bak
  mv ~/.vimrc.local ~/7th-vim-bak
  mv ~/.vimrc.plugins ~/7th-vim-bak
  mv ~/.vimrc.language ~/7th-vim-bak
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

  # download .vimrc.language file
  if [ ! -f ~/.vimrc.language ] ; then
    info '>>> Download .vimrc.language file ...\n'
    curl -fLo ~/.vimrc.language \
      https://raw.githubusercontent.com/dofy/7th-vim/master/vimrc.language
  fi

  # download .vimrc.plugins file
  if [ ! -f ~/.vimrc.plugins ] ; then
    info '>>> Download .vimrc.plugins file ...\n'
    curl -fLo ~/.vimrc.plugins \
      https://raw.githubusercontent.com/dofy/7th-vim/master/vimrc.plugins
  fi

  # download .vimrc.local file
  if [ ! -f ~/.vimrc.local ] ; then
    info '>>> Download .vimrc.local file ...\n'
    curl -fLo ~/.vimrc.local \
      https://raw.githubusercontent.com/dofy/7th-vim/master/vimrc.local
  fi
}

append_settings () {
  # append settings
  curl -f \
    https://raw.githubusercontent.com/dofy/7th-vim/master/vimrc.append \
    >> ~/.vimrc
}

install_plugin () {
  # download vim-plug
  info '>>> Download vim-plug ...\n'
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  # install plugins
  info '>>> Install plugins ...\n'
  vim +PlugClean! +PlugUpdate +qal
}

update_plugin () {
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
  succ '>>> Thanks for Installing The 7th-Vim\n'
  check
  create_undo_dir
  install_backup
  load_vimrc
  install_plugin
  install_ycm 
  append_settings
  language_support_info
  succ '>>> DONE!\n\n'
}

run_update () {
  logo
  succ '>>> Thanks for Updating The 7th-Vim\n'
  create_undo_dir
  update_backup
  load_vimrc
  append_settings
  update_plugin
  language_support_info
  succ '>>> DONE!\n\n'
}

if [ $# -ne 1 ]; then
  help
fi

while getopts ":iucl" opts; do
  case $opts in
    i)
      run_install;;
    u)
      run_update;;
    c)
      logo
      check;;
    l)
      logo
      language_support_info;;
    :)
      help;;
    ?)
      help;;
  esac
done
