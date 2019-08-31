call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/molokai'
Plug 'fatih/vim-go'
Plug 'fatih/vim-hclfmt'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'davidhalter/jedi-vim'
Plug 'zchee/deoplete-jedi'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'dracula/vim'
Plug 'posva/vim-vue'
Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'rhysd/git-messenger.vim'
Plug 'junegunn/fzf.vim'
Plug '/usr/local/opt/fzf'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'machakann/vim-highlightedyank'

call plug#end()

set number
set clipboard=unnamed
set mouse=a
set cursorline
set sts=2
set ts=2
set sw=2
set completeopt-=preview

let mapleader = ","

let NERDTreeIgnore = ['\.pyc$', '.DS_STORE']
let NERDTreeQuitOnOpen=1

let g:go_fmt_command = "goimports"
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_auto_type_info = 0
let g:go_metalinter_autosave = 0
let g:go_fmt_fail_silently = 1

let g:deoplete#enable_at_startup = 1

let g:rehash256 = 1

let g:molokai_original = 1

let g:airline#extensions#branch#enabled = 1

let g:jedi#force_py_version=3

let g:rustfmt_autosave = 1

let g:ale_sign_column_always = 1
let g:ale_lint_delay = 500
let g:ale_virtualtext_cursor = 1
let g:ale_rust_rls_config = {
	\ 'rust': {
		\ 'all_targets': 1,
		\ 'build_on_save': 1,
		\ 'clippy_preference': 'on'
	\ }
	\ }
let g:ale_rust_rls_toolchain = ''
let g:ale_linters = {'rust': ['rls']}

highlight link ALEWarningSign Todo
highlight link ALEErrorSign WarningMsg
highlight link ALEVirtualTextWarning Todo
highlight link ALEVirtualTextInfo Todo
highlight link ALEVirtualTextError WarningMsg
highlight ALEError guibg=None
highlight ALEWarning guibg=None
let g:ale_sign_error = "✖"
let g:ale_sign_warning = "⚠"
let g:ale_sign_info = "i"
let g:ale_sign_hint = "➤"

set cmdheight=2

map <leader>n :NERDTreeToggle<CR>
map <leader>d :GoDef<CR>
map <leader>b :e #<CR>
map <leader>t :GoInfo<CR>
map <leader>p :20sp<CR>:GoDef<CR>zz<C-w>p
map <leader>f :Files<CR>
map <leader>r :Rg<CR>
map <leader>m :NERDTreeFind<CR>

autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>d <Plug>(go-def)

set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

inoremap <silent><expr> <Tab> pumvisible() ? '<C-y>' : '<Tab>'

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


colorscheme dracula
highlight Normal ctermbg=NONE
highlight CursorLine ctermbg=black

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

map <F1> <Esc>
imap <F1> <Esc>
