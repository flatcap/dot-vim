set syntax=dosini

source ~/.vim/fold/dosini.vim

syntax match	dosiniComment '%.*'
syntax match	dosiniComment '#.*'
syntax region	dosiniString start=+"+ skip=+\\\\\|\\"+ end=+"+ oneline
syntax region	dosiniString start=+'+ skip=+\\\\\|\\'+ end=+'+ oneline

highlight dosiniString	ctermfg=DarkYellow
highlight dosiniLabel   ctermfg=DarkCyan
highlight dosiniHeader  ctermfg=DarkRed
highlight dosiniComment ctermfg=DarkGreen
