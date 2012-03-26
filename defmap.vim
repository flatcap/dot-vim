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
nmap <silent> <leader>m :silent! update<Bar>make<CR>
nmap <silent> <leader>t :silent! edit docs/todo.txt<CR>G

" Case-sensitive for tag searching
"noremap <silent> <C-]> :let ic_save=&ic<CR>:set noic<CR><C-]>:let &ic=ic_save<CR>zO
noremap <silent> <C-]> :let ic_save=&ic<CR>:set noic<CR><C-]>:let &ic=ic_save<CR>

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
nmap           <S-F5>	:vnew<CR>:set buftype=nofile<CR>
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
map [1;5B 
map [1;5A 
