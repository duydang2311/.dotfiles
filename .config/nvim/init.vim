let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

call plug#begin()

Plug 'nvim-lua/plenary.nvim'
Plug 'junegunn/vim-easy-align'

Plug 'ryanoasis/vim-devicons'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'folke/trouble.nvim'
Plug 'onsails/lspkind.nvim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'tpope/vim-commentary'
Plug 'windwp/nvim-autopairs'

Plug 'mhinz/vim-startify'

Plug 'lifepillar/vim-solarized8'

Plug 'airblade/vim-gitgutter'
Plug 'f-person/git-blame.nvim'

Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

Plug 'mg979/vim-visual-multi'
Plug 'voldikss/vim-floaterm'
Plug 'xiyaowong/nvim-transparent'
Plug 'akinsho/bufferline.nvim'

call plug#end()

so ~/.config/nvim/settings.vim
so ~/.config/nvim/maps.vim
so ~/.config/nvim/git-blame.vim

lua require('nvim-cmp-config')
lua require('lualine-config')
lua require('nvim-tree-config')
lua require('trouble-config')
lua require('transparent-config')
lua require('bufferline-config')
lua require('nvim-autopairs-config')

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'cd '.argv()[0] | endif
