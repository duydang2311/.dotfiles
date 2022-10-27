require('bufferline').setup {
	options = {
		close_command = "bdelete! %d",
		right_mouse_command = "bdelete! %d",
		left_mouse_command = "buffer %d",
		middle_mouse_command = nil,
		indicator_icon = '▎',
		buffer_close_icon = '',
		modified_icon = '●',
		close_icon = '',
		left_trunc_marker = '',
		right_trunc_marker = '',
		name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
			if buf.name:match('%.md') then
				return vim.fn.fnamemodify(buf.name, ':t:r')
			end
		end,
		max_name_length = 18,
		max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
		tab_size = 18,
		diagnostics = 'nvim_lsp', 
		diagnostics_update_in_insert = false,
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			return "("..count..")"
		end,
		show_buffer_icons = true,
		show_buffer_close_icons = true, 
		show_close_icon = true,
		show_tab_indicators = true,
		persist_buffer_sort = true,
		separator_style = { '|', '' },
		enforce_regular_tabs = false,
		always_show_bufferline = true,
		offsets = {
			{
				filetype = "nerdtree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "left"
			}
		}
	},
	highlights = {
		close_button = { 
			guibg = 'Normal'
		},
		close_button_visible = {
			guibg = 'Normal'
		},
		close_button_selected = {
			guibg = 'Normal'
		}
	},
		custom_areas = {
			right = function()
				local result = {}
				local error = vim.lsp.diagnostic.get_count(0, [[Error]])
				local warning = vim.lsp.diagnostic.get_count(0, [[Warning]])
				local info = vim.lsp.diagnostic.get_count(0, [[Information]])
				local hint = vim.lsp.diagnostic.get_count(0, [[Hint]])

				if error ~= 0 then
					table.insert(result, {text = "  " .. error, guifg = "#EC5241"})
				end

				if warning ~= 0 then
					table.insert(result, {text = "  " .. warning, guifg = "#EFB839"})
				end

				if hint ~= 0 then
					table.insert(result, {text = "  " .. hint, guifg = "#A3BA5E"})
				end

				if info ~= 0 then
					table.insert(result, {text = "  " .. info, guifg = "#7EA9A7"})
				end
				return result
			end,
		}
}
