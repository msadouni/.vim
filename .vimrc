set encoding=utf-8
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Vundle help
""""""""""""""
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" VCS
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'

" System
Bundle 'Lokaltog/vim-easymotion'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'mileszs/ack.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'scrooloose/snipmate-snippets'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'vim-scripts/YankRing.vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'vim-scripts/scratch.vim'
Bundle 'vim-scripts/rainbow_parentheses.vim'
Bundle 'majutsushi/tagbar'
Bundle 'ervandew/supertab'
Bundle 'Raimondi/delimitMate'
Bundle 'bkad/CamelCaseMotion'

" Other
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-endwise'
Bundle 'altercation/vim-colors-solarized'
Bundle 'skammer/vim-css-color'
Bundle 'mgutz/vim-colors'
" Bundle 'vim-scripts/php.vim-html-enhanced'
Bundle '2072/PHP-Indenting-for-VIm'

" Basic
filetype off
filetype plugin indent on
set nocompatible
set modelines=0

" Syntax highlighting
syntax enable
if has('gui_running')
  set guifont=Menlo:h12
  set bg=dark
  let g:solarized_termcolors=256
  let g:solarized_bold = 1
  let g:solarized_underline = 1
  let g:solarized_italic = 1
  colorscheme solarized
  " Remove left scrollbar
  set guioptions-=l
  set guioptions-=L
else
  " colorscheme twilight256
  set bg=dark
  let g:solarized_termcolors=256
  colorscheme solarized
endif

" Whitespace
set tabstop=2
set shiftwidth=2
set shiftround
set softtabstop=2
set smarttab
set list
set listchars=tab:▸\ ,eol:¬,trail:·
set expandtab

" Various options
set encoding=utf-8
set scrolloff=3
set autoindent
set smartindent
set copyindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set pastetoggle=<F2> " paste mode
set mouse=a
if has('gui_running')
  set relativenumber
  set undodir=~/.vim/tmp
  set undofile
  set undolevels=1000 "maximum number of changes that can be undone
  set undoreload=10000 "maximum number lines to save for undo on a buffer reload
endif

" Leader
let mapleader = ","

" Searching / moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" Line wrap
set wrap
set textwidth=79
set formatoptions=qrn1
if has('gui_running')
  set colorcolumn=85
endif
" Disable arrow keys
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
" nnoremap j gj
" nnoremap k gk

" Disable F1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Easier :
nnoremap ; :

" Save on focus lost
au FocusLost * :wa

" ,W to clear trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Easier Ack
nnoremap <leader>a :Ack

" Fold tag
nnoremap <leader>ft Vatzf

" Select the text that was just pasted
nnoremap <leader>v V`]

" Easier ESC
inoremap jj <ESC>
inoremap jk <ESC>

" New vertical split window
nnoremap <leader>n <C-w>v<C-w>l

" Edit vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>

" Easier movement around split windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Get rid of search hilighting with ,/
nnoremap <silent> <leader>/ :nohlsearch<CR>

" Fix those pesky situations where you edit & need sudo to save
cmap w!! w !sudo tee % >/dev/null

" swap files
set directory=~/.vim/tmp

" Remap j and k to act as expected when used on long, wrapped, lines
nnoremap j gj
nnoremap k gk

" make p in Visual mode replace the selected text with the yank register
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Use ,d (or ,dd or ,dj or 20,dd) to delete a line without adding it to the
" yanked stack (also, in visual mode)
nmap <silent> <leader>d "_d
vmap <silent> <leader>d "_d

" Check PHP syntax
nnoremap <F6> :! php -l %<CR>

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Auto-commands
"""""""""""""""

autocmd FileType php set shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType html set shiftwidth=4 tabstop=4 softtabstop=4

" Plugin configuration
""""""""""""""""""""""

" Command-T
nnoremap <Leader>r :CommandT<CR>

" NERDTree
nnoremap <leader>g :NERDTreeToggle<CR>

" SnipMate
let g:snippets_dir = "~/.vim/bundle/snipmate-snippets"
au BufRead *.php set ft=php.html
au BufNewFile *.php set ft=php.html
au BufRead *.htm set ft=php.html
au BufNewFile *.htm set ft=php.html
au BufRead *.html set ft=php.html
au BufNewFile *.html set ft=php.html

" PHP
:let g:PHP_default_indenting=1

" EasyMotion
let g:EasyMotion_leader_key = '<Leader>m'
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

" TagBar
nnoremap <silent> <F2> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_autoshowtag = 1
" CamelCaseMotion
map <C-w> <Plug>CamelCaseMotion_w
map <C-b> <Plug>CamelCaseMotion_b
map <C-e> <Plug>CamelCaseMotion_e

