filetype off

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

" git clone git://github.com/gmarik/Vundle.vim bundle/vundle
Bundle 'gmarik/vundle'

Bundle 'bling/vim-airline'
" Bundle 'henrik/vim-indexed-search'
" Bundle 'kien/ctrlp.vim'
Bundle 'lambdalisue/vim-gista'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mhinz/vim-signify'
Bundle 'paulrouget/flagit'
Bundle 'Raimondi/delimitMate'
Bundle 'Shougo/unite.vim'
" Bundle 'SirVer/ultisnips'
Bundle 'sjl/gundo.vim'
" Bundle 'tmhedberg/matchit'
Bundle 'tommcdo/vim-exchange'
Bundle 'tommcdo/vim-fugitive-blame-ext'
Bundle 'tommcdo/vim-lion'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-obsession'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tyru/open-browser.vim'
Bundle 'vasconcelloslf/vim-interestingwords'
Bundle 'vim-scripts/taglist.vim'

Bundle 'flatcap/vim-deleteto'
Bundle 'flatcap/vim-keyword'
Bundle 'flatcap/vim-local'
Bundle 'flatcap/vim-piper'
Bundle 'flatcap/vim-save-next-file'
Bundle 'flatcap/vim-scratch'
Bundle 'flatcap/vim-space-man'
Bundle 'flatcap/vim-tabitha'

if ((hostname() == 'laptop.flatcap.org') && (expand ('$USER') == 'flatcap'))
	" Bundle 'jeaye/color_coded'
	" Bundle 'file:///home/flatcap/.vim/bundle/vim-cpp'
	Bundle 'file:///home/flatcap/.vim/bundle/vim-mnemosyne'
	" Bundle 'kshenoy/vim-signature'
endif

