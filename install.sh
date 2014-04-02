#!/bin/bash

#ln all the files into their correct places

cd

[ -L .vim   ] || ln -sf shell/vim       .vim
[ -L .vimrc ] || ln -sf shell/vim/vimrc .vimrc

