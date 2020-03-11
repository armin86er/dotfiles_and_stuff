Plug 'junegunn/fzf.vim'
Plug 'ggreer/the_silver_searcher'
" let g:ackprg = 'ag --nogroup --nocolor --column'
" let $FZF_DEFAULT_COMMAND = 'ag -g ""'

let g:fzf_tags_command = 'ctags -R -f .git/tags $PWD'
let g:vista_fzf_preview = ['right:50%']

" fix fxf.vim enter GFiles Command noremapping, doesn't work anymore
" nnoremap <ENTER> <>

:noremap <C-U> :History<CR>
" :noremap c<C-U> :History:<CR>
" :noremap s<C-U> :History/<CR>
:noremap <C-P> :GFiles<CR>
:noremap <C-S> <Esc>:Lines<CR>
:noremap <C-D> <Esc>:Commits<CR>
:noremap <C-X> <Esc>:Tags<CR>
" :noremap g<C-P> :Files<CR>
" :noremap b<C-S> <Esc>:BLines<CR>
" :noremap b<C-D> <Esc>:BCommits<CR>
" :noremap b<C-X> <Esc>:BTags<CR>
:noremap <C-N> <Esc>:Buffers<CR>
" :noremap <C-M> <Esc>:GFiles?<CR>
:noremap <C-O> :Commands<CR>
:noremap <C-A> <Esc>:Ag<CR>
:noremap <leader>h <Esc>:Helptags<CR>

"  Customize statusline colors
" function! s:fzf_statusline()
"   highlight fzf1 ctermfg=161 ctermbg=251
"   highlight fzf2 ctermfg=23 ctermbg=251
"   highlight fzf3 ctermfg=237 ctermbg=251
"   setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
" endfunction
" autocmd! User FzfStatusLine call <SID>fzf_statusline()
