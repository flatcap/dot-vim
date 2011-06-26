" Quickfix window

syntax match qf_string  "‘[^’]\+’"
syntax match qf_warning "warning:"
syntax match qf_error   "error:"

highlight qf_string  ctermfg=35     ctermbg=none
highlight qf_warning ctermfg=yellow ctermbg=none
highlight qf_error   ctermfg=red    ctermbg=none
