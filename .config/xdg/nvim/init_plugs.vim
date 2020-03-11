call plug#begin()
  Plug 'scrooloose/nerdcommenter'
  Plug 'tpope/vim-surround'
  Plug 'vim-scripts/ack.vim'
  Plug 'neovim/pynvim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'jiangmiao/auto-pairs'
  Plug 'airblade/vim-gitgutter'
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-session'
  Plug 'tomasr/molokai'
	Plug 'vim-scripts/loremipsum'
	Plug 'simeji/winresizer'
	Plug 'tpope/vim-repeat'
	Plug '907th/vim-auto-save'
	Plug 'godlygeek/tabular'
	Plug 'mhinz/vim-startify'
	Plug 'scrooloose/nerdtree'
	Plug 'vim-scripts/Align'
	Plug 'nathanaelkane/vim-indent-guides'
	Plug 'tpope/vim-fugitive'
  Plug 'ryanoasis/vim-devicons'
  Plug 'mboughaba/i3config.vim'
	Plug 'junegunn/gv.vim'
	Plug 'sjl/gundo.vim'
  " Plug 'majutsushi/tagbar'
  " Plug 'vim-scripts/taglist.vim'
	" Plug 'Shougo/neco-vim' " completions for Vim commands
	Plug 'honza/vim-snippets'
  " Plug 'Shougo/neosnippet' " For func argument completion
  " Plug 'Shougo/neosnippet-snippets'
	" Plug 'brooth/far.vim' " Find And Replace Vim plugin
	" Plug 'joshdick/onedark.vim' " colorscheme
  " Plug 'justinmk/vim-sneak' " @todo, read manual
  " Plug 'neomake/neomake' " @todo, read manual
	" Plug 'kassio/neoterm' " terminal helper, repl to code execution, @todo read

  " Ruby & Co
  Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby']}
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-endwise'

  " Doc & co
	Plug 'donRaphaco/neotex', { 'for': 'tex' } " Latex autocompile
  " Plug 'vim-pandoc/vim-pandoc'
  " Plug 'vim-pandoc/vim-pandoc-syntax'
  " Plug 'vim-latex/vim-latex'

  " Javascript & Co
  Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'jsx', 'tsx']}
  Plug 'mxw/vim-jsx', { 'for': ['javascript', 'jsx', 'tsx']}
  Plug 'burnettk/vim-angular' ", { 'for': 'ts' }
  Plug 'matthewsimo/angular-vim-snippets' ", { 'for': 'ts' }
  Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'leafgarland/typescript-vim'
  Plug 'ianks/vim-tsx', { 'for': 'tsx' }
  Plug 'mhartington/nvim-typescript', { 'for': ['ts', 'tsx']}

  " Rust
  if executable('rustc')
    Plug 'rust-lang/rust.vim', { 'for': 'rust' }
    Plug 'racer-rust/vim-racer', { 'for': 'rust' }
  endif

  " Plug 'brettanomyces/nvim-terminus'
  " Plug 'glacambre/shelley'
  " Plug 'kana/vim-textobj-user'
  " Plug 'jsfaint/gen_tags.vim'
  " Plug 'mhinz/vim-signify' " git/vcs signs
	" Plug 'trusktr/seti.vim' " colorscheme
	" Plug 'skywind3000/asyncrun.vim'
	" Plug 'junegunn/vim-emoji'
	" Plug 'vim-scripts/dbext.vim'
	" Plug 'MattesGroeger/vim-bookmarks'
	" Plug 'jsfaint/gen_tags.vim'
  Plug 'neoclide/vim-jsx-improve'
	" Plug 'elzr/vim-json'
	" Plug 'prettier/vim-prettier'

" Racer
"------------------------------------"
" " set hidden
" " let g:racer_cmd = '/home/seena/.cargo/bin/racer'
" let g:racer_experimental_completer = 1
" au FileType rust nmap <leader>rx <Plug>(rust-doc)
" au FileType rust nmap <leader>rd <Plug>(rust-def)
" au FileType rust nmap <leader>rs <Plug>(rust-def-split)

" vim-jsx
"------------------------------------"
let g:jsx_ext_required = 1

