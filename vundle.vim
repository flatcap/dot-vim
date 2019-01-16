filetype off

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

" git clone git://github.com/gmarik/Vundle.vim bundle/vundle
Bundle 'gmarik/vundle'

Plugin 'flatcap/vim-cpp'
Plugin 'flatcap/vim-deleteto'
Plugin 'flatcap/vim-keyword'
Plugin 'flatcap/vim-local'
Plugin 'flatcap/vim-mnemosyne'
Plugin 'flatcap/vim-piper'
Plugin 'flatcap/vim-save-next-file'
Plugin 'flatcap/vim-scratch'
Plugin 'flatcap/vim-space-man'
Plugin 'flatcap/vim-tabitha'
Plugin 'neomutt/neomutt.vim'

Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-characterize'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'

Plugin 'ahf/cocci-syntax'
Plugin 'ap/vim-css-color'
Plugin 'bling/vim-airline'
Plugin 'chrisbra/Recover.vim'
Plugin 'chrisbra/vim-diff-enhanced'
Plugin 'dhruvasagar/vim-table-mode'
" Plugin 'vim-scripts/DrawIt'
" Plugin 'chrisbra/DynamicSigns'
" Plugin 'Konfekt/FastFold'
" Plugin 'vim-scripts/ifdef-highlighting'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'kopischke/vim-fetch'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'machakann/vim-highlightedyank'
" Plugin 'tmhedberg/matchit'
Plugin 'mileszs/ack.vim'
" Plugin 'paulrouget/flagit'
" Plugin 'luochen1990/rainbow'
" Plugin 'vim-scripts/scratch.vim'
Plugin 'sjl/gundo.vim'
Plugin 'skywind3000/asyncrun.vim'
" Plugin 'mklabs/split-term.vim'
Plugin 'tommcdo/vim-exchange'
Plugin 'tommcdo/vim-fugitive-blame-ext'
Plugin 'tommcdo/vim-lion'
Plugin 'vasconcelloslf/vim-interestingwords'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'b4winckler/vim-angry'
" Plugin 'airblade/vim-gitgutter'
" Plugin 'nathanaelkane/vim-indent-guides'
" Plugin 'terryma/vim-multiple-cursors'
Plugin 'wellle/targets.vim'
Plugin 'whiteinge/diffconflicts'
" Plugin 'vim-scripts/YankRing.vim'

Plugin 'junegunn/gv.vim'

" Plugin 'Yggdroot/indentLine'
Plugin 'haya14busa/incsearch.vim'
" Plugin 'itchyny/vim-cursorword'

if ((hostname() == 'laptop.flatcap.org') && ((expand ('$USER') == 'flatcap') || (expand ('$USER') == 'mutt')|| (expand ('$USER') == 'build')))
	" Plugin 'jeaye/color_coded'
	" Plugin 'file:///mnt/space/shell/vim/Plugin/vim-cpp'
	" Plugin 'kshenoy/vim-signature'
endif

