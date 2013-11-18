" Copyright 2012 Richard Russon (flatcap)
"
" Create a C function comment

function! s:get_function_name()
	return substitute (getline ('.'), '^.*\%(\s\+\|::\)\(\~\=\w\+\) *(.*', '\1', '')
endfunction

function! s:copyright_exists()
	let cursor_pos = getpos ('.')
	call cursor (1, 1)
	let m = search ('\<copyright\>', 'cnW', 20)
	call setpos ('.', cursor_pos)
	return m
endfunction

function! s:get_include_name()
	let file = substitute (@%, '\%(.*/\)*\([^\.]\+\).h', '\1', '')
	let file = '_' . toupper (file) . '_H_'
	return file
endfunction

function! s:find_blank()
	let cursor_pos = getpos ('.')
	call cursor (1, 1)
	let m = search ('^$', 'cnW', 50)
	call setpos ('.', cursor_pos)
	return m
endfunction


function! function#CommentBlock()
	let f = s:get_function_name()

	let @" =  "/**\n" .
		\ " * " . f . "\n" .
		\ " */\n"

	execute 'normal ""P3j'
endfunction

function! function#CopyrightBlock()
	if (s:copyright_exists())
		return
	endif
	let name = 'Richard Russon (FlatCap)'
	let year = strftime('%Y')
	let @" =  "/* Copyright (c) " . year . " " . name . "\n" .
		\ " *\n" .
		\ " * This program is free software; you can redistribute it and/or modify it under\n" .
		\ " * the terms of the GNU General Public License as published by the Free Software\n" .
		\ " * Foundation; either version 2 of the License, or (at your option) any later\n" .
		\ " * version.\n" .
		\ " *\n" .
		\ " * This program is distributed in the hope that it will be useful, but WITHOUT\n" .
		\ " * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS\n" .
		\ " * FOR A PARTICULAR PURPOSE.  See the GNU Library General Public License for\n" .
		\ " * more details.\n" .
		\ " *\n" .
		\ " * You should have received a copy of the GNU General Public License along with\n" .
		\ " * this program; if not, write to the Free Software Foundation, Inc., 59 Temple\n" .
		\ " * Place - Suite 330, Boston, MA 02111-1307, USA.\n" .
		\ " */\n\n"

	execute 'normal gg""PV16jzf``'
endfunction

function! function#IncludeGuard()
	let cursor_pos = getpos ('.')

	if (s:copyright_exists())
		let insert = s:find_blank()+1
	else
		let insert = 1
	endif

	let incname = s:get_include_name()
	let @" =  "#ifndef " . incname . "\n" .
		\ "#define " . incname . "\n\n"

	call cursor (insert, 1)
	execute 'normal ""P'

	let @" = "#endif // " . incname . "\n\n"

	if (!empty (getline ('$')))
		let @" = "\n" . @"
	endif

	execute 'normal G""p'
	
	let cursor_pos[1] += 3
	call setpos ('.', cursor_pos)
endfunction

