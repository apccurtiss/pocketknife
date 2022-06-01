#!/bin/bash

cwd=$(dirname $(realpath $0))

for a in $@; do
  case $opt in
    -f|--force)
    force=1
    shift
    ;;
    *)
    echo "Unrecognised option: $opt."
    exit 1
    ;;
  esac
done

sharepath=/usr/share

# Setup vimrc
mkdir -p $sharepath/vim
if [[ -a $sharepath/vim/vimrc ]]; then
    if [[ $force ]]; then
        echo "[*] Removing existing vimrc file: $sharepath/vim/vimrc"
        rm $sharepath/vim/vimrc
    else
        echo "[!] Cannot add vimrc: $sharepath/vim/vimrc already exists! (Use --force to overwrite)"
    fi
fi
if [[ ! -a $sharepath/vim/vimrc ]]; then
    echo "[*] Adding vimrc"
    ln -s $cwd/vimrc $sharepath/vim/vimrc
fi

source_cmd="source \"$cwd/bash/pocketknife.sh\""
grep "^$source_cmd$" ~/.bashrc > /dev/null
if [[ $? -ne 0 ]]; then
    echo "[*] Adding additional bash source to ~/.bashrc"
    echo "$source_cmd" >> ~/.bashrc
else
    echo "[!] Cannot add bash source to ~/.bashrc: already exists"
fi
