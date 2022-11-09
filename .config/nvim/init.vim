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

" Plug '~/programming/gh-status.nvim'
Plug 'duydang2311/gh-status.nvim'

Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte'

Plug 'echasnovski/mini.starter'

" Plug 'brenoprata10/nvim-highlight-colors'
" Plug 'folke/twilight.nvim'

Plug 'lewis6991/impatient.nvim'
Plug 'declancm/cinnamon.nvim'

Plug 'lervag/vimtex'

call plug#end()

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

so ~/.config/nvim/maps.vim
so ~/.config/nvim/git-blame.vim
so ~/.config/nvim/settings.vim

lua require('impatient-config')
lua require('nvim-cmp-config')
lua require('lualine-config')
lua require('nvim-tree-config')
lua require('trouble-config')
lua require('transparent-config')
lua require('bufferline-config')
lua require('nvim-autopairs-config')
lua require('gh-status-config')
lua require('mini-starter-config')
" lua require('nvim-highlight-colors-config')
" lua require('twilight-config')
lua require('cinnamon-config')

