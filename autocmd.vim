" autocmd BufNewFile,BufRead *                             set fdm=manual
autocmd BufNewFile,BufRead *.pl,*.pm                     source ~/.vim/fold/perl.vim
autocmd BufNewFile,BufRead *.pas,*.dpr                   source ~/.vim/syntax/pascal.vim
autocmd BufNewFile,BufRead *.html,*css                   source ~/.vim/syntax/html.vim
autocmd BufNewFile,BufRead *.css                         source ~/.vim/fold/css.vim
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
autocmd BufNewFile,BufRead .vimlocal                    setf vim

autocmd BufReadPre  *.kmz,*.map let &bin=1
autocmd BufReadPost *.kmz,*.map %!unzip -p % | tidy -q -xml | unexpand -t8
autocmd BufReadPost *.kmz,*.map set syn=xml

autocmd BufNewFile,BufRead *.{automount,device,mount,path,service,socket,swap,target,timer,unit} set syn=dosini

"autocmd BufRead [0-9][0-9][0-9][0-9][0-9]  source ~/decode/highlight.vim

" autocmd BufNewFile *.c    call template#load('c',    8, 1)
" autocmd BufNewFile *.cpp  call template#load('cpp',  6, 1)
autocmd BufNewFile *.html call template#load('html', 9, 2)
autocmd BufNewFile *.sh   call template#load('sh',   3, 1)
autocmd BufNewFile *.awk  call template#load('awk',  7, 1)
autocmd BufNewFile *.pl   call template#load('pl',  10, 1)

" good enough for now
autocmd BufNewFile,BufRead *.js  so ~/.vim/fold/c.vim
autocmd BufNewFile,BufRead *.awk so ~/.vim/fold/php.vim
autocmd BufNewFile,BufRead *.vim so ~/.vim/fold/vim.vim

" automatically hide fugitive buffers after use
autocmd BufReadPost fugitive://* set bufhidden=delete

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

autocmd BufReadPost * if (exists ("b:current_syntax") && (b:current_syntax == "gitcommit"))
autocmd BufReadPost *   normal gg
" autocmd BufReadPost *   startinsert!
autocmd BufReadPost * endif

" Attempt to save scratch buffer
" autocmd BufNew * :set buftype= bufhidden=

"autocmd BufWritePre *.c %s/\s\+$//e

