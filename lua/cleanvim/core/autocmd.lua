local number_tweak = vim.api.nvim_create_augroup("NumberTweak", { clear = true })

-- Turn OFF relative numbers when entering the command line
vim.api.nvim_create_autocmd("CmdlineEnter", {
	group = number_tweak,
	callback = function()
		if vim.wo.relativenumber then
			vim.b.restorable_relativenumber = true
			vim.opt.relativenumber = false
			vim.cmd("redraw")
		end
	end
})

-- Turn ON relative numbers when leaving the command line
vim.api.nvim_create_autocmd("CmdlineLeave", {
	group = number_tweak,
	callback = function()
		if vim.b.restorable_relativenumber then
			vim.opt.relativenumber = true
			vim.b.restorable_relativenumber = false
		end
	end
})
