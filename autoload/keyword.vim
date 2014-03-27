" Copyright 2010-2012 Richard Russon (flatcap)
" Keyword highlighter

let s:key_list   = []
let s:key_init   = 0
let s:key_group  = 'key_group'
let s:key_colour = 'ctermbg=blue'

function! s:Keyword_Clear()
	if (s:key_init == 1)
		execute 'syntax clear ' s:key_group
	endif
endfunction

function! s:Keyword_Highlight()
	call s:Keyword_Clear()
	for item in s:key_list
		execute 'syntax keyword ' s:key_group item ' containedin=ALL'
	endfor
	if (!empty (s:key_list))
		let s:key_init = 1
	endif
	execute 'highlight ' s:key_group s:key_colour
endfunction

function! s:Keyword_Add(name)
	let i = index(s:key_list, a:name)
	if (i < 0)
		call add (s:key_list, a:name)
	endif
	call s:Keyword_Highlight()
endfunction

function! s:Keyword_Remove(name)
	let i = index(s:key_list, a:name)
	if (i >= 0)
		unlet s:key_list[i]
		if (@/ == a:name)
			let @/ = ""
		endif
	endif
	call s:Keyword_Highlight()
endfunction

function! s:Keyword_Toggle(name)
	let i = index(s:key_list, a:name)
	if (i < 0)
		call s:Keyword_Add(a:name)
		let @/=a:name
	else
		call s:Keyword_Remove(a:name)
	endif
endfunction

call s:Keyword_Clear()

nnoremap <silent> <script> <plug>Keyword_Toggle	:call <SID>Keyword_Toggle("<C-R><C-W>")<CR>

