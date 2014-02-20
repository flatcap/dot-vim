set nocompatible

let mapleader=","

let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

call pathogen#infect()

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

autocmd BufNewFile,BufRead *                            set fdm=manual
autocmd BufNewFile,BufRead *.c,*.h,*.cc,*.cpp           source ~/.vim/syntax/c/0_default.vim
autocmd BufNewFile,BufRead *.pas,*.dpr                  source ~/.vim/syntax/pascal.vim
autocmd BufNewFile,BufRead *.html,*css                  source ~/.vim/syntax/html.vim
autocmd BufNewFile,BufRead *.java                       source ~/.vim/syntax/java.vim
autocmd BufNewFile,BufRead *.vim                        source ~/.vim/syntax/vim.vim
autocmd BufNewFile,BufRead *.dcf,pharos                 source ~/.vim/syntax/dcf.vim
autocmd BufNewFile,BufRead *.xsl                        source ~/.vim/syntax/xsl.vim
autocmd BufNewFile,BufRead *.module,*.php,*.inc,*.theme,*.engine,*.install,*.js source ~/.vim/syntax/php.vim
autocmd BufNewFile,BufRead *.sql,/tmp/sql*              set syn=mysql
autocmd BufNewFile,BufRead *.gconf,*.kml,*.gpx          set syn=xml
autocmd BufNewFile,BufRead *.gv                         set syn=dot
autocmd BufNewFile,BufRead *.conf                       set syn=cfg
autocmd BufNewFile,BufRead *.txt                        setf txt
autocmd BufNewFile,BufRead *.txt                        set ai nosi ts=8 sw=8 noet

autocmd BufReadPre  *.kmz,*.map let &bin=1
autocmd BufReadPost *.kmz,*.map %!unzip -p % | tidy -q -xml | unexpand -t8
autocmd BufReadPost *.kmz,*.map set syn=xml

autocmd BufNewFile,BufRead *.{automount,device,mount,path,service,socket,swap,target,timer,unit} set syn=dosini

autocmd BufNewFile,BufRead *.c,*.h,*.cc,*.cpp           set fdm=manual

"autocmd BufRead [0-9][0-9][0-9][0-9][0-9]  source ~/decode/highlight.vim

autocmd BufNewFile *.c    call template#load("c",    8, 1)
autocmd BufNewFile *.cpp  call template#load("cpp",  8, 1)
autocmd BufNewFile *.html call template#load("html", 9, 2)
autocmd BufNewFile *.sh   call template#load("sh",   3, 1)
autocmd BufNewFile *.awk  call template#load("awk",  6, 1)

" good enough for now
autocmd BufNewFile,BufRead *.js  so ~/.vim/fold/c.vim
autocmd BufNewFile,BufRead *.awk so ~/.vim/fold/php.vim

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
"autocmd BufWriteCmd * set buftype= bufhidden=

"autocmd BufWritePre *.c %s/\s\+$//e

map <F5> <C-W>jQ
map <F2> :wall<CR>:make .obj/%:r.o<CR>

