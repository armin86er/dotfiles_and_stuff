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

" Enable syntax highlighting
syntax on

  " # Variables #
  let g:rehash256 = 1
  let g:python_host_prog = '/usr/bin/python2.7'
  let g:python3_host_prog = '/usr/bin/python3.7'

  " # Settings #

    " Theme and colors
    colorscheme molokai

    if &term =~ '256color'
      " Disable Background Color Erase (BCE) so that color schemes
      " work properly when Vim is used inside tmux and GNU screen.
      set t_ut=
    endif

    " Folding
    set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo

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
    set backup                   " Enable creation of backup file.
    set backupdir=~/.vim/backups " Where backups will go.
    set directory=~/.vim/tmp     " Where temporary files will go.

    " Highlight search
    set hlsearch

  " # Mappings #
    " Leader Key remaped to ','
    let mapleader=","

    " Search for visually selected text with //
    vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>

    :map <C-S-J> <Esc>:tabp<CR>
    :map <C-S-K> <Esc>:tabn<CR>
    :map <C-S-H> <Esc>:bp<CR>
    :map <C-S-L> <Esc>:bn<CR>

    nnoremap <silent> [b :bprevious<CR>
    nnoremap <silent> ]b :bnext<CR>
    nnoremap <silent> [B :bfirst<CR>
    nnoremap <silent> ]B :blast<CR>

    " Change window wit Ctrl + Alt
    map <C-A-J> <C-W>j
    map <C-A-K> <C-W>k
    map <C-A-H> <C-W>h
    map <C-A-L> <C-W>l

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

    " no need for ex mode
    nnoremap Q <nop>
    nmap <CR> <nop>

    " :termial
    " maps leader esc to command mode
    :tnoremap <leader><Esc> <C-\><C-n>

    " Indent pasted block
    " nnoremap <leader>p p`[v`]=

    " opens folds with space
    nnoremap <Space> za
    vnoremap <Space> za

    " Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
    map Y y$

    " Some vim features on leader
    " map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
    " map <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
    " map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>

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

:command Q qa!
:command W wq!

" PLUGINS
" Plug PluginManager
"------------------------------------------------------------
call plug#begin()
	Plug 'vim-scripts/loremipsum'
	Plug 'simeji/winresizer'
	Plug 'mhinz/vim-startify'
	Plug 'w0rp/ale'

	Plug 'autozimu/LanguageClient-neovim', {
				\ 'branch': 'next',
				\ 'do': 'bash install.sh',
				\ }

	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  } " asynchronous completion framework
	Plug 'junegunn/fzf.vim' " general-purpose command-line fuzzy finder TODO
	Plug 'ggreer/the_silver_searcher'
	Plug 'sjl/gundo.vim'
	Plug 'fszymanski/deoplete-emoji'
	Plug 'Shougo/neco-vim' " completions for Vim commands
	Plug 'Shougo/neosnippet' " For func argument completion
	Plug 'Shougo/neosnippet-snippets'
	Plug 'brooth/far.vim' " Find And Replace Vim plugin
	Plug 'donRaphaco/neotex', { 'for': 'tex' } " Latex wysiwyg
	Plug 'scrooloose/nerdtree'
	Plug 'junegunn/gv.vim'
	Plug 'vim-scripts/Align'
	Plug 'nathanaelkane/vim-indent-guides'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-repeat'
	Plug '907th/vim-auto-save'
	Plug 'godlygeek/tabular'
	Plug 'pangloss/vim-javascript'
	Plug 'mxw/vim-jsx'
	" Plug 'sheerun/vim-polyglot' " collection of language packs
	" Plug 'mhinz/vim-signify'
	Plug 'joshdick/onedark.vim' " colorscheme
	Plug 'kassio/neoterm' "  terminal helper, repl
  " Plug 'mhinz/vim-signify' " git/vcs signs

	" Plug 'vim-latex/vim-latex'
	" Plug 'trusktr/seti.vim' " colorscheme
	" Plug 'ryanoasis/vim-devicons'
	" Plug 'skywind3000/asyncrun.vim'
	" Plug 'junegunn/vim-emoji'
	" Plug 'vim-scripts/dbext.vim'
	" Plug 'MattesGroeger/vim-bookmarks'
	" Plug 'jsfaint/gen_tags.vim'
	" Plug 'chemzqm/vim-jsx-improve'
	" Plug 'elzr/vim-json'
	" Plug 'prettier/vim-prettier'