" Neosnippet - snippet support
"------------------------------------"
  let g:neosnippet#enable_completed_snippet = 1
  let g:neosnippet#snippets_directory='~/.vim/bundle/snippets'

  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)

  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

  " For conceal markers.
  " if has('conceal')
    " set conceallevel=2 concealcursor=niv
  " endif

" Git fugitive
"------------------------------------"
  noremap <Leader>gs :Gstatus <CR>
  noremap <Leader>gc :Gcommit <CR>
  noremap <Leader>gd :Gdiff <CR>
  noremap <Leader>gb :GV --author=Armin <CR>
  set tags^=./.git/tags;

" Gundo
"------------------------------------"
  nnoremap <F5> :GundoToggle<CR>

" " Tagbar
" "------------------------------------"
"   nmap <F8> :TagbarToggle<CR>

" " Taglist
" "------------------------------------"
"   nmap <F7> :TlistToggle<CR>

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
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" vim-latex
"------------------------------------"
" let g:Tex_DefaultTargetFormat = 'pdf'

" vim-bookmars
"------------------------------------"
"   let g:bookmark_save_per_working_dir = 1

" " Winresizer - window resize mode by `Ctrl+I`
" "------------------------------------"
  let g:winresizer_start_key = '<C-I>'

" Startify
"------------------------------------"
	let g:startify_change_to_dir = 0

" Prettier Formatters
"------------------------------------"
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css

" Nerdtree
"------------------------------------------------------------
	" close vim when NERDTree is the only left
	" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
	noremap <leader>nt :NERDTreeToggle<CR>
	noremap <leader>f :NERDTreeFind<CR>
	noremap <C-A-N> :NERDTreeFind<CR>
	noremap <leader>nb :Bookmark<CR>

" Airline
"------------------------------------"
  let g:airline_theme='distinguished'
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

" devicons
"------------------------------------"
  set encoding=utf8
  set guifont=Inconsolata\ Nerd\ Font\ 19

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

" noremap H :call <SID>SignCoverage(expand('%:p'))<cr>

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

  " Zoom / Restore window.
  function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
      execute t:zoom_winrestcmd
      let t:zoomed = 0
    else
      let t:zoom_winrestcmd = winrestcmd()
      resize
      vertical resize
      let t:zoomed = 1
    endif
  endfunction
  command! ZoomToggle call s:ZoomToggle()
  " alternative :-tabedit % and :tabclose
  nnoremap <silent> <C-W>z :ZoomToggle<CR>

  " Workaround <Paste> Issue, https://github.com/neovim/neovim/issues/7994#issuecomment-388296360
  au InsertLeave * set nopaste

  " Recover and Delete Swap file
  " augroup AutomaticSwapRecoveryAndDelete
  "   autocmd!
  "   autocmd SwapExists * :let v:swapchoice = 'r' | let b:swapname = v:swapname
  "   autocmd VimLeave * :if exists("b:swapname") | call delete(b:swapname) | endif
  " augroup end

" function for 'fullscreen' mode
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set showtabline=0
        set noshowcmd
        set nonumber
        set norelativenumber
        set nocursorcolumn
        set nocursorline
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showtabline=2
        set showcmd
        set number
        set relativenumber
        set cursorcolumn
        set cursorline
    endif
endfunction
" nnoremap <S-h> :call ToggleHiddenAll()<CR>

" Plug 'AndrewRadev/splitjoin.vim' " star
Plug 'liuchengxu/vista.vim' " star
" show sidebar
nmap <leader>ta :Vista!!<CR>
" search through tags
nmap <leader>/ta :Vista finder coc<CR>
" show floating window with tag preview on hover
let g:vista_echo_cursor_strategy = 'floating_win'
" alter icons in sidebar
let g:vista_icon_indent = [ "", "├─▸"]
let g:vista#renderer#enable_icon = 1

Plug 'sheerun/vim-polyglot' " star
" Plug 'svermeulen/vim-subversive' " star
" nmap s <plug>(SubversiveSubstitute)
" nmap ss <plug>(SubversiveSubstituteLine)
" nmap S <plug>(SubversiveSubstituteToEndOfLine)
" " auto placing paired signs like {} [] '' "" etc
" " framework for code completion/navigation/refactoging

for f in split(glob('$XDG_CONFIG_HOME/nvim/custom_plugins/*.vim'), '\n')
    exe 'source' f
endfor

call plug#end()
