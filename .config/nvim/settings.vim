syntax on
filetype on
filetype plugin on
filetype indent on
set encoding=UTF-8
set termguicolors
set t_Co=256
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftwidth=4
set smarttab
set noexpandtab
set listchars=tab:\ \ ,trail:·,nbsp:⚋
set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾
set list
set relativenumber
set laststatus=2
set signcolumn=yes
set mouse=a
set clipboard=unnamedplus
set nocompatible
set noswapfile
set nobackup
set autoindent
set display+=lastline
set lazyredraw
set wrap
set wildmenu
set wildchar=<TAB>
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set autoread
set backspace=indent,eol,start
set nomodeline
set noshowmode
set noerrorbells
set visualbell
set noignorecase
set smartcase
set updatetime=100
set scrolloff=4
set sidescroll=1
set sidescrolloff=7
set scroll=4

" autocmd WinScrolled * set scroll=4

let g:solarized_termtrans = 1

let g:svelte_preprocessors = ['typescript']

set background=dark
colorscheme solarized8_flat

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'cd '.argv()[0] | endif

