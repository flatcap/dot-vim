set nocompatible

let s:dirs = [ 'backup', 'swap', 'undo', 'view' ]
for i in s:dirs
	let dir = $HOME.'/.cache/vim/'.i
	if (!isdirectory(dir))
		call mkdir(dir, 'p')
	endif
endfor

source ~/.vim/vundle.vim

syntax on

let mapleader=','

source ~/.vim/flagit.vim
source ~/.vim/defset.vim
source ~/.vim/defmap.vim
source ~/.vim/defsyn.vim
source ~/.vim/globals.vim
source ~/.vim/autocmd.vim

" load filetype plugins/indent settings
filetype plugin indent on

