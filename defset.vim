set   autoindent
set   autoread
set   background=dark
set   backspace=indent,eol,start
set   backup
set   backupcopy=yes
set   backupdir=/run/user/$UID/vim/backup
set   clipboard=unnamed,unnamedplus
set   diffopt=filler,vertical
set   directory=/run/user/$UID/vim/swap
set noequalalways
set noerrorbells
set noexrc
set   fillchars=stl:─,stlnc:─,vert:│,fold:\ 
set   foldopen=mark,tag,quickfix
set   formatoptions=tcnoqr
set   gdefault
set   hidden
set   history=500
set nohlsearch
set   ignorecase
set   incsearch
set noinfercase
set   laststatus=2
set   lazyredraw
set nolinebreak
set   listchars=extends:>,precedes:<,tab:>-,eol:$,trail:X,nbsp:+
set   magic
set nomore
set   mouse=nvr
set   nrformats+=alpha
set   nrformats-=octal
set noruler
set   scrolloff=0
set   shiftround
set   shiftwidth=8
set   shortmess=filnxtToOsrmI
set   showcmd
set   showmatch
set   showmode
set   sidescroll=1
set   sidescrolloff=0
set   smartcase
set   smartindent
set   smarttab
set   splitbelow
set   splitright
set   statusline=─%f
set   suffixes=,.h
set   swapfile
set   synmaxcol=1024
set   showtabline=1
set   tabstop=8
set   tagrelative
set   tags=tags
set   terse
set   textwidth=0
set   title
set   titleold=
set   titlestring=vi\ %f\ %m%r
set   t_Co=256
set   t_vb=
set   undofile
set   undodir=/run/user/$UID/vim/undo
set   viminfo='50,:500,@100,/500,n~/.vim/viminfo
set novisualbell
set nowarn
set   whichwrap=b,s,[,],<,>,~
set   wildignore=*.o,main,tags
set nowildignorecase
set nowildmenu
set   wildmode=list:full
set   winwidth=10
set nowrap
set   wrapscan

if &diff
	set diffopt=filler,context:3,foldcolumn:0
	hi Folded ctermbg=none ctermfg=22 term=none
	hi DiffChange term=none ctermbg=none
	set laststatus=2
	hi DiffText ctermfg=165 ctermbg=black
	hi DiffChange ctermbg=none ctermfg=none
endif

