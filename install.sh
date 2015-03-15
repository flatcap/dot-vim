#!/bin/bash

# link the files into their correct places

BASE=${0%/*}
cd "$BASE"

DIR=$(pwd)
cd

[ -L .vim   ] || ln -sf "$DIR"       .vim
[ -L .vimrc ] || ln -sf "$DIR/vimrc" .vimrc

