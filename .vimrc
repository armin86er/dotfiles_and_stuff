" URL: http://vim.wikia.comLocalhost/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc.
"------------------------------------------------------------

runtime macros/matchit.vim

colorscheme molokai
let g:rehash256 = 1

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
set tabstop=2 shiftwidth=2 expandtab

set tabpagemax=3
set scrolloff=3
set linebreak
set whichwrap=b,s,<,>,[,]
set foldmethod=manual
"set spell

" hideComments
:set fdm=expr
" :set fde=getline(v:lnum)=~'^\\s#'?1:getline(prevnonblank(v:lnum))=~'^\\s#'?1:getline(nextnonblank(v:lnum))=~'^\\s*#'?1:0


" Leader Key remaped to ','
let mapleader=","
" <leader>n NERDTree
" <leader>s Spell

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
filetype off

" Enable syntax highlighting
syntax on

" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
set hidden

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Use case pnsensitive search, except when using capital letters
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

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
 set number
 set relativenumber

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F12> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F12>

set wildignore+=/*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
" set wildignore+=*.so,*.swp,*.zip     " MacOSX/Linux

hi Normal   ctermfg=252 ctermbg=none
hi NonText  ctermfg=252 ctermbg=none

" Backups & Files
set backup                   " Enable creation of backup file.
set backupdir=~/.vim/backups " Where backups will go.
set directory=~/.vim/tmp     " Where temporary files will go.

" delete all trailing white spaces - WATCH OUT
autocmd BufWritePre * %s/\s\+$//e


" Useful mappings

" These lines setup the environment to show graphics and colors correctly.
:map <C-S-J> <Esc>:tabp<CR>
:map <C-S-K> <Esc>:tabn<CR>
:map <C-S-H> <Esc>:bp<CR>
:map <C-S-L> <Esc>:bn<CR>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Highlight search
set hlsearch

" Some vim features on leader
map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>
nnoremap <leader>sc :setlocal spell spelllang=en_us,de_de<cr>

"
" Minibuffer Explorer Settings
" from http://biodegradablegeek.com/2007/12/using-vim-as-a-complete-ruby-on-rails-ide/#install
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" ## Persistant Undo
" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif
" ## End Persistant Undo

" PLUGIN

" Vundle
"------------------------------------------------------------
if hostname() == "debian"
	set rtp+=~/.vim/bundle/Vundle.vim
endif
call vundle#begin()
  " Plugin 'vim-scripts/dbext.vim'
  " Plugin 'godlygeek/tabular'
  " Plugin 'ryanoasis/vim-devicons'
	if hostname() == "debian"
		Plugin 'kien/ctrlp.vim'
		Plugin 'mileszs/ack.vim'
		Plugin 'jiangmiao/auto-pairs'
		Plugin 'airblade/vim-gitgutter'
		Plugin 'sjl/gundo.vim'
		Plugin 'Yggdroot/indentLine'
		Plugin 'scrooloose/nerdcommenter'
		Plugin 'tpope/vim-surround'
		Plugin 'sirver/UltiSnips'
		Plugin 'rkitover/vimpager'
	endif

	Plugin 'vim-latex/vim-latex'
  Plugin 'junegunn/gv.vim'
  Plugin 'vim-scripts/loremipsum'
  Plugin 'simeji/winresizer'
  Plugin 'mhinz/vim-startify'
  Plugin 'MattesGroeger/vim-bookmarks'
  Plugin 'tpope/vim-repeat'
  Plugin 'chemzqm/vim-jsx-improve'
  Plugin 'w0rp/ale'
  " Plugin '907th/vim-auto-save'
	" Plugin 'pangloss/vim-javascript'
  " Plugin 'mxw/vim-jsx'
  " Plugin 'prettier/vim-prettier'

call vundle#end()            " required
filetype plugin indent on    " required

" Git fugitive
"------------------------------------"
map <Leader>gs :Gstatus <CR>
map <Leader>gd :Gdiff <CR>
map <Leader>gb :GV --author=Armin <CR>

" CtrlP
"------------------------------------"
nnoremap <leader>. :CtrlPTag<cr>

" Gundo
"------------------------------------"
nnoremap <F5> :GundoToggle<CR>

" Tagbar
"------------------------------------"
nmap <F8> :TagbarToggle<CR>

" Taglist
"------------------------------------"
nmap <F7> :TlistToggle<CR>

" NerdCommenter
"------------------------------------"
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
" let g:NERDTrimTrailingWhitespace = 1

" Powerline
"------------------------------------"
set rtp+=/usr/lib/python2.7/site-packages/powerline/bindings/vim
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" CtrlP
"------------------------------------"
	let g:ctrlp_custom_ignore = {
		\ 'dir':  '\v[\/]\.(git|hg|svn)$|^bundle$',
		\ 'file': '\v\.(exe|so|dll)$',
		\ 'link': 'some_bad_symbolic_links',
		\ }
  let g:ctrlp_working_path_mode = 'ra'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']  " Ignore files in .gitignore

" vim-ack
"------------------------------------"
nmap <leader>a :tab split<CR>:Ack ""<Left>

" git-gutter
"------------------------------------"
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

" vim-latex
"------------------------------------"
let g:Tex_DefaultTargetFormat = 'pdf'

" vim-bookmars
"------------------------------------"
let g:bookmark_save_per_working_dir = 1

" Winresizer - window resize mode by `Ctrl+I`
"------------------------------------"
let g:winresizer_start_key = '<C-I>'

" Startify
"------------------------------------"
let g:startify_change_to_dir = 0

"Ale Linter
"------------------------------------"
let g:ale_linters = {
      \   'ruby': ['rubocop'],
      \   'haml': ['haml_lint'],
      \   'scss': ['stylelint'],
      \}
" let g:ale_scss_stylelint_executable = '~/pictrs/node_modules/.bin/stylelint'

" let g:ale_fix_on_save = 1
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_set_highlights = 0

" Nerdtree
"------------------------------------------------------------
" open a NERDTree automatically when open a dir
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" close vim when NERDTree is the only left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <leader>nt :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<CR>
map <leader>nb :Bookmark<CR>

" Workspace
"------------------------------------"
" nnoremap <leader>s :ToggleWorkspace<CR>
" let g:workspace_persist_undo_history = 1  " enabled = 1 (default), disabled = 0
" let g:workspace_undodir='.undodir'"
" let g:workspace_undodir='.undodir'"
" let g:workspace_autosave_always = 1
"
" " fancy stuff
" let g:workspace_powerline_separators = 1
" let g:workspace_tab_icon = "\uf00a"
" let g:workspace_left_trunc_icon = "\uf0a8"
" let g:workspace_right_trunc_icon = "\uf0a9"

" Syntastic
"------------------------------------"
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 0
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
"
" if hostname() == "archdicho"
" elseif hostname() == "archvm"
	" let g:syntastic_ruby_checkers=['rubocop']
	" let g:syntastic_haml_checkers=['haml_lint']
	" let g:syntastic_javascript_eslint_exec = '~/pictrs/node_modules/.bin/eslint'
	" let g:syntastic_javascript_checkers = ['eslint']
" endif

" vim-dbext
"------------------------------------"
" :helptags ~/.vim/doc

" vim-tabular
"------------------------------------------------------------
" if exists(":Tabularize")
	" nmap <Leader>a= :Tabularize /=<CR>
	" vmap <Leader>a= :Tabularize /=<CR>
	" nmap <Leader>a: :Tabularize /:\zs<CR>
	" vmap <Leader>a: :Tabularize /:\zs<CR>
" endif
" inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
"
" function! s:align()
  " let p = '^\s*|\s.*\s|\s*$'
  " if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    " let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    " let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    " Tabularize/|/l1
    " normal! 0
    " call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  " endif
" endfunction

" devicons
"------------------------------------"
" set encoding=utf8
"  guifont=Inconsolata\ Nerd\ Font\ 19

" vim-javascript
"------------------------------------"
" let g:javascript_conceal_function             = 'ƒ'
" let g:javascript_conceal_null                 = 'ø'
" " let g:javascript_conceal_this                 = '@'
" " let g:javascript_conceal_return               = '⇚'
" " let g:javascript_conceal_undefined            = '¿'
" " let g:javascript_conceal_NaN                  = 'ℕ'
" " let g:javascript_conceal_prototype            = '¶'
" " let g:javascript_conceal_static               = '•'
" " let g:javascript_conceal_super                = 'Ω'
" let g:javascript_conceal_arrow_function       = '⇒'
" let g:javascript_conceal_noarg_arrow_function = '🞅'
" let g:javascript_conceal_underscore_arrow_function = '🞅'
" set conceallevel=0
" let g:javascript_plugin_jsdoc = 1

" vim-autosave
"------------------------------------------------------------
" let g:auto_save_events = ["InsertLeave", "TextChanged"]
" let g:auto_save_write_all_buffers = 1 " write all open buffers as if you would use :wa "
" let g:auto_save = 1                   " enable AutoSave on Vim startup                 "

