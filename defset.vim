scriptencoding utf-8

set   autoindent
set   autoread
set   background=dark
set   backspace=indent,eol,start
set   backup
set   backupcopy=yes
set   backupdir=~/.cache/vim/backup//
set   clipboard=unnamed,unnamedplus
set   commentstring=#%s
set   complete-=i
set   complete-=u
set   conceallevel=2
set   concealcursor=ncv
set   cpoptions=aABceFMns
set   diffopt=filler,vertical
set   directory=~/.cache/vim/swap//
set   eadirection=ver
set   equalalways
set noerrorbells
set   esckeys
set noexrc
set   fillchars=fold:\ ,vert:│
set   formatoptions=cjnoqrt
set   gdefault
set   hidden
set   history=500
set nohlsearch
set   ignorecase
set   incsearch
set noinfercase
set   laststatus=1
set   lazyredraw
set nolinebreak
set   listchars=extends:▶,precedes:◀,tab:▷∙,eol:↵,trail:∙,nbsp:△
set   magic
set nomodeline
set nomore
set   mouse=nvr
set   nrformats+=alpha
set   nrformats-=octal
set   report=0
set noruler
set   scrolloff=0
set   sessionoptions=buffers,curdir,folds,options,tabpages,winsize
set   shiftround
set   shiftwidth=8
set   shortmess=filnxtToOsrmI
let  &showbreak="↳ "
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
set   statusline=%f
set   suffixes=,.h
set   swapfile
set   synmaxcol=1024
set   showtabline=1
set   tabstop=8
set   tagrelative
set   tags=tags
set   terse
set   textwidth=0
set   timeout
set   timeoutlen=500
set   ttimeout
set   ttimeoutlen=50
set   title
set   titleold=
set   titlestring=vi\ %f\ %m%r
set   t_Co=256
set   t_vb=
set   ttyfast
set   undofile
set   undodir=~/.cache/vim/undo//
set   viewdir=~/.cache/vim/view//
set   viminfo=%,'50,:500,@100,/500,n~/.cache/vim/viminfo
set   virtualedit+=block
set novisualbell
set nowarn
set   whichwrap=b,s,[,],<,>,~
set   wildignore=*.o,tags,*.img,*.qcow2,*.iso
set nowildignorecase
set nowildmenu
set   wildmode=list:full
set   winwidth=10
set nowrap
set   wrapscan

if &diff
	set diffopt=filler,context:3,foldcolumn:0
	highlight Folded ctermbg=none ctermfg=22 term=none
	highlight DiffChange term=none ctermbg=none
	set laststatus=2
	highlight DiffText ctermfg=165 ctermbg=black
	highlight DiffChange ctermbg=none ctermfg=none
endif

