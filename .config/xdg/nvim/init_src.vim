" URL: http://vim.wikia.comLocalhost/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc.
"------------------------------------------------------------

runtime macros/matchit.vim

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype plugin indent on
" filetype off

" syntax highlighting
syntax on

let g:rehash256         = 1
" let g:python_host_prog  = '/usr/bin/python2.7'
" let g:python3_host_prog = '/usr/bin/python3.8'
let g:python_host_prog  = '~/envname/bin/python'
let g:python3_host_prog  = '~/envname/bin/python3'

" Theme and colors
colorscheme molokai

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  set t_ut=
endif

" Folding
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo

" Tab completion for filenames like bash
" https://stackoverflow.com/a/526940/6115544
set wildmode=longest,list,full
set wildmenu

" Cursor crosshair
set cursorcolumn
set cursorline

" Unsorted
" hideComments
:set fdm=expr
" :set fde=getline(v:lnum)=~'^\\s#'?1:getline(prevnonblank(v:lnum))=~'^\\s#'?1:getline(nextnonblank(v:lnum))=~'^\\s*#'?1:0

"set language correction
"set spell

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
set tabstop=2 shiftwidth=2 expandtab

set tabpagemax=3
set scrolloff=3
set linebreak
set whichwrap=b,s,<,>,[,]
set wrap

set signcolumn=yes

set foldmethod=manual

" Always draw the signcolumn.
" set signcolumn=yes

" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
set hidden

" Better command-line completion
set wildmenu

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
" set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number
set relativenumber

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F12> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F12>

set wildignore+=/*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

hi Normal   ctermfg=252 ctermbg=none
hi NonText  ctermfg=252 ctermbg=none

" Backups & Files
" set backup                   " Enable creation of backup file.
" set backupdir=~/.vim/backups " Where backups will go.
" set directory=~/.vim/tmp     " Where temporary files will go.

" Highlight search
set hlsearch

" # mappings #
" Leader Key maped to ','
let mapleader=","

" Search for visually selected text with //
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>

:noremap <C-S-J> <Esc>:tabp<CR>
:noremap <C-S-K> <Esc>:tabn<CR>
:noremap <C-S-H> <Esc>:bp<CR>
:noremap <C-S-L> <Esc>:bn<CR>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Change window with Ctrl + Alt
noremap <C-A-J> <C-W>j
noremap <C-A-K> <C-W>k
noremap <C-A-H> <C-W>h
noremap <C-A-L> <C-W>l

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" hide and only option on leader
nnoremap <leader>wo :only<CR>
nnoremap <leader>wh :hide<CR>
" Moving
noremap H ^
noremap L g_
noremap J 8j
noremap K 8k

" Buffer delete on ,x
nnoremap <leader>x :bd<CR>

vnoremap <leader>l  '~/.config/xdg/nvim/init.vim'<cr>

" closes all buffers except focused one
" nnoremap <leader>X '%bd|e#|bd#'<CR>

" no need for ex mode
" nnoremap Q <nop>
" nmap <CR> <nop>

" :termial
" maps leader esc to command mode
:tnoremap <leader><Esc> <C-\><C-n>

" set nowrap
" au TermOpen * set nowrap | :startinsert
" au BufEnter * if &buftype == 'terminal' | :startinsert | endif
set scrollback=100000

" Indent pasted block
" nnoremap <leader>p p`[v`]=

" opens folds with space
" nnoremap <Space> za
" vnoremap <Space> za

" noremap Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
noremap Y y$

" Some vim features on leader
" noremap <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
" noremap <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
" noremap <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>

" spell check
nnoremap <leader>sc :setlocal spell spelllang=en_us,de_de<cr>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" ## Persistant Undo
let vimDir = '$HOME/.vim'
" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
  let myUndoDir = expand(vimDir . '/undodir')
  " Create dirs
  call system('mkdir ' . vimDir)
  call system('mkdir ' . myUndoDir)
  let &undodir = myUndoDir
  set undofile
endif

" Do we have local vimrc?
if filereadable('.vimrc.local')
  " If so, go ahead and load it.
  source .vimrc.local
endif

source $XDG_CONFIG_HOME/nvim/init_plugs.vim
