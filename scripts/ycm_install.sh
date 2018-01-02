#!/usr/bin/env sh
CWD=$(pwd)
# Assuming that YCM is already installed by Vundle
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --clang-completer
cd $CWD
