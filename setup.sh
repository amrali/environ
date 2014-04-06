#!/bin/bash

# So we can call this from anywhere
BASE=$(readlink -e $(dirname $0))

# List of top dirs
TOPDIRS=(bin etc)

# Make sure that all submodules are initialized and updated
git submodule update --init

# Install links to all dot files and folders
for fname in $BASE/userdots/.[A-Z]*; do
    ln -sf `readlink -e $fname` $HOME/
done

# Install links for the top-dirs
for dir in ${TOPDIRS[*]}; do
    ln -sf `readlink -e $BASE/$dir` $HOME/
done

