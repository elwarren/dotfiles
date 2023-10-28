#!/bin/bash

export LDFLAGS="-L/opt/homebrew/opt/sqlite/lib -L/opt/homebrew/opt/llvm/lib -L/opt/homebrew/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++"
export CPPFLAGS="-I/opt/homebrew/opt/sqlite/include -I/opt/homebrew/opt/llvm/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/sqlite/lib/pkgconfig"

env PYTHON_CONFIGURE_OPTS='--enable-optimizations --enable-shared --enable-loadable-sqlite-extensions --enable-option-checking=fatal --with-system-expat --with-lto' \
env PYTHON_CFLAGS='-march=native -mtune=native' \
pyenv install 3.11.6 --force 
