#!/bin/bash

DOT_FILES_DIR=~/.dotfiles
VIM_IR_BLACK_FILE=~/.vim/colors/ir_black.vim

[ -e ${DOT_FILES_DIR} ] && {
  echo "${DOT_FILES_DIR} already exists. Exiting."
  exit 1
}

git clone https://github.com/jasonc/dotfiles ${DOT_FILES_DIR} || {
  echo 'Git clone failed. Exiting.'
  exit 1
}

# Install the dotfiles
cd ${DOT_FILES_DIR}
make install

# Install the ir_black vim color file, if needed.
[ -e /home/j/.vim/colors/ir_black.vim ] || {
  mkdir -p ~/.vim/colors
  cd ~/.vim/colors
  curl -LO https://raw.githubusercontent.com/twerth/ir_black/refs/heads/master/colors/ir_black.vim
}
