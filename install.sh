#!/bin/sh

# download .vimrc file
curl -fLo ~/.vimrc \
  https://raw.githubusercontent.com/dofy/7th-vim/master/.vimrc

# download .vimrc.local file
curl -fLo ~/.vimrc.local \
  https://raw.githubusercontent.com/dofy/7th-vim/master/.vimrc.local

# download vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install plugins
vim +PlugInstall +qal
