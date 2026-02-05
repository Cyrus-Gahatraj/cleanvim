local M = {}

local state = {
	floating = {
		buf = -1,
		win = -1,
	}
}

local function create_floating_window(opts)
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

local add_plugin = function()
	if not vim.api.nvim_win_is_valid(state.floating.win) then
		state.floating = create_floating_window { buf = state.floating.buf }
		if vim.bo[state.floating.buf].buftype ~= "acwrite" then
			local ok, oil = pcall(require, "oil")
			if ok then
				oil.open(vim.fn.stdpath("config") .. "/lua/cleanvim/custom/plugins")
				print("add custom plugins")
			end
		end
	else
		vim.api.nvim_win_hide(state.floating.win)
	end
end

vim.api.nvim_create_user_command("AddPlugin", add_plugin, {})
vim.keymap.set("n", "<leader>ap", add_plugin, {
	desc = "Add plugin"
})

local ok, wk = pcall(require, "which-key")

if ok then
	wk = require("which-key")
	wk.add({
		{ "<leader>a", group = "Add stuffs" },
	})
end

return M
