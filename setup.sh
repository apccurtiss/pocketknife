#!/bin/bash

THIS_DIR=$(dirname $(realpath $0))

sharepath=/usr/share

# Setup vimrc
mkdir -p $sharepath/vim
ln -s $THIS_DIR/vimrc $sharepath/vim/vimrc

# Setup go.sh
ln -s $THIS_DIR/go.sh $sharepath/go.sh
