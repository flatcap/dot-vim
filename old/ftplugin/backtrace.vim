function! BT_Tidy()
	let &filetype='backtrace'
	execute 'silent %s/0x.* in //ge'
	execute 'silent %s/(.*)/(...)/ge'
	execute 'silent update'
endfunction

