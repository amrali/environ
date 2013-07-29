#!/bin/bash

# So we can call this from anywhere
BASE=$(readlink -e $(dirname $0))

# Make sure that all submodules are initialized and updated
git submodule update --init

# Install links to all dot files and folders
for fd in $BASE/userdots/.[A-Z]*; do
    ln -sf `readlink -e $fd` $HOME/
done

# Install links for the top-dirs
ln -sf `readlink -e $BASE/bin` $HOME/

