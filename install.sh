#!/bin/bash

DOT_FILES_DIR=~/.dotfiles

if [ -e ~/.dotfiles ]
then
  echo "${DOT_FILES_DIR} already exists.  Exiting."
  exit 1
fi

git clone git://github.com/jasonc/dotfiles ${DOT_FILES_DIR}
if [ $? -ne 0 ]
then
  echo "Git clone failed.  Exiting."
  exit 1
fi

cd ${DOT_FILES_DIR}

make install