call plug#end()

" Deoplete - asynchronous completion framework for neovim/Vim8
"------------------------------------"
  let g:deoplete#enable_at_startup = 1
	" use tab to forward cycle
	inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
	" use tab to backward cycle
	inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

  " " call deoplete#custom#option('omni_patterns', v:false)
  " " call deoplete#custom#option('refresh_always', v:false)
  if exists("deoplete#custom#option")
    call deoplete#custom#option('ignore_case', v:false)
    call deoplete#custom#option('smart_case', v:false)
  endif
  " call deoplete#custom#option('num_processes', 0)
  " " call deoplete#custom#option('auto_complete_delay', 10)

  " " use tab to forward cycle
  " inoremap <silent><expr> <TAB>
  "       \ pumvisible() ? "\<C-n>" :
  "       \ <SID>check_back_space() ? "\<TAB>" :
  "       \ deoplete#mappings#manual_complete()
  " function! s:check_back_space() abort "{{{
  "   let col = col('.') - 1
  "   return !col || getline('.')[col - 1]  =~ '\s'
  " endfunction"}}}

" LanguageClient
"------------------------------------"
  " Required for operations modifying multiple buffers like rename.
	set hidden " also required for copying to sys clipboard!?

        " \ 'javascript': ['javascript-typescript-stdio', 'stdio'],
  let g:LanguageClient_serverCommands = {
        \ 'ruby': ['solargraph', 'stdio']
        \ }
  " let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'
  " let g:LanguageClient_loggingLevel = 'INFO'
  " let g:LanguageClient_serverStderr = '/tmp/LanguageServer.log'

  nnoremap <F6> :call LanguageClient_contextMenu()<CR>
  " Or map each action separately
  " nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
  " nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
  " nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" fzf
  let $FZF_DEFAULT_COMMAND = 'ag -g ""'

  " fix fxf.vim enter GFiles Command mapping
  nnoremap <ENTER> <>

  :map <C-U> :History<CR>
  " :map c<C-U> :History:<CR>
  " :map s<C-U> :History/<CR>
  :map <C-P> :GFiles<CR>
  :map <C-S> <Esc>:Lines<CR>
  :map <C-D> <Esc>:Commits<CR>
  :map <C-X> <Esc>:Tags<CR>
  " :map g<C-P> :Files<CR>
  " :map b<C-S> <Esc>:BLines<CR>
  " :map b<C-D> <Esc>:BCommits<CR>
  " :map b<C-X> <Esc>:BTags<CR>
  :map <C-N> <Esc>:Buffers<CR>
  :map <C-M> <Esc>:GFiles?<CR>
  :map <C-O> :Commands<CR>
  :map <C-A> <Esc>:Ag<CR>
  :map <leader>h <Esc>:Helptags<CR>

  "  Customize statusline colors
	" function! s:fzf_statusline()
	"   highlight fzf1 ctermfg=161 ctermbg=251
	"   highlight fzf2 ctermfg=23 ctermbg=251
	"   highlight fzf3 ctermfg=237 ctermbg=251
	"   setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
	" endfunction
	" autocmd! User FzfStatusLine call <SID>fzf_statusline()

" Neosnippet - snippet support
"------------------------------------"
  let g:neosnippet#enable_completed_snippet = 1
  " let g:neosnippet#snippets_directory='~/.vim/UlitSnips'
  let g:neosnippet#snippets_directory='~/.vim/bundle/snippets'

  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)

  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

  " For conceal markers.
  " if has('conceal')
    " set conceallevel=2 concealcursor=niv
  " endif

