local M = {}

M.states = {}

function M.register(name)
	M.states[name] = { floating = { buf = -1, win = -1 } }
	return M.states[name]
end

function M.any_open()
	for _, s in pairs(M.states) do
		if vim.api.nvim_win_is_valid(s.floating.win) then
			return true
		end
	end
	return false
end

function M.close_all()
	for _, s in pairs(M.states) do
		if vim.api.nvim_win_is_valid(s.floating.win) then
			vim.api.nvim_win_hide(s.floating.win)
			s.floating.win = -1
		end
	end
end

function M.toggle(state, open_fn)
	if not vim.api.nvim_win_is_valid(state.floating.win) then
		if M.any_open() then
			M.close_all()
		end
		open_fn(state)
	else
		M.close_all()
	end
end

return M
