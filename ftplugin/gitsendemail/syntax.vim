finish

syn region diffFoldFileHeader
	\ start=/^diff\>/
	\ end=/^+++ .*/
	\ fold transparent contains=ALL containedin=diffFoldFile keepend

syn region diffFoldFileHeader2
	\ start=/^diff\>/
	\ end=/^+++ .*/
	\ fold transparent contains=ALL containedin=diffFoldFile keepend

syn region diffFoldFile
	\ start=/^diff\>/
	\ skip=/^[-+i@ ]/
	\ end=/^.*/me=s-1,he=s-1,re=s-1
	\ fold transparent contains=ALL keepend

syn region diffFoldFileFragment
	\ start=/^[*@0-9]/
	\ end=/^[*@0-9]/me=s-1,he=s-1,re=s-1
	\ fold transparent contains=ALL containedin=diffFoldFile keepend

syn region diffFoldMail
	\ start=/^From /
	\ end=/^diff/me=s-1,he=s-1,re=s-1
	\ fold transparent contains=ALL

syn region diffFoldMail2
	\ start=/^From /
	\ end=/^diff/me=s-1,he=s-1,re=s-1
	\ fold transparent contains=ALL

syn region diffFoldMail3
	\ start=/^From /
	\ end=/^diff/me=s-1,he=s-1,re=s-1
	\ fold transparent contains=ALL

setlocal foldmethod=syntax
setlocal foldlevel=3
setlocal foldcolumn=4
syn sync fromstart

let b:current_syntax = "gitsendemail"

" runtime! syntax/mail.vim
" unlet! b:current_syntax
" runtime! syntax/diff.vim
