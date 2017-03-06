filetype off

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

" git clone git://github.com/gmarik/Vundle.vim bundle/vundle
Bundle 'gmarik/vundle'

Bundle 'bling/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'lambdalisue/vim-gista'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mhinz/vim-signify'
Bundle 'paulrouget/flagit'
" Bundle 'Raimondi/delimitMate'
Bundle 'Shougo/unite.vim'
Bundle 'sjl/gundo.vim'
Bundle 'tommcdo/vim-exchange'
Bundle 'tommcdo/vim-fugitive-blame-ext'
Bundle 'tommcdo/vim-lion'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-characterize'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-obsession'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tyru/open-browser.vim'
Bundle 'vasconcelloslf/vim-interestingwords'
Bundle 'vim-scripts/taglist.vim'
Bundle 'vim-scripts/DrawIt'

Bundle 'flatcap/vim-deleteto'
Bundle 'flatcap/vim-keyword'
Bundle 'flatcap/vim-local'
Bundle 'flatcap/vim-piper'
Bundle 'flatcap/vim-save-next-file'
Bundle 'flatcap/vim-scratch'
Bundle 'flatcap/vim-space-man'
Bundle 'flatcap/vim-tabitha'

" Bundle 'henrik/vim-indexed-search'
" Bundle 'kien/ctrlp.vim'
" Bundle 'SirVer/ultisnips'
" Bundle 'tmhedberg/matchit'

if ((hostname() == 'laptop.flatcap.org') && ((expand ('$USER') == 'flatcap') || (expand ('$USER') == 'mutt')|| (expand ('$USER') == 'build')))
	" Bundle 'jeaye/color_coded'
	Bundle 'file:///mnt/space/shell/vim/bundle/vim-cpp'
	Bundle 'file:///mnt/space/shell/vim/bundle/vim-mnemosyne'
	" Bundle 'kshenoy/vim-signature'
endif

