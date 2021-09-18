call plug#begin('~/.vim/plugged')

Plug 'nvim-lua/plenary.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/vim-vsnip'
" Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
" Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'
Plug 'tpope/vim-commentary'
Plug 'windwp/nvim-autopairs'
" Plug 'nvim-lua/lsp-status.nvim'
" Plug 'mhinz/vim-signify'
Plug 'arzg/vim-colors-xcode'
Plug 'onsails/lspkind-nvim'
Plug 'jdhao/better-escape.vim'
Plug 'psliwka/vim-smoothie'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'mileszs/ack.vim'
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'vimsence/vimsence'
Plug 'voldikss/vim-floaterm'
Plug 'xiyaowong/nvim-transparent'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'lewis6991/gitsigns.nvim'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

let g:python3_host_prog = $HOME."/AppData/Local/Programs/Python/Python39/python.exe"

so ~/.config/nvim/default.vim
so ~/.config/nvim/chadtree.vim
so ~/.config/nvim/bufferline.vim
" so ~/.config/nvim/signify.vim
so ~/.config/nvim/fzf.vim
so ~/.config/nvim/better-escape.vim
so ~/.config/nvim/nerdtree.vim
so ~/.config/nvim/nerdtree-git.vim
so ~/.config/nvim/floaterm.vim
so ~/.config/nvim/vim-svelte-plugin.vim
so ~/.config/nvim/nvim-cmp.vim
so ~/.config/nvim/xcode-theme.vim

lua require('transparent-cfg')
lua require('nvim-cmp')
lua require('ts-lsp')
lua require('svelte-lsp')
" lua require('css-lsp')
lua require('omnisharp-lsp')
lua require('buffer-line')
" lua require('lua-line')
lua require('auto-pairs')
lua require('galaxy-line')
lua require('git-signs')

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'cd '.argv()[0] | endif

