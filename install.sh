#!/bin/bash

DOT_FILES_DIR=~/.dotfiles

[ -e ${DOT_FILES_DIR} ] && {
  echo "${DOT_FILES_DIR} already exists.  Exiting."
  exit 1
}

git clone https://github.com/jasonc/dotfiles ${DOT_FILES_DIR} || {
  echo 'Git clone failed.  Exiting.'
  exit 1
}

cd ${DOT_FILES_DIR}

make install
