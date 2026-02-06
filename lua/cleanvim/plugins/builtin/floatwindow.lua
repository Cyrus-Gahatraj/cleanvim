return {
	create_floating_window = function(opts)
		opts = opts or {}
		local columns = vim.o.columns
		local lines = vim.o.lines

		local width = opts.width or math.floor(columns * 0.8)
		local height = opts.height or math.floor(lines * 0.8)

		local col = math.floor((columns - width) / 2)
		local row = math.floor((lines - height) / 2)

		local buf = nil
		if vim.api.nvim_buf_is_valid(opts.buf) then
			buf = opts.buf
		else
			buf = vim.api.nvim_create_buf(false, true)
		end

		local win_opts = {
			relative = "editor",
			width = width,
			height = height,
			col = col,
			row = row,
			style = "minimal",
			border = opts.border or "rounded",
		}

		local win = vim.api.nvim_open_win(buf, true, win_opts)
		return {
			buf = buf,
			win = win,
		}
	end
}
