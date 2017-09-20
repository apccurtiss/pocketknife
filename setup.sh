#!/bin/bash

THIS_DIR=$(dirname $(realpath $0))

for a in $@; do
  case $a in
    -f|--force)
    force=1
    shift
    ;;
    *)
    echo "Unrecognised option: $a."
    exit 1
    ;;
  esac
done

sharepath=/usr/share

# Setup vimrc
mkdir -p $sharepath/vim
if [[ $force ]] && [[ -a $sharepath/vim/vimrc ]]; then
  rm $sharepath/vim/vimrc
fi
if [[ ! -a $sharepath/vim/vimrc ]]; then
    ln -s $THIS_DIR/vimrc $sharepath/vim/vimrc
fi

# Setup go.sh
if [[ $force ]] && [[ -a $sharepath/go.sh ]]; then
  rm $sharepath/go.sh
fi
if [[ ! -a $sharepath/go.sh ]]; then
    ln -s $THIS_DIR/go.sh $sharepath/go.sh
fi

# Setup bashrc-additions
while read line; do
    grep "^$line$" ~/.bashrc > /dev/null || echo $line >> ~/.bashrc
done < $THIS_DIR/bashrc-additions