" Git fugitive
"------------------------------------"
  map <Leader>gs :Gstatus <CR>
  map <Leader>gc :Gcommit <CR>
  map <Leader>gd :Gdiff <CR>
  map <Leader>gb :GV --author=Armin <CR>

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
  let g:NERDSpaceDelims = 1 " add space by default
  let g:NERDCompactSexyComs = 1 " for mulitline comments
  let g:NERDDefaultAlign = 'left'
  " Set a language to use its alternate delimiters by default
  let g:NERDAltDelims_java = 1
  " Add your own custom formats or override the defaults
  let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
  " Allow commenting and inverting empty lines (useful when commenting a region)
  let g:NERDCommentEmptyLines = 0

" vim-session
"------------------------------------------------------------
  " Don't save hidden and unloaded buffers in sessions.
  set sessionoptions-=buffers

  :let g:session_autosave = 'no'
  :let g:session_autoload = 'no'

" vim-ack
"------------------------------------"
nmap <leader>a :Ack! ""<Left>

" git-gutter
"------------------------------------"
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

" vim-latex
"------------------------------------"
" let g:Tex_DefaultTargetFormat = 'pdf'

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
				\   'eruby': ['erubis'],
				\   'javascript': ['eslint'],
				\   'haml': ['haml_lint'],
				\   'scss': ['stylelint'],
				\}
	let g:ale_fixers = {
				\   'javascript': ['eslint'],
				\   'ruby': ['rubocop']
				\}
	let g:ale_fix_on_save = 1

	nmap [e <Plug>(ale_previous_wrap)
	nmap ]e <Plug>(ale_next_wrap)

	let g:ale_set_highlights = 0
	let g:ale_max_signs = 128

	" markers
	let g:ale_sign_error = '⭍' " Less aggressive than the default '>>'
	let g:ale_sign_warning = '⮞'  " '⇶'
	let g:ale_sign_info = '⭑' " ●
	let g:ale_sign_style_error = '⭐'
	let g:ale_sign_style_warning = '⭑'

" Nerdtree
"------------------------------------------------------------
	" close vim when NERDTree is the only left
	" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
	map <leader>nt :NERDTreeToggle<CR>
	map <leader>f :NERDTreeFind<CR>
	map <C-A-N> :NERDTreeFind<CR>
	map <leader>nb :Bookmark<CR>

" Airline
"------------------------------------"
  let g:airline_theme='powerlineish'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#buffer_idx_mode = 1
  nmap <leader>1 <Plug>AirlineSelectTab1
  nmap <leader>2 <Plug>AirlineSelectTab2
  nmap <leader>3 <Plug>AirlineSelectTab3
  nmap <leader>4 <Plug>AirlineSelectTab4
  nmap <leader>5 <Plug>AirlineSelectTab5
  nmap <leader>6 <Plug>AirlineSelectTab6
  nmap <leader>7 <Plug>AirlineSelectTab7
  nmap <leader>8 <Plug>AirlineSelectTab8
  nmap <leader>9 <Plug>AirlineSelectTab9

" " devicons
" "------------------------------------"
"   set encoding=utf8
"   set guifont=Inconsolata\ Nerd\ Font\ 19

" vim-dbext
"------------------------------------"
" :helptags ~/.vim/doc

" vim-tabular
"------------------------------------------------------------
if exists(":Tabularize")
  nmap <Leader>t= :Tabularize /=<CR>
  vmap <Leader>t= :Tabularize /=<CR>
  nmap <Leader>t: :Tabularize /:\zs<CR>
  vmap <Leader>t: :Tab /:\zs<CR>
endif

" inoremap <silent> <Bar> <Bar><Esc>:call <SID>align()<CR>a
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

