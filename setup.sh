#!/bin/bash

# So we can call this from anywhere
BASE=$PWD

# List of top dirs
TOPDIRS=(bin etc)

# Make sure that all submodules are initialized and updated
git submodule update --init

# Install links to all dot files and folders
for fname in `find $BASE/userdots -iname .\* -depth 1`; do
    ln -sf $fname $HOME/
done

# Install links for the top-dirs
for dir in ${TOPDIRS[*]}; do
    ln -sf $BASE/$dir $HOME/
done

