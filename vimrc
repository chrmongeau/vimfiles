" Define tmp dir (for `directory` and `backupdir`
let s:vim_tmp = expand('~/tmp/vim')

" Check if directory exists, if not, create it
if !isdirectory(s:vim_tmp)
    call mkdir(s:vim_tmp, 'p')
endif

let &directory = '.,' . s:vim_tmp
let &backupdir = s:vim_tmp
let &undodir = s:vim_tmp
set undofile

" vimwiki
let g:vimwiki_folding=1

" File-type detection
filetype plugin indent on

"set backspace=start,eol

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,latin1
set fileencoding=utf-8

"set guifont=
"set guifontwide=

if has('gui_running')
  set guifont=Consolas:h10
    set lines=999 columns=82
endif

set colorcolumn=77

let g:is_kornshell=1

set wildmenu wildmode=longest:full

set diffopt=filler,horizontal

set hidden

set showcmd

"Look
colorscheme nokto
set guicursor=a:block-blinkon0

set helpheight=15


"backupdir=expand("%:p:h")
".fnamemodify(expand("%:p"),":gs?/?-?")

"ATT: * is a list item:
set formatlistpat=^\\s*\\(\\d\\\|[-*]\\)\\+[\\]:.)}\\t\ ]\\s*

"Syntax highlight and color
syntax enable

"Search
set hlsearch incsearch

"For :set list
set listchars=eol:$,tab:\|-

"Tabs
set tabstop=4
set shiftwidth=4
set expandtab

"numbering (3 cols)
set number
set numberwidth=3

"mark wrapped lines with a "+":
set showbreak=+

"indentation
set autoindent

set ruler

set laststatus=2
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P

"MAPS

function! s:ToggleNumber() abort
  if &number
    set nonumber showbreak=+
  else
    set number showbreak=
  endif
endfunction
nnoremap <Leader>n :call <SID>ToggleNumber()<CR>

nnoremap <Space> <PageDown>

inoremap jj <Esc>

"inoremap <CR> <CR><Space><BS>
"inoremap <buffer> <Enter> <CR><Space><C-H>

"ml:
nnoremap <F9> :set hlsearch! hlsearch?<CR>
"imap <F9> <C-O>:set hls! hls?<CR>


"""""""""" PLUGINS (vim-plug)
" After adding a plugin, to activate run:
"     :PlugInstall to install plugins
"     :PlugUpdate  to update plugins
"     :PlugDiff    to review the changes from the last update
"     :PlugClean   to remove plugins no longer in the list
" For more information, see https://github.com/junegunn/vim-plug
"
call plug#begin()

Plug 'tpope/vim-dotenv'

Plug 'tpope/vim-fugitive'
"let g:fugitive_git_executable = 'git -c color.ui=always'

Plug 'airblade/vim-gitgutter'

"Plug 'preservim/nerdtree'

"Plug 'ubaldot/vim-conda-activate'
"Plug 'cjrh/vim-conda'

Plug 'jpalardy/vim-slime'
let g:slime_target = "vimterminal"

Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'

call plug#end()


" Define function to ask for a conda environment
function! LaunchPythonWithEnv()
  let l:conda_json = system('conda env list --json')
  if v:shell_error
    echoerr "Failed to list Conda environments"
    return
  endif

  let l:parsed = json_decode(l:conda_json)
  let l:env_paths = get(l:parsed, 'envs', [])

  if empty(l:env_paths)
    echoerr "No Conda environments found"
    return
  endif

  let l:env_names = map(copy(l:env_paths), { _, val -> fnamemodify(val, ':t') })
  let l:numbered_envs = map(copy(l:env_names), { idx, val -> (idx + 1) . '. ' . val })
  let l:choices = ['Select Conda environment:'] + l:numbered_envs
  let l:selection = inputlist(l:choices)

  if l:selection <= 0 || l:selection > len(l:env_names)
    echo "No environment selected"
    return
  endif

  let l:env = l:env_names[l:selection - 1]
  let b:slime_vimterminal_cmd = 'C:\Users\Mongeau\OneDrive - Food and Agriculture Organization\Documents\activate_conda_environment.bat ' . l:env

  echo "\nSelected Conda environment: " . l:env

  " Trigger slime to open the terminal using the configured command
  execute 'SlimeConfig'
endfunction

" Map \cc to launch conda environment selection
" NOTE: <C-\><C-n> to go normal mode in terminal
augroup PythonSlimeEnv
  autocmd!
  autocmd FileType python nnoremap <buffer> <leader>cc :call LaunchPythonWithEnv()<CR>
augroup END


" Config vars
let g:dbs = {}

let s:private_env = expand('~/vimfiles/private/env.vim')

if filereadable(s:private_env)
  execute 'source ' . fnameescape(s:private_env)
endif
" / Config vars


" dadbod (database related)
let g:dadbod_shell = ''
let g:db_ui_execute_on_save = 0

if !empty($DB_MAIN_URL) && !empty($DB_ALT_URL)
  let g:dbs = {
  \ 'MAIN': getenv('DB_MAIN_URL'),
  \ 'ALT':  getenv('DB_ALT_URL'),
  \ }
  let g:db = g:dbs['MAIN']
else
  echohl WarningMsg
  echom "dadbod: DB_MAIN_URL or DB_ALT_URL is empty. Check ~/vimfiles/private/env"
  echohl None
endif

function! DadbodPickDB(...) abort
  if empty(get(g:, 'dbs', {}))
    echoerr "No databases configured in g:dbs"
    return
  endif

  let l:names = sort(keys(g:dbs))
  let l:menu = ['Select database:'] + map(copy(l:names), {i,v -> printf('%d. %s', i+1, v)})

  let l:default = index(l:names, get(a:, 1, 'MAIN')) + 1
  if l:default <= 0 | let l:default = 1 | endif

  let l:choice = inputlist(l:menu)
  if l:choice <= 0 || l:choice > len(l:names)
    echo "DB selection cancelled"
    return
  endif

  let l:selected = l:names[l:choice - 1]
  let g:db = g:dbs[l:selected]
  execute 'DB' g:db
  echo 'Connected to ' . l:selected
endfunction

command! -nargs=? DBPick call DadbodPickDB(<f-args>)

" /dadbod
