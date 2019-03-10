call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/molokai'
Plug 'fatih/vim-go'
Plug 'fatih/vim-hclfmt'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-go', { 'do': 'make'}
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
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
" let g:go_metalinter_autosave = 1
" let g:go_metalinter_autosave_enabled = ['vet', 'golint']

let g:deoplete#enable_at_startup = 1

let g:rehash256 = 1

let g:molokai_original = 1

let g:airline#extensions#branch#enabled = 1

let g:jedi#force_py_version=3

" let g:rustfmt_autosave = 1

let g:ale_sign_column_always = 1
let g:ale_lint_delay = 500

map <leader>n :NERDTreeToggle<CR>
map <leader>d :GoDef<CR>
map <leader>b :e #<CR>
map <leader>t :GoTest<CR>
map <leader>p :20sp<CR>:GoDef<CR>zz<C-w>p

autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>d <Plug>(go-def)

inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ deoplete#mappings#manual_complete()
        function! s:check_back_space() abort "{{{
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~ '\s'
        endfunction"}}}

colorscheme dracula
highlight Normal ctermbg=NONE
