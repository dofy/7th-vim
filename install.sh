#!/bin/sh

VIMHOME=~/.vim

warn() {
  echo "$1" >&2
}

die() {
  warn "$1"
  exit 1
}

#[ -e "$VIMHOME/vimrc" ] && die "$VIMHOME/vimrc already exists."
#[ -e "~/.vim" ] && die "~/.vim already exists."
#[ -e "~/.vimrc" ] && die "~/.vimrc already exists."

# download .vimrc file
curl -fLo ~/.vimrc \
  https://raw.githubusercontent.com/dofy/7thvim/master/.vimrc
# download .vimrc.local file
curl -fLo ~/.vimrc.local \
  https://raw.githubusercontent.com/dofy/7thvim/master/.vimrc.local
# download vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qal
