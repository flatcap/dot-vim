set nocompatible
filetype off

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

" git clone git://github.com/gmarik/Vundle.vim.git bundle/vundle
Bundle 'gmarik/vundle'

Bundle 'bling/vim-airline.git'
Bundle 'godlygeek/tabular.git'
Bundle 'Lokaltog/vim-easymotion.git'
Bundle 'mhinz/vim-signify.git'
Bundle 'SirVer/ultisnips.git'
Bundle 'sjl/gundo.vim.git'
Bundle 'tommcdo/vim-exchange.git'
Bundle 'tommcdo/vim-fugitive-blame-ext.git'
Bundle 'tommcdo/vim-lion.git'
Bundle 'tpope/vim-abolish.git'
Bundle 'tpope/vim-commentary.git'
Bundle 'tpope/vim-fugitive.git'
Bundle 'tpope/vim-git.git'
Bundle 'tpope/vim-obsession.git'
Bundle 'tpope/vim-repeat.git'
Bundle 'tpope/vim-speeddating.git'
Bundle 'tpope/vim-surround.git'
Bundle 'tpope/vim-unimpaired.git'
Bundle 'vim-scripts/taglist.vim.git'

Bundle 'flatcap/vim-deleteto.git'
Bundle 'flatcap/vim-keyword.git'
Bundle 'flatcap/vim-piper.git'
Bundle 'flatcap/vim-save-next-file.git'

filetype plugin indent on

syntax on

let mapleader=','

let g:Tlist_Use_Right_Window=1
let g:Tlist_Compact_Format=1
let g:Tlist_Enable_Fold_Column=0
let g:Tlist_Ctags_Cmd='ctags -I UNUSED'

let g:airline#extensions#tabline#buffer_min_count = 1
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#whitespace#checks = [ 'trailing' ]
let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'

let g:signify_disable_by_default = 1

let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:UltiSnipsSnippetDirectories=['snips']

let g:zipPlugin_ext = '*.zip,*.jar,*.xpi,*.ja,*.war,*.ear,*.celzip,*.oxt,*.kmz,*.wsz,*.xap,*.docx,*.docm,*.dotx,*.dotm,*.potx,*.potm,*.ppsx,*.ppsm,*.pptx,*.pptm,*.ppam,*.sldx,*.thmx,*.xlam,*.xlsx,*.xlsm,*.xlsb,*.xltx,*.xltm,*.xlam,*.crtx,*.vdw,*.glox,*.gcsx,*.gqsx,*.ods'

let g:gundo_preview_bottom = 1

set conceallevel=2
set concealcursor=ncv
highlight conceal ctermfg=red ctermbg=none

source ~/.vim/defset.vim
source ~/.vim/defmap.vim
source ~/.vim/defsyn.vim

filetype plugin indent on " load filetype plugins/indent settings

let g:c_space_errors=1
"let g:c_gnu=1
"let g:c_curly_error=1
"let g:c_comment_strings=1

autocmd BufNewFile,BufRead *                             set fdm=manual
autocmd BufNewFile,BufRead *.c,*.h,*.cc,*.cpp,*.ccg,*.hg source ~/.vim/fold/c.vim
autocmd BufNewFile,BufRead *.pl,*.pm                     source ~/.vim/fold/perl.vim
autocmd BufNewFile,BufRead *.pas,*.dpr                   source ~/.vim/syntax/pascal.vim
autocmd BufNewFile,BufRead *.html,*css                   source ~/.vim/syntax/html.vim
autocmd BufNewFile,BufRead *.java                        source ~/.vim/syntax/java.vim
autocmd BufNewFile,BufRead *.vim                         source ~/.vim/syntax/vim.vim
autocmd BufNewFile,BufRead *.dcf,pharos                  source ~/.vim/syntax/dcf.vim
autocmd BufNewFile,BufRead *.xsl                         source ~/.vim/syntax/xsl.vim
autocmd BufNewFile,BufRead *.module,*.php,*.inc,*.theme,*.engine,*.install,*.js source ~/.vim/syntax/php.vim
autocmd BufNewFile,BufRead *.sql,/tmp/sql*              set syn=mysql
autocmd BufNewFile,BufRead *.gconf,*.kml,*.gpx          set syn=xml
autocmd BufNewFile,BufRead *.gv                         set ft=dot
autocmd BufNewFile,BufRead *.conf                       set syn=cfg
autocmd BufNewFile,BufRead *.txt                        setf txt
autocmd BufNewFile,BufRead *.txt                        set ai nosi ts=8 sw=8 noet
autocmd BufNewFile,BufRead .extra                       set syn=sh
autocmd BufNewFile,BufRead *.geojson,*.jsonp            set syn=javascript
" autocmd BufNewFile,BufRead .vimlocal                    setf vim