" vim-javascript
"------------------------------------"
" let g:indentLine_setColors = 0
" let g:indentLine_char = '┆'
" let g:indentLine_enabled = 0
" let g:indentLine_bgcolor_term = 202

let g:javascript_conceal_function             = 'ƒ'
let g:javascript_conceal_null                 = 'ø'
let g:javascript_conceal_this                 = '@'
let g:javascript_conceal_return               = '⇚'
let g:javascript_conceal_undefined            = '¿'
" " let g:javascript_conceal_NaN                  = 'ℕ'
" " let g:javascript_conceal_prototype            = '¶'
" " let g:javascript_conceal_static               = '•'
let g:javascript_conceal_super                = 'Ω'
let g:javascript_conceal_arrow_function       = '⇒'
let g:javascript_conceal_noarg_arrow_function = '🞅'
let g:javascript_conceal_underscore_arrow_function = '🞅'
set conceallevel=1

" let g:javascript_plugin_jsdoc = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0

" vim-autosave
"------------------------------------------------------------
	" :AutoSaveToggle
	let g:auto_save_events = ["FocusLost"]
	let g:auto_save_write_all_buffers = 1 " write all open buffers as if you would use :wa
	let g:auto_save = 1                   " enable AutoSave on Vim startup
	let g:auto_save_silent = 1  " do not display the auto-save notification

" vim-emoji
"------------------------------------------------------------
" set completefunc=emoji#complete

" " show ruby coverage, ref: https://gist.github.com/mislav/5346548
" highlight SignColumn NONE
" sign define covpos text=• texthl=String
" sign define covneg linehl=Error text=𐄂 texthl=HelpDebug

" function! s:SignCoverage(file)
"   let output = system('grep "'.a:file.'" coverage/raw')
"   let lines = split(output, '\n')
"   exec 'sign unplace * buffer='.bufnr('%')
"   for line in lines
"     let [ type, lnum, fname ] = split(line, ' ')
"     let name = type == '+' ? 'covpos' : 'covneg'
"     exec 'sign place '.lnum.' line='.lnum.' name='.name.' buffer='.bufnr('%')
"   endfor
" endfunction

" map H :call <SID>SignCoverage(expand('%:p'))<cr>

" Do we have local vimrc?
if filereadable('.vimrc.local')
  " If so, go ahead and load it.
  source .vimrc.local
endif

  " # Groups of functionality # gof

  " Opens fold automatically if cursor is placed on line, see https://stackoverflow.com/a/7035949/6115544
    " nnoremap <silent> j :<c-u>call MoveUpDown('j', +1, 1)<cr>
    " nnoremap <silent> k :<c-u>call MoveUpDown('k', -1, 1)<cr>
    " nnoremap <silent> gj :<c-u>call MoveUpDown('gj', +1, 1)<cr>
    " nnoremap <silent> gk :<c-u>call MoveUpDown('gk', -1, 1)<cr>
    " nnoremap <silent> <c-d> :<c-u>call MoveUpDown("\<lt>c-d>", +1, '&l:scroll')<cr>
    " nnoremap <silent> <c-u> :<c-u>call MoveUpDown("\<lt>c-u>", -1, '&l:scroll')<cr>
    " nnoremap <silent> <c-f> :<c-u>call MoveUpDown("\<lt>c-f>", +1, 'winheight("%")')<cr>
    " nnoremap <silent> <c-b> :<c-u>call MoveUpDown("\<lt>c-b>", -1, 'winheight("%")')<cr>
    " function! MoveUpDown(cmd, dir, ndef)
      " let n = v:count == 0 ? eval(a:ndef) : v:count
      " let l = line('.') + a:dir * n
      " silent! execute l . 'foldopen!'
      " execute 'norm! ' . n . a:cmd
    " endfunction

  " # Auto commands #
  " on events, command mode in neovim terminal
  au FocusLost,TabLeave * call feedkeys("\<C-\>\<C-n>")

  " delete all trailing white spaces - WATCH OUT
  autocmd BufWritePre * %s/\s\+$//e

