call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'KeitaNakamura/neodark.vim'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'gurpreetatwal/vim-avro'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'tikhomirov/vim-glsl'
Plug 'neovimhaskell/haskell-vim'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

syntax enable
filetype plugin indent on

if executable('ccls')
   :echom "Using ccls..."
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': {'cache': {'directory': '/tmp/ccls/cache' }},
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif

let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')

" let g:rustfmt_autosave = 1

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords


colorscheme vim-monokai-tasty
if has("gui_running")
    set background=dark
    set guifont=set guifont=Menlo\ Regular:h13
    set termguicolors
    colorscheme vim-monokai-tasty
endif
autocmd BufRead,BufNewFile *.avsc set filetype=avdl
