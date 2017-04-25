set nocompatible

let s:dirs = [ 'backup', 'swap', 'undo', 'view' ]
for i in s:dirs
	let dir = $HOME.'/.cache/vim/'.i
	if (!isdirectory(dir))
		call mkdir(dir, 'p')
	endif
endfor

source ~/.vim/vundle.vim

syntax on

let mapleader=','

source ~/.vim/flagit.vim
source ~/.vim/defset.vim
source ~/.vim/defmap.vim
source ~/.vim/defsyn.vim
source ~/.vim/globals.vim
source ~/.vim/autocmd.vim

" load filetype plugins/indent settings
filetype plugin indent on

" set ts=4 sw=4
" highlight DiffAdd    ctermfg=none  ctermbg=234
" highlight DiffDelete ctermfg=124   ctermbg=none
" highlight DiffChange ctermbg=none  ctermfg=none
" highlight DiffText   ctermfg=none  ctermbg=234

" highlight foldcolumn ctermfg=green ctermbg=none
" set fdl=1

" autocmd BufReadPost *.c call library#Highlight('/home/mutt/tidy/ops.txt',                  'ctermbg=213 ctermfg=black', 'library_ops')
" autocmd BufReadPost *.c call library#Highlight('/home/mutt/tidy/opt.txt',                  'ctermbg=121 ctermfg=black', 'library_opt')
" autocmd BufReadPost *.c call library#Highlight('/home/mutt/tidy/opt2.txt',                 'ctermbg=121 ctermfg=black', 'library_opt')
" autocmd BufReadPost *.c call library#Highlight('/home/mutt/tidy/non-static-functions.txt', 'ctermbg=230 ctermfg=black', 'library_func')
" autocmd BufReadPost *.c call library#Highlight('/home/mutt/tidy/static-functions.txt',     'ctermbg=81  ctermfg=black', 'library_static')
" autocmd BufReadPost *.c call library#Highlight('q3',     'ctermbg=81  ctermfg=black', 'library_static')
" autocmd BufReadPost * call library#Highlight('jim2', 'ctermbg=81  ctermfg=black', 'library_strmp')

" autocmd BufReadPost *.c syntax match func_contents '^{\n\_.\{-}\n}$' conceal cchar=★
" autocmd BufReadPost *.c highlight func_contents ctermfg=240
" autocmd BufReadPost *.c set cole=3

" autocmd BufReadPost *.[ch] call library#Highlight('/home/mutt/functions/sus.txt',        'guibg=#ff8040 guifg=black', 'sus_ops')
" autocmd BufReadPost *.[ch] call library#Highlight('/home/mutt/functions/static.txt',     'guibg=#80ff80 guifg=black', 'static_fn')
" autocmd BufReadPost *.[ch] call library#Highlight('/home/mutt/functions/non-static.txt', 'guibg=#80ffff guifg=black', 'non_static_fn')

" autocmd BufReadPost *.c source /home/mutt/.vim/fold/deffold.vim
" autocmd BufReadPost *.c source /home/mutt/fold/fold/0_default.vim
" autocmd BufReadPost *.c source /home/mutt/fold/fold/neomutt_fold.vim

