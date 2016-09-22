" autocmd BufNewFile,BufRead *                             set foldmethod=manual
autocmd BufNewFile,BufRead *.pl,*.pm                     source ~/.vim/fold/perl.vim
autocmd BufNewFile,BufRead *.pas,*.dpr                   source ~/.vim/syntax/pascal.vim
autocmd BufNewFile,BufRead *.html,*css                   source ~/.vim/syntax/html.vim
autocmd BufNewFile,BufRead *.css                         source ~/.vim/fold/css.vim
autocmd BufNewFile,BufRead *.java                        source ~/.vim/syntax/java.vim
autocmd BufNewFile,BufRead *.vim                         source ~/.vim/syntax/vim.vim
autocmd BufNewFile,BufRead *.dcf,pharos                  source ~/.vim/syntax/dcf.vim
autocmd BufNewFile,BufRead *.xsl                         source ~/.vim/syntax/xsl.vim
autocmd BufNewFile,BufRead *.ics                         source ~/.vim/syntax/icalendar.vim
autocmd BufNewFile,BufRead *.conf                        set syntax=cfg
autocmd BufNewFile,BufRead **/nginx/*.{inc,conf}         set syntax=nginx
autocmd BufNewFile,BufRead *.module,*.php,*.inc,*.theme,*.engine,*.install,*.js source ~/.vim/syntax/php.vim
autocmd BufNewFile,BufRead *.sql,/tmp/sql*              set syntax=mysql
autocmd BufNewFile,BufRead *.gconf,*.kml,*.gpx          set syntax=xml
autocmd BufNewFile,BufRead *.gv                         setfiletype dot
autocmd BufNewFile,BufRead *.md                         set filetype=markdown syntax=markdown tw=80 ts=4 sw=4 et
autocmd BufNewFile,BufRead *.md                         source ~/.vim/fold/markdown.vim
autocmd BufNewFile,BufRead *.txt                        setfiletype txt
autocmd BufNewFile,BufRead *.txt                        setlocal autoindent nosmartindent tabstop=8 shiftwidth=8 noexpandtab linebreak
autocmd BufNewFile,BufRead *.yml                        setlocal tabstop=2 shiftwidth=2 expandtab textwidth=0
autocmd BufNewFile,BufRead .extra                       set syntax=sh
autocmd BufNewFile,BufRead *.geojson,*.jsonp            set syntax=javascript
autocmd BufNewFile,BufRead .vimlocal                    setfiletype vim
autocmd BufRead            */.git/rebase-apply/patch    set syntax=diff
autocmd BufRead            /tmp/bash-fc-*               set syntax=sh
autocmd BufRead            /tmp/mutt-*                  set syntax=mail ts=4 sw=4 et
autocmd BufRead            ~/.cache/mutt/mutt-*         set syntax=mail ts=4 sw=4 et
autocmd BufRead            /tmp/GHI_*                   set syntax=markdown ts=4 sw=4 et tw=80

autocmd BufReadPre  *.kmz,*.map let &bin=1
autocmd BufReadPost *.kmz,*.map %!unzip -p % | tidy -q -xml | unexpand -t8
autocmd BufReadPost *.kmz,*.map set syntax=xml

autocmd BufNewFile,BufRead *.{automount,device,mount,path,service,socket,swap,target,timer,unit} set syntax=dosini

"autocmd BufRead [0-9][0-9][0-9][0-9][0-9]  source ~/decode/highlight.vim

" autocmd BufNewFile *.c    call template#load('c',    8, 1)
" autocmd BufNewFile *.cpp  call template#load('cpp',  6, 1)
autocmd BufNewFile *.html call template#load('html', 9, 2)
autocmd BufNewFile *.sh   call template#load('sh',   3, 1)
autocmd BufNewFile *.awk  call template#load('awk',  7, 1)
autocmd BufNewFile *.pl   call template#load('pl',  10, 1)

" good enough for now
autocmd BufNewFile,BufRead *.js  source ~/.vim/fold/c.vim
autocmd BufNewFile,BufRead *.awk source ~/.vim/fold/php.vim
autocmd BufNewFile,BufRead *.vim source ~/.vim/fold/vim.vim

" automatically hide fugitive buffers after use
autocmd BufReadPost fugitive://* set bufhidden=delete

"autocmd BufReadPost *.h set bufhidden=delete autowriteall

" vim -b : edit binary using xxd-format!
augroup Binary
  autocmd!
  autocmd BufReadPre   *.bin let &bin=1
  autocmd BufReadPost  *.bin if &bin | %!xxd -g1
  autocmd BufReadPost  *.bin set filetype=xxd | endif
  autocmd BufWritePre  *.bin if &bin | %!xxd -r
  autocmd BufWritePre  *.bin endif
  autocmd BufWritePost *.bin if &bin | %!xxd -g1
  autocmd BufWritePost *.bin set nomod | endif
augroup END

autocmd BufReadPost * if (exists ("b:current_syntax") && ((b:current_syntax == "bash") || (b:current_syntax == "sh")))
autocmd BufReadPost *   source ~/.vim/syntax/sh.vim
autocmd BufReadPost * endif

autocmd BufReadPost * if (exists ("b:current_syntax") && ((b:current_syntax == "diff") || (b:current_syntax == "gitcommit") || (b:current_syntax == "gitsendemail")))
autocmd BufReadPost *   source ~/.vim/fold/diff.vim
autocmd BufReadPost * endif

autocmd BufReadPost * if (exists ("b:current_syntax") && (b:current_syntax == "gitcommit"))
autocmd BufReadPost *   set spell
autocmd BufReadPost * endif

autocmd BufReadPost * if (exists ("b:current_syntax") && (b:current_syntax == "gitcommit"))
autocmd BufReadPost *   normal gg
" autocmd BufReadPost *   startinsert!
autocmd BufReadPost * endif

" Attempt to save scratch buffer
" autocmd BufNew * :set buftype= bufhidden=

"autocmd BufWritePre *.c %s/\s\+$//e

if ((hostname() == 'laptop.flatcap.org') && (expand('$USER') == 'flatcap'))
	autocmd BufNewFile,BufRead * call LoadVimLocal()
endif

" easy escape from help pages, quickfix windows and fugitive buffers
autocmd FileType    help,qf      nnoremap <silent> <buffer> q :<c-u>quit!<cr>
autocmd BufReadPost fugitive://* nnoremap <silent> <buffer> q :<c-u>quit!<cr>
autocmd CmdwinEnter *            nnoremap <silent> <buffer> q :<c-u>quit!<cr>

