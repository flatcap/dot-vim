" let g:ft_ignore_pat = '\.\(Z\|gz\|bz2\|zip\|tgz\)$'

" let g:flatcap = 'hello'
" set mouse=a

" let g:comfortable_motion_scroll_down_key = "j"
" let g:comfortable_motion_scroll_up_key = "k"

let g:Tlist_Use_Right_Window=1

let g:Tlist_Compact_Format=1
let g:Tlist_Enable_Fold_Column=0
let g:Tlist_Ctags_Cmd='ctags -I UNUSED'

let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#whitespace#checks = [ 'trailing' ]
let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'

function! AirlineInit()
  let g:airline_section_a = ''
  " Turn off git branch
  let g:airline_section_b = ''
  let g:airline_section_x = airline#section#create(['tagbar'])
  let g:airline_section_y = ''
endfunction
autocmd User AirlineAfterInit call AirlineInit()

let g:airline_mode_map = {
    \ '__' : '-',
    \ 'c'  : 'C',
    \ 'i'  : 'I',
    \ 'ic' : 'I',
    \ 'ix' : 'I',
    \ 'n'  : 'N',
    \ 'ni' : 'N',
    \ 'no' : 'N',
    \ 'R'  : 'R',
    \ 'Rv' : 'R',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ 't'  : 'T',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ }

let g:signify_disable_by_default = 1

let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:UltiSnipsSnippetDirectories=['snips']

let g:zipPlugin_ext = '*.zip,*.jar,*.xpi,*.ja,*.war,*.ear,*.celzip,*.oxt,*.kmz,*.wsz,*.xap,*.docx,*.docm,*.dotx,*.dotm,*.potx,*.potm,*.ppsx,*.ppsm,*.pptx,*.pptm,*.ppam,*.sldx,*.thmx,*.xlam,*.xlsx,*.xlsm,*.xlsb,*.xltx,*.xltm,*.xlam,*.crtx,*.vdw,*.glox,*.gcsx,*.gqsx,*.ods'

let g:gundo_preview_bottom = 1

let g:netrw_banner=0

let g:Fi_OnlyText = 1
let g:Fi_ShowMenu = 0

let g:delimitMate_expand_cr = 2

let g:commentary_map_backslash = 0

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:deleteto_create_mappings = 1
let g:tabby_create_mappings = 1

let g:tabitha_navigate_windows = 1
let g:tabitha_navigate_tabs    = 0
let g:tabitha_navigate_files   = 1
let g:tabitha_wrap_around      = 1
let g:tabitha_select_window    = 1
let g:tabitha_create_mappings  = 1

let g:keyword_highlight="ctermfg=207 ctermbg=none guifg=#ff5fff guibg=NONE"

let g:mnemosyne_max_macros = 100
let g:mnemosyne_window_size = 40
let g:mnemosyne_macro_file = '~/.config/nvim/macros.vim'

let g:piper_create_mappings = 1
let g:piper_command_list = {
	\ 'a': 'LANG=C ansifilter',
	\ 'c': 'LANG=C column -t -o " "',
	\ 'd': 'LANG=C uniq -d',
	\ 'e': 'LANG=C uniq -c',
	\ 'f': 'LANG=C clang-format -assume-filename=%',
	\ 'l': 'LANG=C nl -nrz -w4',
	\ 'n': 'LANG=C sort -n',
	\ 'r': 'LANG=C rev',
	\ 's': 'LANG=C sort -f',
	\ 't': 'LANG=C tac',
	\ 'u': 'LANG=C uniq',
	\ 'x': 'LANG=C shuf',
	\ 'z': 'LANG=C cat -s',
\ }

"                                  Red,        Orange,    Yellow,    Green,     Cyan,      Blue,      Pink,      Magenta,   White
let g:interestingWordsTermColors = ['196',     '208',     '226',     '46',      '75',      '21',      '207',     '63',      '15']
let g:interestingWordsGUIColors  = ['#ff0000', '#ff8700', '#ffff00', '#00ff00', '#5fafff', '#0000ff', '#ff5fff', '#5f5fff', '#ffffff', 
	\ '#ff0000', '#ff8700', '#ffff00', '#00ff00', '#5fafff', '#0000ff', '#ff5fff', '#5f5fff', '#ffffff' ]

" let g:interestingWordsGUIColors  = [ '#ff0000', '#00ff00', '#ff0000', '#00ff00', '#ff0000', '#00ff00', '#ff0000', '#00ff00', '#ff0000', '#00ff00', '#ff0000', '#00ff00', '#ff0000', '#00ff00', '#ff0000', '#00ff00', '#ff0000', '#00ff00' ]
let g:interestingWordsRandomiseColors = 0

let g:quickhl_manual_colors = [
      \ "guifg=#000000 guibg=#ff0000 gui=bold",
      \ "guifg=#000000 guibg=#ff8700 gui=bold",
      \ "guifg=#000000 guibg=#ffff00 gui=bold",
      \ "guifg=#000000 guibg=#00ff00 gui=bold",
      \ "guifg=#000000 guibg=#5fafff gui=bold",
      \ "guifg=#000000 guibg=#0000ff gui=bold",
      \ "guifg=#000000 guibg=#ff5fff gui=bold",
      \ "guifg=#000000 guibg=#5f5fff gui=bold",
      \ "guifg=#000000 guibg=#ffffff gui=bold",
      \ "guifg=#ff0000 guibg=#000000 gui=bold,undercurl",
      \ "guifg=#ff8700 guibg=#000000 gui=bold,undercurl",
      \ "guifg=#ffff00 guibg=#000000 gui=bold,undercurl",
      \ "guifg=#00ff00 guibg=#000000 gui=bold,undercurl",
      \ "guifg=#5fafff guibg=#000000 gui=bold,undercurl",
      \ "guifg=#0000ff guibg=#000000 gui=bold,undercurl",
      \ "guifg=#ff5fff guibg=#000000 gui=bold,undercurl",
      \ "guifg=#5f5fff guibg=#000000 gui=bold,undercurl",
      \ "guifg=#ffffff guibg=#000000 gui=bold,undercurl",
      \ ]

let g:rainbow_active = 1

    let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['196', '208', '226', '46', '75', '21', '207', '63', '15'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}

let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

let g:autosave_extensions = '.backup'
let g:autosave_backup     = '~/.cache/vim/backup'
let g:autosave_timer      = 60

let g:highlightedyank_highlight_duration = 4000
let g:highlightedyank_max_lines = 100

let g:neolog_default_colors = 1

let g:clang_close_preview = 1
let g:clang_jumpto_declaration_key = "<nop>"
let g:clang_jumpto_back_key = "<nop>"

let g:gutentags_ctags_exclude = [ 'autosetup/*', 'contrib/*', 'doxygen/*', 'test/*', 'doc/*', 'pgp*.c' ]

" let g:ackprg='ag --nogroup --nocolor --column'
let g:ackprg='ag --nogroup --nocolor --column -G ".*\.[ch]" --ignore test --ignore doc --ignore autosetup'
let g:ack_apply_qmappings=1
" let g:ack_autoclose=1
let g:ack_qhandler="vert botright copen 60"
" let g:ack_qhandler="botright copen 7"
" let g:ackpreview=1
" let g:ackhighlight=1

let g:committia_min_window_width = 140
