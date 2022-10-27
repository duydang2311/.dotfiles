require('lualine').setup{
	options = {
		theme = 'codedark',
		lower = true,
		section_separators = {'', ''},
		component_separators = {'', ''},
	},
	sections = {
		lualine_a = {{ 'mode', lower = false }},
		lualine_b = { 
			{
				'diff',
				colored = true, -- displays diff status in color if set to true
				-- all colors are in format #rrggbb
				color_added = nil, -- changes diff's added foreground color
				color_modified = nil, -- changes diff's modified foreground color
				color_removed = nil, -- changes diff's removed foreground color
				symbols = {added = '+', modified = '~', removed = '-'} -- changes diff symbols
			},
			'branch'
		},
		lualine_c = { { 'filename', lower = false } , require'lsp-status'.status },
		lualine_x = { 'fileformat' },
		lualine_y = { 'encoding', 'hostname' },
		lualine_z = { 'location' }
	},
	inactive_sections = {
		lualine_a = { 
			{
				'diff',
				colored = true,
				color_added = nil,
				color_modified = nil,
				color_removed = nil,
				symbols = {added = '+', modified = '~', removed = '-'}
			},
			'branch'
		},
		lualine_c = { { 'filename', lower = false } },
		lualine_x = { 'fileformat' },
		lualine_y = { 'encoding', 'hostname' },
		lualine_z = { 'location' }
	},
	extensions = { 'chadtree', 'fzf' }
}
