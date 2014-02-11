" Copyright 2012-2014 Richard Russon (flatcap)
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
		\ " * This file is part of DParted.\n" .
		\ " *\n" .
		\ " * DParted is free software: you can redistribute it and/or modify\n" .
		\ " * it under the terms of the GNU General Public License as published by\n" .
		\ " * the Free Software Foundation, either version 3 of the License, or\n" .
		\ " * (at your option) any later version.\n" .
		\ " *\n" .
		\ " * DParted is distributed in the hope that it will be useful,\n" .
		\ " * but WITHOUT ANY WARRANTY; without even the implied warranty of\n" .
		\ " * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n" .
		\ " * GNU General Public License for more details.\n" .
		\ " *\n" .
		\ " * You should have received a copy of the GNU General Public License\n" .
		\ " * along with DParted.  If not, see <http://www.gnu.org/licenses/>.\n" .
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

