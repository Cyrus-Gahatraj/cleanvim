local M = {}
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

local save_theme = function(theme)
	local path = vim.fn.stdpath("config") .. "/lua/cleanvim/config/save_state/theme.lua"
	local f = io.open(path, "w")
	if f then
		f:write(string.format('return "%s"', theme))
		f:close()
	else
		print("Error: Could not open path " .. path)
	end
end

local apply_theme = function()
	builtin.find_files({
		cwd = vim.fn.stdpath("config") .. "/lua/cleanvim/plugins/themes",
		attach_mappings = function(prompt_bufnr, _)
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local selection = action_state.get_selected_entry()
				if not selection then return end
				local theme_name = vim.fn.fnamemodify(selection[1], ":r")
				local ok, err = pcall(vim.cmd, "colorscheme " .. theme_name)
				if ok then
					save_theme(theme_name)
				else
					print("Error applying colorscheme: " .. err)
				end
			end)
			return true
		end,
	})
end

local apply = function()
	apply_theme()
end

vim.keymap.set("n", "<leader>st", function()
	apply()
end, { desc = "Switch theme" })

local ok, wk = pcall(require, "which-key")
if ok and wk.add then
    wk.add({ { "<leader>s", group = "Switch stuffs" } })
end

return M
