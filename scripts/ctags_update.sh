#!/usr/bin/env sh
CWD=$(pwd)
CXX_DIR="/usr/include/c++"
CXX_LIB=`find $CXX_DIR -type d -regex "$CXX_DIR/[0-9.]\{3,5\}"`
cd $CXX_LIB
echo $PWD
ctags -R --c++-kinds=+l+x+p --fields=+iaSl --extra=+q --language-force=c++ -f ~/.vim/tags/stdcxx.tags
cd $CWD
