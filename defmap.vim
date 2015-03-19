" Default key mappings

" Command mode
cmap <C-A> <Home>
cmap <C-B> <S-Left>
cmap <C-F> <S-Right>

" Tab between windows
nmap <silent> <Tab>   :call tab#TabSkip(1)<CR>
nmap <silent> <S-Tab> :call tab#TabSkip(0)<CR>

" Quit, now
nmap <silent> Q :call quit#SaveAndClose()<CR>

" Double-click to open/close folds
map <2-LeftMouse> za

" Find common items
nmap <silent> <leader>h :silent! call swapfile#SwapFile()<CR>
nmap <silent> <leader>H :silent! vsplit<Bar>call swapfile#SwapFile()<CR>
nmap <silent> <leader>m :call make#RichMake()<CR>
nmap <silent> <leader>l :CommandTBuffer<CR>

nmap <silent> <leader>vv :vert split<CR>
nmap <silent> <leader>vt :tabedit %<CR>
nmap <silent> <leader>vn :vert split<Bar>:next<CR>
nmap <silent> <leader>vl :vert split .vimlocal<CR>

nmap <silent> <leader>fc :silent! call function#CommentBlock()<CR>
nmap <silent> <leader>ff :silent! source ~/.vim/fold/c.vim<CR>

" open tag in new window
nnoremap <C-W>] :vsplit<CR><C-]>zv

nmap <silent> <F1>      :let &conceallevel=2-&conceallevel<CR>
nmap <silent> <F2>      :wall<CR>:make .obj/%:r.o<CR>
nmap <silent> <F3>      :let &laststatus = 2-&laststatus<CR>
nmap          <F4>      :call tagsrotate#TagsRotate()<CR>
nmap          <F5>      <Plug>Keyword_Toggle
nmap          <F6>      zmzv
nmap          <F7>      zr
nmap <silent> <F8>      :GundoToggle<CR>
nmap <silent> <F9>      <Plug>SaveNextFile
nmap <silent> <F10>     :cnext<CR>zvzz
nmap <silent> <F11>     :cc<CR>zvzz
nmap <silent> <F12>     :cwindow 5<CR>

" nmap <silent> <F5> :cclose<CR>

let g:keyword_highlight="ctermfg=207 ctermbg=none"

" Shift-F1-F4 are a bit wonky
" S-F5: create some temp space
nmap          <Esc>O1;2Q	:set paste!<Bar>:set paste?<CR>
nmap          <Esc>O1;2R	:set ruler!<CR><C-L>
nmap <silent> <S-F5>		:vnew<CR>:set buftype=nofile bufhidden=delete<CR>:setlocal noswapfile<CR>
nmap          <S-F6>		:tabs<CR>
nmap          <S-F7>		:tabclose<CR>
nmap          <S-F8>		:tabnew<Space>

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
nmap <silent> <Leader>O :only<CR>:tabonly<CR>:set laststatus=1<CR>

" Update diff markings
nmap <Leader>u :diffupdate<CR>

" Make the current file executable (:edit ensures syntax highlighting)
nmap <leader>x :update<cr>:!chmod +x %<cr>:edit<cr>

" #ifdef 0
vmap <leader>0 :call ifzero#Ifdef()<CR>
vmap <leader>r :call ifzero#Ifdef('RAR')<CR>

source ~/.vim/defmap_file.vim

" Select all
"nmap <C-A> ggVG

cmap @ (.*)
nmap <silent> gcr :set commentstring=//RAR%s<cr><Plug>CommentaryLine:set commentstring=//%s<CR>

" Misc
map <silent> <leader>t :S/{true,false}/{false,true}/w<CR>
map <silent> <leader>jt :%!json_reformat<BAR>unexpand -t4 --first-only<CR>
map <silent> <leader>jm :%!json_reformat -m<CR>
map <silent> <leader>xt :%!tidy -quiet -xml<CR>

