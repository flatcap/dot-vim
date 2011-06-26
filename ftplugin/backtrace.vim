if exists("did_load_backtrace")
	finish
endif
let did_load_backtrace = 1 

function! BT_Tidy()
	let &filetype='backtrace'
	execute 'silent %s/0x.* in //ge'
	execute 'silent %s/(.*)/(...)/ge'
	execute 'silent update'
endfunction

