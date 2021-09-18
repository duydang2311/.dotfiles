local cmp = require'cmp'

cmp.setup {
	preselect = cmp.PreselectMode.Item,
	completion = {
		completeopt = 'menuone,noselect,preview'
	},
	snippet = {
		expand = function(args)
			vim.fn['vsnip#anonymous'](args.body)
		end,
	},
	mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<C-y>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		})
	},
	sources = {
		{ name = 'nvim_lsp' },
		-- { name = 'path' }
	},
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = require('lspkind').presets.default[vim_item.kind] .. ' ' .. vim_item.kind

			vim_item.menu = ({
				nvim_lsp = '[LSP]',
				path = '[Path]',
			})[entry.source.name]
			return vim_item
		end,
	},
}
