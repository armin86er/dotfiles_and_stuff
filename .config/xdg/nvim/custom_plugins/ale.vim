Plug 'w0rp/ale'

let g:ale_linters = {
      \   'javascript': ['eslint'],
      \   'sh': ['shfmt'],
      \   'ruby': ['rails_best_practices', 'rubocop', 'ruby', 'solargraph'],
      \   'eruby': ['erb', 'erubi', 'erubis'],
      \   'rust': ['cargo', 'rls', 'rustc'],
      \   'haml': ['hamllint'],
      \   'typescript': ['standard', 'tsserver'],
      \   'scss': ['stylelint'],
      \}
let ale_fixers = {
      \   'javascript': ['eslint'],
      \   'typescript': ['prettier', 'tslint'],
      \   'sh': ['shfmt'],
      \   'ruby': ['rubocop', 'rufo', 'sorbet', 'standardrb'],
      \   'rust': ['rustfmt'],
      \   'typescriptreact': ['tslint'],
      \   'scss': ['stylelint'],
      \   'html': ['fecs'],
      \   '*': ['remove_trailing_lines', 'trim_whitespace']
      \}

let g:ale_fixers = ale_fixers
let g:ale_fix_on_save = 1

function! AleFixersOn ()
  let g:ale_fixers = ale_fixers
endfunction

function! AleFixersOff ()
  let g:ale_fixers = {}
endfunction

nmap [e <Plug>(ale_previous_wrap)
nmap ]e <Plug>(ale_next_wrap)

let g:ale_set_highlights = 0
let g:ale_max_signs = 128

" markers
let g:ale_sign_error = '⭍' " >>
let g:ale_sign_warning = '⮞'  " ⇶
let g:ale_sign_info = '⭑' " ●
let g:ale_sign_style_error = '⭐'
let g:ale_sign_style_warning = '⭑'
