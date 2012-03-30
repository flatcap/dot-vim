" Default key mappings

" Command mode
cmap <C-A> <Home>
cmap <C-B> <S-Left>
cmap <C-F> <S-Right>

" Tab between windows
map <Tab> 

" Quit, now
nmap <silent> Q :update<BAR>quit<CR>

" Double-click to open/close folds
map <2-LeftMouse> za

" Find common items
nmap <silent> <leader>c	:silent! call findme#Constructor()<CR>
nmap <silent> <leader>d	:silent! call findme#Destructor()<CR>
nmap <silent> <leader>i	:silent! call findme#Include()<CR>
nmap <silent> <leader>h :silent! call swapfile#SwapFile()<CR>
nmap <silent> <leader>m :call make#RichMake()<CR>
nmap <silent> <leader>t :silent! tabedit docs/todo.txt<CR>G

nmap <silent> <leader>fc :silent! call function#CommentBlock()<CR>
nmap <silent> <leader>fp :silent! call function#CopyrightBlock()<CR>
nmap <silent> <leader>fi :silent! call function#IncludeGuard()<CR>

" F8 - Switch between .c and .h
nmap           <F1>	:set list!<Bar>:set list?<CR>
nmap           <F2>	:set hlsearch!<Bar>:set hlsearch?<CR>
nmap  <silent> <F3>	:let &laststatus = 2-&laststatus<CR>
nmap           <F4>	:call tagsrotate#TagsRotate()<CR>
nmap           <F5>	:set ignorecase!<Bar>:set ignorecase?<CR>
nmap           <F6>	zmzv
nmap           <F7>	zr
nmap           <F8>	:e %:p:s,.h$,.x,:s,.cpp$,.h,:s,.x$,.cpp,<CR>
nmap           <F9>	:update<CR>:make -s<CR><CR>zvzz
nmap           <F10>	:cnext<CR>zvzz
nmap           <F11>	:cc<CR>zvzz
nmap           <F12>	:cwindow 5<CR>

" Shift-F1-F4 are a bit wonky
" S-F5: create some temp space
nmap <silent>  O1;2P	:set number!<CR>
nmap           O1;2Q	:set paste!<Bar>:set paste?<CR>
nmap           O1;2R	:set ruler!<CR><C-L>
nmap           O1;2S	:set wrap!<Bar>:set wrap?<CR>
nmap           <S-F5>	:vnew<CR>:set buftype=nofile bufhidden=delete<CR>
nmap           <S-F6>	:tabs<CR>
nmap           <S-F7>	:tabclose<CR>
nmap           <S-F8>	:tabnew<Space>
nmap           <S-F9>	:%!sort<CR>
nmap           <S-F10>	:%!uniq<CR>
nmap           <S-F11>	:%!grep<Space>
nmap           <S-F12>	:%!column -t<CR>

" Visual versions of the text manipulations
vmap           <S-F9>	:!sort<CR>
vmap           <S-F10>	:!uniq<CR>
vmap           <S-F11>	:!grep<Space>
vmap           <S-F12>	:!column -t<CR>

" C-Up/Down Scroll Window
nmap [1;5A 
nmap [1;5B 
imap [1;5A 
imap [1;5B 

" Shift-Up/Down Scroll Window
nmap [1;2A 
nmap [1;2B 
imap [1;2A 
imap [1;2B 

