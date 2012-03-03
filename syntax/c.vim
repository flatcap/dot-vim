source ~/.vim/fold/c.vim

set noexpandtab
set path=.,/home/flatcap/gt/src,/home/flatcap/vte/src,/usr/include,/usr/include/linux,/usr/include/atk-1.0,/usr/include/cairo,/usr/include/dbus-1.0,/usr/include/freetype2,/usr/include/gconf/2,/usr/include/glib-2.0,/usr/include/gtk-2.0,/usr/include/libpng12,/usr/include/orbit-2.0,/usr/include/pango-1.0,/usr/include/pixman-1,/usr/include/startup-notification-1.0,/usr/lib64/glib-2.0/include

set cindent
"set cinoptions={.5s,:.5s,+.5s,t0,g0,^-2,e-2,n-2,p2s,(0,=.5s
"set cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1
"set cinoptions=>4,{1s,n-2,}0,t0,^-2
set shiftwidth=8
set tabstop=8 

highlight cBitField          ctermfg=none
highlight cBracket           ctermfg=none
highlight cCharacter         ctermfg=DarkYellow
highlight cComment           ctermfg=DarkGreen
highlight cComment2String    ctermfg=DarkGreen
highlight cCommentError      ctermfg=Red
highlight cCommentL          ctermfg=DarkGreen
highlight cCommentSkip       ctermfg=DarkGreen
highlight cCommentStart      ctermfg=DarkGreen
highlight cCommentStartError ctermfg=Red
highlight cCommentString     ctermfg=DarkGreen
highlight cConditional       ctermfg=DarkCyan
highlight cConstant          ctermfg=DarkCyan
highlight cDefine            ctermfg=DarkCyan
highlight cErrInBracket      ctermfg=none
highlight cErrInParen        ctermfg=none
highlight cError             ctermfg=none
highlight cFloat             ctermfg=none
highlight cFormat            ctermfg=DarkYellow
highlight cInclude           ctermfg=DarkCyan
highlight cIncluded          ctermfg=DarkYellow
highlight cLabel             ctermfg=DarkCyan
highlight cMulti             ctermfg=none
highlight cNumber            ctermfg=none
highlight cNumbers           ctermfg=none
highlight cNumbersCom        ctermfg=none
highlight cOctal             ctermfg=none
highlight cOctalError        ctermfg=Red
highlight cOctalZero         ctermfg=none
highlight cOperator          ctermfg=DarkCyan
highlight cParen             ctermfg=none
highlight cParenError        ctermfg=Red
highlight cPreCondit         ctermfg=DarkCyan
highlight cPreProc           ctermfg=DarkCyan
highlight cRepeat            ctermfg=DarkCyan
highlight cSpaceError        ctermbg=18
highlight cSpecial           ctermfg=DarkYellow
highlight cSpecialCharacter  ctermfg=DarkYellow
highlight cSpecialError      ctermfg=none
highlight cStatement         ctermfg=DarkCyan
highlight cStorageClass      ctermfg=DarkCyan
highlight cString            ctermfg=DarkYellow
highlight cStructure         ctermfg=DarkCyan
highlight cTodo              ctermfg=DarkGreen cterm=reverse
highlight cType              ctermfg=DarkCyan
highlight cUserCont          ctermfg=none
highlight cUserLabel         ctermfg=DarkCyan

highlight cCppBracket        ctermfg=none
highlight cCppOut            ctermfg=DarkGreen
highlight cCppOut2           ctermfg=DarkGreen
highlight cCppParen          ctermfg=none
highlight cCppSkip           ctermfg=DarkGreen
highlight cCppString         ctermfg=DarkYellow
highlight cppBoolean         ctermfg=DarkCyan
highlight cppClassDecl       ctermfg=DarkCyan
highlight cppClassPreDecl    ctermfg=DarkCyan
highlight cppExceptions      ctermfg=DarkCyan
highlight cppMethod          ctermfg=DarkCyan
highlight cppNumber          ctermfg=none
highlight cppScopeDecl       ctermfg=DarkCyan
highlight cppStatement       ctermfg=DarkCyan
highlight cppStorageClass    ctermfg=DarkCyan
highlight cppType            ctermfg=DarkCyan

syntax match attrpack "__attribute__((__packed__))"
highlight attrpack ctermfg=darkgrey

syntax keyword extras uchar_t u8 u16 u32 u64 s8 s16 s32 s64
highlight      extras ctermfg=DarkCyan

syntax match rar "// *RAR.*"
highlight rar ctermfg=207
