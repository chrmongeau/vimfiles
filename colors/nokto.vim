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

" --- Core syntax groups ---
hi Normal                       ctermbg=Black       ctermfg=White                       guibg=Black     guifg=#e8e8e8
hi Comment                      ctermbg=NONE        ctermfg=243                         guibg=NONE      guifg=#767676
hi Constant     term=NONE                           ctermfg=Red                                         guifg=#ff5f5f
hi String       term=NONE                           ctermfg=Green                                       guifg=#5fd75f
hi Identifier   term=NONE                           ctermfg=Cyan                                        guifg=#5fd7d7
hi Function     term=NONE                           ctermfg=Yellow                                      guifg=#d7d75f
hi Statement    term=NONE                           ctermfg=LightBlue   cterm=bold                      guifg=#87afff     gui=bold
hi Special      term=NONE                           ctermfg=LightRed                                    guifg=#ff8787
hi PreProc      term=NONE                           ctermfg=Magenta                                     guifg=#d75fd7
hi Type         term=NONE                           ctermfg=LightGreen  cterm=NONE                      guifg=#87d787     gui=NONE
hi Error        term=standout   ctermbg=Red         ctermfg=White                       guibg=#d70000   guifg=White
hi ErrorMsg     term=standout   ctermbg=Red         ctermfg=White                       guibg=#d70000   guifg=White
hi Todo         term=standout   ctermbg=Yellow      ctermfg=Black                       guibg=#d7d700   guifg=Black
hi Ignore                                           ctermfg=236                                         guifg=#303030

" --- UI groups ---
hi LineNr       term=NONE                           ctermfg=242                                         guifg=#6c6c6c
hi CursorLine   term=NONE       ctermbg=235         cterm=NONE                          guibg=#262626   gui=NONE
hi CursorColumn term=NONE       ctermbg=235                                             guibg=#262626
hi ColorColumn                  ctermbg=235                                             guibg=#262626
hi Visual       term=reverse    ctermbg=238         ctermfg=NONE                        guibg=#444444
hi VisualNOS    term=underline  ctermbg=238         cterm=underline                     guibg=#444444   gui=underline
hi NonText      term=bold                           ctermfg=240         gui=bold                        guifg=#585858
hi IncSearch    term=reverse    ctermbg=186         ctermfg=Black                       guibg=#d7d787   guifg=Black
hi Search       term=reverse    ctermbg=22          ctermfg=White                       guibg=#005f00   guifg=White
hi WildMenu     term=standout   ctermbg=186         ctermfg=Black                       guibg=#d7d787   guifg=Black
hi Cursor                                                                               guibg=Green     guifg=Black
hi lCursor                                                                              guibg=Cyan      guifg=Black

" --- Status line and splits ---
hi StatusLine   term=bold       ctermbg=236         ctermfg=252         cterm=bold       guibg=#303030   guifg=#d0d0d0   gui=bold
hi StatusLineNC term=NONE       ctermbg=235         ctermfg=243         cterm=NONE       guibg=#262626   guifg=#767676   gui=NONE
hi VertSplit    term=NONE       ctermbg=235         ctermfg=235         cterm=NONE       guibg=#262626   guifg=#262626   gui=NONE

" --- Diff ---
hi DiffAdd      term=bold       ctermbg=22                                              guibg=#005f00
hi DiffChange   term=bold       ctermbg=52                                              guibg=#5f0000
hi DiffDelete   term=bold       ctermbg=52          ctermfg=52                          guibg=#5f0000   guifg=#5f0000
hi DiffText     term=reverse    ctermbg=88          cterm=bold                          guibg=#870000   gui=bold

" --- Folds ---
hi Folded       term=standout   ctermbg=235         ctermfg=Cyan                        guibg=#262626   guifg=#5fd7d7
hi FoldColumn   term=standout   ctermbg=Black       ctermfg=Cyan                        guibg=Black     guifg=#5fd7d7

" --- Popup menu ---
hi Pmenu                        ctermbg=236         ctermfg=252                         guibg=#303030   guifg=#d0d0d0
hi PmenuSel                     ctermbg=238         ctermfg=White                       guibg=#444444   guifg=White
hi PmenuSbar                    ctermbg=235                                             guibg=#262626
hi PmenuThumb                   ctermbg=243                                             guibg=#767676

" --- Sign column (gitgutter) ---
hi SignColumn                   ctermbg=Black       ctermfg=DarkGrey                    guibg=Black     guifg=#4e4e4e
hi GitGutterAdd                 ctermbg=Black       ctermfg=Green                       guibg=Black     guifg=#5fd75f
hi GitGutterChange              ctermbg=Black       ctermfg=Yellow                      guibg=Black     guifg=#d7d700
hi GitGutterDelete              ctermbg=Black       ctermfg=Red                         guibg=Black     guifg=#ff5f5f

" --- Messages ---
hi ModeMsg      term=bold                           ctermfg=LightGreen  cterm=bold                      guifg=#5fd75f   gui=bold
hi MoreMsg      term=bold                           ctermfg=LightGreen  cterm=bold                      guifg=#5fd75f   gui=bold
hi Question     term=standout                       ctermfg=LightGreen  gui=bold                        guifg=#5fd75f
hi WarningMsg   term=standout                       ctermfg=Yellow                                      guifg=#d7d700
hi Directory    term=bold                           ctermfg=Cyan                                        guifg=#5fd7d7
hi Title        term=bold                           ctermfg=LightMagenta gui=bold                       guifg=#ff87ff
hi SpecialKey   term=bold                           ctermfg=DarkGrey                                    guifg=#4e4e4e

" --- Tabs ---
hi TabLine      term=NONE       ctermbg=235         ctermfg=243         cterm=NONE       guibg=#262626   guifg=#767676   gui=NONE
hi TabLineSel   term=bold       ctermbg=236         ctermfg=White       cterm=bold       guibg=#303030   guifg=White     gui=bold
hi TabLineFill  term=NONE       ctermbg=234         cterm=NONE                          guibg=#1c1c1c   gui=NONE

" vim: sw=4 ts=4
