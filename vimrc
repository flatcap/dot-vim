let mapleader=","

source ~/.vim/defset.vim
source ~/.vim/defmap.vim
source ~/.vim/defsyn.vim

filetype plugin indent on " load filetype plugins/indent settings

source ~/.vim/plugin/bufexplorer.vim
map Z \be
let g:bufExplorerSortBy='name'
let g:bufExplorerShowRelativePath=1

let pascal_delphi=1
let pascal_no_functions=1

let c_space_errors=1

autocmd BufNewFile,BufRead *                            set fdm=manual
autocmd BufNewFile,BufRead *.c,*.h,*.cc,*.cpp           source ~/.vim/syntax/c.vim
autocmd BufNewFile,BufRead *.pas,*.dpr                  source ~/.vim/syntax/pascal.vim
autocmd BufNewFile,BufRead *.html,*css                  source ~/.vim/syntax/html.vim
autocmd BufNewFile,BufRead *.java                       source ~/.vim/syntax/java.vim
autocmd BufNewFile,BufRead *.vim                        source ~/.vim/syntax/vim.vim
autocmd BufNewFile,BufRead *.dcf,pharos                 source ~/.vim/syntax/dcf.vim
autocmd BufNewFile,BufRead *.xsl                        source ~/.vim/syntax/xsl.vim
autocmd BufNewFile,BufRead *.module,*.php,*.inc,*.theme,*.engine,*.install,*.js source ~/.vim/syntax/php.vim
autocmd BufNewFile,BufRead *.sql,/tmp/sql*              set syn=mysql
autocmd BufNewFile,BufRead *.gconf                      set syn=xml
autocmd BufNewFile,BufRead *.gv                         set syn=dot
autocmd BufNewFile,BufRead *.txt                        setf txt
autocmd BufNewFile,BufRead *.txt                        set ai nosi ts=8 sw=8 noet

autocmd BufNewFile,BufRead *.c,*.h,*.cc,*.cpp           set fdm=manual

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

