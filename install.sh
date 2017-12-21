#!/bin/bash

function backup() {
  # remove and backup old files
  echo '>>> Remove and backup old files ...'
  rm -rf ~/7th-vim-bak
  mkdir ~/7th-vim-bak
  mv ~/.vim ~/7th-vim-bak
  mv ~/.viminfo ~/7th-vim-bak
  mv ~/.vimrc ~/7th-vim-bak
  mv ~/.vimrc.local ~/7th-vim-bak
}

function install() {
  # download .vimrc file
  echo '>>> Download .vimrc file ...'
  curl -fLo ~/.vimrc \
    https://raw.githubusercontent.com/dofy/7th-vim/master/.vimrc

  # download vim-plug
  echo '>>> download vim-plug ...'
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  # install plugins
  echo '>>> install plugins ...'
  vim +PlugInstall +qal

  # download .vimrc.local file
  echo '>>> Download .vimrc.local file ...'
  curl -fLo ~/.vimrc.local \
    https://raw.githubusercontent.com/dofy/7th-vim/master/.vimrc.local
}

function main() {
  echo '>>> Start Install 7th-Vim'
  backup
  install
  echo '>>> DONE!'
}

# start >>
main
