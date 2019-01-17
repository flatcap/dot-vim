set syntax=dosini

source ~/.vim/fold/dosini.vim

syntax match	dosiniComment '%.*'
syntax match	dosiniComment '#.*'
syntax region	dosiniString start=+"+ skip=+\\\\\|\\"+ end=+"+ oneline
syntax region	dosiniString start=+'+ skip=+\\\\\|\\'+ end=+'+ oneline

highlight dosiniString	ctermfg=DarkYellow guifg=DarkYellow
highlight dosiniLabel   ctermfg=DarkCyan   guifg=DarkCyan
highlight dosiniHeader  ctermfg=DarkRed    guifg=DarkRed
highlight dosiniComment ctermfg=DarkGreen  guifg=DarkGreen
