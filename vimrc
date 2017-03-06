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

" set ts=4 sw=4
" highlight DiffAdd    ctermfg=none  ctermbg=234
" highlight DiffDelete ctermfg=124   ctermbg=none
" highlight DiffChange ctermbg=none  ctermfg=none
" highlight DiffText   ctermfg=none  ctermbg=234

highlight foldcolumn ctermfg=green ctermbg=none
set fdl=1
