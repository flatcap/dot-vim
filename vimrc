if !has('nvim')
set nocompatible
endif

let s:dirs = [ 'backup', 'swap', 'undo', 'view' ]
for i in s:dirs
	let dir = $HOME.'/.cache/vim/'.i
	if (!isdirectory(dir))
		call mkdir(dir, 'p')
	endif
endfor

source ~/.vim/vundle.vim

syntax on

" let mapleader=','
let mapleader=' '

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

" autocmd BufReadPost *.[ch] call library#Highlight('/home/mutt/pager/other-globals.txt', 'guibg=#802020 guifg=NONE', 'global_other')
" autocmd BufReadPost *.[ch] call library#Highlight('/home/mutt/pager/variables.txt',     'guibg=#004000 guifg=NONE', 'global_variables')

" autocmd BufReadPost *.c syntax match func_contents '^{\n\_.\{-}\n}$' conceal cchar=★
" autocmd BufReadPost *.c highlight func_contents ctermfg=240
" autocmd BufReadPost *.c set cole=3

" autocmd BufReadPost *.[ch] call library#Highlight('/home/mutt/functions/sus.txt',        'guibg=#ff8040 guifg=black', 'sus_ops')
" autocmd BufReadPost *.[ch] call library#Highlight('/home/mutt/functions/static.txt',     'guibg=#80ff80 guifg=black', 'static_fn')
" autocmd BufReadPost *.[ch] call library#Highlight('/home/mutt/functions/non-static.txt', 'guibg=#80ffff guifg=black', 'non_static_fn')
" autocmd BufReadPost *.[ch] call library#Highlight('i1', 'guibg=#ff8040 guifg=black', 'non_static_fn')
" autocmd BufReadPost *.[ch] call library#Highlight('/home/mutt/work/globals.txt', 'guibg=#380000 guifg=white', 'global')

" autocmd BufReadPost *.[ch] call library#Highlight('/home/mutt/work/functions.txt', 'guibg=#80ffff guifg=black', 'neo_functions')

autocmd BufNewFile,BufReadPost *.[ch] source /home/mutt/.vim/fold/deffold.vim
autocmd BufNewFile,BufReadPost *.[ch] source /home/mutt/fold-vim/fold/0_default.vim
autocmd BufNewFile,BufReadPost *.[ch] source /home/mutt/fold-vim/fold/neomutt_fold.vim
autocmd BufNewFile,BufReadPost *.[ch] source /home/mutt/vim/conceal.vim
autocmd BufNewFile,BufReadPost *.imp  set syn=python

" syn match cyan   "\v<(Context|ctx)>"
" syn match red    "\v<(Context|ctx)-\>mailbox->\i+>"
" syn match yellow "\v<(Context|ctx)-\>(mailbox)\@!\i+>"
" hi cyan   guibg=#008080 guifg=NONE
" hi red    guibg=#800000 guifg=NONE
" hi yellow guibg=#808000 guifg=NONE

" autocmd BufReadPost *.[ch] call library#Highlight('/home/mutt/work/all-globals.txt', 'guibg=#282828 guifg=#8040ff', 'neo_global_vars')
" autocmd BufReadPost *.[ch] call library#Highlight('/home/mutt/work/all-config.txt',  'guibg=#282828 guifg=#ff2020', 'neo_config_vars')

" autocmd BufReadPost *.[ch] call library#Highlight('/home/mutt/work/path-files/neo-command.txt', 'guibg=#404040 guifg=#20ff20', 'neo_command')
" autocmd BufReadPost *.[ch] call library#Highlight('/home/mutt/work/path-files/neo-path.txt',    'guibg=#404040 guifg=#20ffff', 'neo_path')
" autocmd BufReadPost *.[ch] call library#Highlight('/home/mutt/work/path-files/neo-url.txt',     'guibg=#404040 guifg=#ffff00', 'neo_url')

" autocmd BufReadPost \d\d\d call library#Highlight('/home/mutt/work/all-globals.txt',   'guibg=#282828 guifg=#ff8040', 'neo_global')
" autocmd BufReadPost \d\d\d call library#Highlight('/home/mutt/work/all-config.txt',    'guibg=#282828 guifg=#ff2020', 'neo_config')
" autocmd BufReadPost \d\d\d call library#Highlight('/home/mutt/work/all-functions.txt', 'guibg=#282828 guifg=#20ff20', 'neo_function')
" autocmd BufReadPost \d\d\d call library#Highlight('/home/mutt/work/all-source.txt',    'guibg=#282828 guifg=#20ffff', 'neo_source')
" set iskeyword+=.

cabbrev Se  set
cabbrev Set set
cabbrev Ta  tag
cabbrev te  tabedit
cabbrev Tag tag
cabbrev ren Rename
cabbrev gd  Gdiff
cabbrev Gd  Gdiff
cabbrev Gdelete  Gdiff
cabbrev Vs  vsplit

" autocmd BufNewFile,BufReadPost ~/.muttrc setl filetype=neomuttrc
autocmd FileType muttrc setl filetype=neomuttrc

" autocmd BufReadPost * set syn=mail
