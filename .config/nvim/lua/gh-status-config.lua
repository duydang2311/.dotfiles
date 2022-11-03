local gh_status = require'gh-status'

gh_status.setup({
	username = "duydang2311",
	token = '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'
})

vim.keymap.set('n', '<leader>gh', function()
	gh_status.changeUserStatus('editing ' .. vim.fn.expand('%:t'))
end, { noremap = true, silent = false })
