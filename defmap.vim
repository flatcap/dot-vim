" Default key mappings

" Command mode
cmap <C-A> <Home>
cmap <C-B> <S-Left>
cmap <C-F> <S-Right>

" Quit, now
nmap <silent> Q :call quitter#SaveAndClose()<CR>

" Double-click to open/close folds
map <2-LeftMouse> za

" Find common items
nmap <silent> <leader>h :silent! call swapfile#SwapFile()<CR>
nmap <silent> <leader>H :silent! vsplit<Bar>call swapfile#SwapFile()<CR>
nmap <silent> <leader>l :CommandTBuffer<CR>

nmap <silent> <leader>vv :vert split<CR>
nmap <silent> <leader>vt :tabedit %<CR>
nmap <silent> <leader>vn :vert split<Bar>:next<CR>
nmap <silent> <leader>vl :vert split .vimlocal<CR>

nmap <silent> <F1>      :let &conceallevel=2-&conceallevel<CR>
nmap <silent> <F3>      :let &laststatus = (&laststatus+1)%3<CR>:set laststatus?<CR>
nmap          <F5>      <Plug>KeywordToggle
nmap          <F6>      zmzv
nmap          <F7>      zr
nmap <silent> <F8>      :GundoToggle<CR>
nmap <silent> <F9>      <Plug>SaveNextFile

" nmap <silent> <F5> :cclose<CR>

" Shift-F1-F4 are a bit wonky
" S-F5: create some temp space
nmap          <Esc>[1;2Q	:set paste!<Bar>:set paste?<CR>
nnoremap      <Esc>[1;2R	:set ruler!<CR><C-L>
nmap <silent> <S-F5>		<Plug>ScratchTab
" nmap          <S-F6>		:tabs<CR>
" nmap          <S-F7>		:tabclose<CR>
" nmap          <S-F8>		:tabnew<Space>
nmap          <S-F9>            :let @k = KeywordExport()<CR>

" C-Up/Down Scroll Window
nmap <Esc>[1;5A <C-Y>
nmap <Esc>[1;5B <C-E>
imap <Esc>[1;5A <C-O><C-Y>
imap <Esc>[1;5B <C-O><C-E>

" Shift-Up/Down Scroll Window
nmap <Esc>[1;2A <C-Y>
nmap <Esc>[1;2B <C-E>
vmap <Esc>[1;2A <C-Y>
vmap <Esc>[1;2B <C-E>
imap <Esc>[1;2A <C-O><C-Y>
imap <Esc>[1;2B <C-O><C-E>

" Previous/Next match for command
cmap <C-P> <Up>
cmap <C-N> <Down>

" Make horizontal scrolling easier
nmap <silent> <C-Left>  8zh
nmap <silent> <C-Right> 8zl

" Alright... let's try this out
imap kj <esc>
cmap kj <esc>

" Only mapping
nmap <silent> <Leader>o :only<CR>:set laststatus=1<CR>
nmap <silent> <Leader>O :only<CR>:tabonly<CR>:set laststatus=1 showtabline=1<CR>

" Update diff markings
nmap <Leader>u :diffupdate<CR>

" Make the current file executable (:edit ensures syntax highlighting)
nmap <leader>x :update<cr>:!chmod +x %<cr>:edit<cr>

source ~/.vim/defmap_file.vim

" Select all
"nmap <C-A> ggVG

cmap <C-@> (.*)

" Misc
map <silent> <leader>t :S/{true,false}/{false,true}/w<CR>
map <silent> <leader>jt :%!json_reformat<BAR>unexpand -t4 --first-only<CR>
map <silent> <leader>jm :%!json_reformat -m<CR>
map <silent> <leader>xt :%!tidy -quiet -xml<CR>

" For wrapped lines make navigation work as expected
noremap <silent> k gk
noremap <silent> j gj
" noremap <silent> 0 g0
" noremap <silent> $ g$

" Pressing ^L will clear highlighting
nnoremap <silent> <C-l> :set nohlsearch nocursorline nocursorcolumn nolist<CR><C-l>
imap <C-l> :set nohlsearch nocursorline nocursorcolumn<CR>

map <down> <nop>
map <left> <nop>
map <right> <nop>
map <up> <nop>

" Faster viewport scrolling (3 lines at a time)
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
vnoremap <C-e> 3<C-e>
vnoremap <C-y> 3<C-y>

" Make `Y` work from the cursor to the end of line (which is more logical)
nnoremap Y y$

nnoremap <leader>ts2 :set tabstop=2 shiftwidth=2 noexpandtab<CR>
nnoremap <leader>ts4 :set tabstop=4 shiftwidth=4 noexpandtab<CR>
nnoremap <leader>ts8 :set tabstop=8 shiftwidth=8 noexpandtab<CR>

" repeat last substitute (including the flags)
nnoremap & :&&<CR>
vnoremap & :&&<CR>

" Alt-{hjkl} navigate between windows
nnoremap h h
nnoremap j j
nnoremap k k
nnoremap l l

" Alt-{HJKL} navigate between tabs
nnoremap H :tabNext<cr>
nnoremap J :tablast<cr>
nnoremap K :tabfirst<cr>
nnoremap L :tabnext<cr>

" Break the undo chain after Ctrl-W, Ctrl-U, or Enter
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>
inoremap <CR>  <C-g>u<CR>

" Open help in a new tab
cnoremap <expr> h<space> ((getcmdtype() == ':') && (getcmdpos() == 1)) ? 'tab help ' : 'h '

