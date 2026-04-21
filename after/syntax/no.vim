" CHANGED \w FOR \s !!!!!!!!!!!!!!!!!!!
"
" Head1 matches a non-white-space char at the beginning of the line:
syn match Head1 "^\S.*$"

" Head2 matches a line that begins with 1 tab followed by a 'word' character
" and ends with a 'newline' followed by 2 tabs (ok, actually this matches 2 or
" more lines, but the 'oneline' at the end is meant to match only one-line!),
" then 'ms' and 'me' select the appropriate beginning/ending (same thing for
" Head3 and Head4, but with a +1 for every number):
" NOTA: PUSE \a PARA QUE LAS LISTAS NO PAREZCAN TITULOS, PERO SE DEBERà DE
" CAMBIAR PORQUE EL INDENT INICIAL DEL TEXTO EN LA LISTA *NO ESTà BIEN*
syn region Head2 start="^\t\{1}\a"ms=s+1 end="$\n\t\{2}"me=e-2 oneline
syn region Head3 start="^\t\{2}\a"ms=s+2 end="$\n\t\{3}"me=e-3 oneline
syn region Head4 start="^\t\{3}\a"ms=s+3 end="$\n\t\{4}"me=e-4 oneline

syn match Emph1 "\s\*\S\_.\{-}\S\*" contains=Marks
syn match Emph2 "\s_\S\_.\{-}\S_" contains=Marks
syn match MyTag "\s|\S\_.\{-}\S|" contains=Marks
syn match MyLink "\s{\S\_.\{-}\S}" contains=Marks

syn match IsLink "\[\[.\{-}\]\]" contains=LinkMarks

" The actual colours (designed for dark backgrounds):
hi Head1		term=bold	cterm=bold	ctermfg=Yellow		guifg=#d7d75f	gui=bold
hi Head2		term=bold	cterm=bold	ctermfg=Red			guifg=#ff5f5f	gui=bold
hi Head3		term=bold	cterm=bold	ctermfg=Cyan		guifg=#5fd7d7	gui=bold
hi Head4		term=bold	cterm=bold	ctermfg=Green		guifg=#5fd75f	gui=bold
hi Emph1		term=bold	cterm=bold	ctermfg=White		guifg=#e8e8e8	gui=bold
hi Emph2		term=underline	cterm=underline	ctermfg=White	guifg=#e8e8e8	gui=underline
hi IsLink		term=underline	cterm=underline	ctermfg=Magenta	guifg=#d75fd7	gui=underline
hi MyTag		term=bold	ctermfg=LightGreen				guifg=#87d787
hi MyLink		term=underline	cterm=underline	ctermfg=LightBlue	guifg=#87afff	gui=underline

" help.vim:
syn match Marks contained "\s\?\(\*\|_\||\|{\|}\)"
hi def link Marks Ignore
syn match LinkMarks contained "\(\[\|\]\)"
hi def link LinkMarks Ignore

"highlight Folded ctermfg=DarkGreen ctermbg=LightCyan
" vim: ts=4
