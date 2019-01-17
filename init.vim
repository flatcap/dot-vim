runtime globals.vim
runtime plugin.vim

" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc

" Auto-jump to the last-used position
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal! g'\"" |
\ endif

source ~/.config/nvim/vimrc

" DOT
" au BufNewFile,BufRead *.gv	setf dot

"autocmd CmdUndefined CheckHealth checkhealth
"works for capitalised words
