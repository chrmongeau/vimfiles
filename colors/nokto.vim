" Vim color file
" Maintainer:Christian A. Mongeau Ospina <EMAIL>
" Bram Moolenaar <Bram@vim.org>
" Last Change:	2009 Jun 18

" The starting point was the "evening" colorscheme by Bram Moolenar

" First remove all existing highlighting.
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "nokto"

hi Comment						ctermbg=Blue		ctermfg=LightCyan					guibg=Blue	guifg=LightCyan
hi Error		term=standout	ctermbg=DarkRed		ctermfg=White						guibg=Red		guifg=White
hi ErrorMsg		term=standout	ctermbg=DarkRed		ctermfg=White						guibg=Red		guifg=White
hi Identifier	term=reverse						ctermfg=LightBlue									guifg=LightBlue
hi IncSearch	term=reverse	ctermbg=Black		ctermfg=White
hi LineNr		term=underline						ctermfg=DarkGrey									guifg=DarkGray
hi Normal						ctermbg=Black		ctermfg=White						guibg=Black		guifg=White
hi NonText		term=bold							ctermfg=LightRed	gui=bold		guibg=grey30	guifg=LightBlue
hi Search		term=reverse	ctermbg=Green		ctermfg=Black						guibg=Green	guifg=Black
hi Special		term=reverse						ctermfg=Yellow										guifg=Yellow
hi Statement	term=reverse						ctermfg=DarkCyan									guifg=LightBlue
hi Constant		term=reverse						ctermfg=Blue										guifg=SlateBlue
hi Todo			term=reverse	ctermbg=White		ctermfg=Black						guibg=Yellow	guifg=Red
hi Visual		term=reverse	ctermbg=Black		ctermfg=White						guibg=grey60
hi WildMenu		term=standout	ctermbg=Blue		ctermfg=White						guibg=Yellow	guifg=Black
hi ColorColumn					ctermbg=DarkGrey										guibg=grey10


" ???
if &t_Co > 8
  "hi Statement	term=bold	cterm=bold	ctermfg=Yellow	guifg=#ffff60	gui=bold
endif

" Groups used in the 'highlight' and 'guicursor' options default value.
"hi Cursor	guibg=Green	guifg=Black
"hi CursorColumn	term=reverse	ctermbg=Black	guibg=grey40
"hi CursorLine	term=underline	cterm=underline	guibg=grey40
"hi DiffAdd	term=bold	ctermbg=DarkBlue	guibg=DarkBlue
"hi DiffChange	term=bold	ctermbg=DarkMagenta	guibg=DarkMagenta
"hi DiffDelete	term=bold	ctermfg=Blue	ctermbg=DarkCyan	gui=bold	guifg=Blue	guibg=DarkCyan
"hi DiffText	term=reverse	cterm=bold	ctermbg=Red	gui=bold	guibg=Red
"hi Folded	term=standout	ctermbg=LightGrey	ctermfg=DarkBlue	guibg=LightGrey	guifg=DarkBlue
"hi FoldColumn	term=standout	ctermbg=LightGrey	ctermfg=DarkBlue	guibg=Grey	guifg=DarkBlue
"hi lCursor	guibg=Cyan	guifg=Black
"hi ModeMsg	term=bold	cterm=bold	gui=bold
"hi StatusLine	term=reverse,bold	cterm=reverse,bold	gui=reverse,bold
"hi StatusLineNC	term=reverse	cterm=reverse	gui=reverse
"hi VertSplit	term=reverse	cterm=reverse	gui=reverse
"hi VisualNOS	term=underline,bold	cterm=underline,bold	gui=underline,bold
"hi Directory	term=bold	ctermfg=LightCyan	guifg=Cyan
"hi MoreMsg	term=bold	ctermfg=LightGreen	gui=bold	guifg=SeaGreen
"hi Question	term=standout	ctermfg=LightGreen	gui=bold	guifg=Green
"hi SpecialKey	term=bold	ctermfg=LightBlue	guifg=Cyan
"hi Title	term=bold	ctermfg=LightMagenta	gui=bold	guifg=Magenta
"hi WarningMsg	term=standout	ctermfg=LightRed	guifg=Red

" Groups for syntax highlighting
"hi Constant	term=underline	ctermfg=Magenta	guifg=#ffa0a0	guibg=grey5
"hi Ignore	ctermfg=DarkGrey	guifg=grey20
"hi Special	term=bold	ctermfg=LightRed	guifg=Orange	guibg=grey5

" vim: sw=4 ts=4
