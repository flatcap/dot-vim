let g:Tlist_Use_Right_Window=1
let g:Tlist_Compact_Format=1
let g:Tlist_Enable_Fold_Column=0
let g:Tlist_Ctags_Cmd='ctags -I UNUSED'

let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_min_count = 1
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#whitespace#checks = [ 'trailing' ]
let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'

" Turn off git branch
let g:airline_section_b = ''

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
let g:tabitha_navigate_tabs    = 1
let g:tabitha_navigate_files   = 1
let g:tabitha_wrap_around      = 1
let g:tabitha_select_window    = 1
let g:tabitha_create_mappings  = 1

let g:keyword_highlight="ctermfg=207 ctermbg=none"

let g:mnemosyne_max_macros = 100
let g:mnemosyne_window_size = 40

let g:piper_create_mappings = 1
let g:piper_command_list = {
	\ 'c': 'LANG=C column -t -o " "',
	\ 'd': 'LANG=C uniq -d',
	\ 'e': 'LANG=C uniq -c',
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
let g:interestingWordsGuiColors  = ['#ff0000', '#ff8700', '#ffff00', '#00ff00', '#5fafff', '#0000ff', '#ff5fff', '#5f5fff', '#ffffff']