autocmd BufReadPre  *.kmz,*.map let &bin=1
autocmd BufReadPost *.kmz,*.map %!unzip -p % | tidy -q -xml | unexpand -t8
autocmd BufReadPost *.kmz,*.map set syn=xml

autocmd BufNewFile,BufRead *.{automount,device,mount,path,service,socket,swap,target,timer,unit} set syn=dosini

"autocmd BufRead [0-9][0-9][0-9][0-9][0-9]  source ~/decode/highlight.vim

" autocmd BufNewFile *.c    call template#load('c',    8, 1)
" autocmd BufNewFile *.cpp  call template#load('cpp',  6, 1)
autocmd BufNewFile *.html call template#load('html', 9, 2)
autocmd BufNewFile *.sh   call template#load('sh',   3, 1)
autocmd BufNewFile *.awk  call template#load('awk',  6, 1)
autocmd BufNewFile *.pl   call template#load('pl',  10, 1)

autocmd BufEnter *.cpp,*.h call classname#classname()
autocmd BufEnter * call vimlocal#Load()

" good enough for now
autocmd BufNewFile,BufRead *.js  so ~/.vim/fold/c.vim
autocmd BufNewFile,BufRead *.awk so ~/.vim/fold/php.vim
autocmd BufNewFile,BufRead *.vim so ~/.vim/fold/vim.vim

" automatically hide fugitive buffers after use
autocmd BufReadPost fugitive://* set bufhidden=delete

" If there's an error in my STL use, there's little point staring at the source
autocmd BufRead /usr/include/* set foldlevel=4
autocmd BufRead /usr/include/c++/4.8.2/*  set syntax=c bufhidden=delete
autocmd BufRead /usr/include/sigc++-2.0/* set syntax=c bufhidden=delete

"autocmd BufReadPost *.h set bufhidden=delete autowriteall

" vim -b : edit binary using xxd-format!
augroup Binary
  autocmd!
  autocmd BufReadPre   *.bin let &bin=1
  autocmd BufReadPost  *.bin if &bin | %!xxd -g1
  autocmd BufReadPost  *.bin set ft=xxd | endif
  autocmd BufWritePre  *.bin if &bin | %!xxd -r
  autocmd BufWritePre  *.bin endif
  autocmd BufWritePost *.bin if &bin | %!xxd -g1
  autocmd BufWritePost *.bin set nomod | endif
augroup END

autocmd BufReadPost * if (exists ("b:current_syntax") && ((b:current_syntax == "bash") || (b:current_syntax == "sh")))
autocmd BufReadPost *   source ~/.vim/syntax/sh.vim
autocmd BufReadPost * endif

autocmd BufReadPost * if (exists ("b:current_syntax") && ((b:current_syntax == "diff") || (b:current_syntax == "gitcommit")))
autocmd BufReadPost *   source ~/.vim/fold/diff.vim
autocmd BufReadPost * endif

" Attempt to save scratch buffer
autocmd BufNew * :set buftype= bufhidden=

"autocmd BufWritePre *.c %s/\s\+$//e

source ~/.vim/tabmap.vim

