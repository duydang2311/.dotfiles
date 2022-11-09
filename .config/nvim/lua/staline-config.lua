require "staline".setup {
	sections = {
		left = { '  ', 'mode', ' ', 'file_name', ' ', 'branch'},
		mid = {'lsp'},
		right = {'lsp_name', 'line_column' }
	},
	mode_colors = {
		i = "#d4be98",
		n = "#84a598",
		c = "#8fbf7f",
		v = "#fc802d",
	},
	defaults = {
		true_colors = true,
		line_column = " [%l/%L] :%c  ",
		branch_symbol = " "
	}
}

