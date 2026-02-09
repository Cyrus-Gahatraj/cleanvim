local M = {}
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

local save = require("cleanvim.plugins.builtin.save_state")

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
					local path = vim.fn.stdpath("config") .. "/lua/cleanvim/config/save_state/theme.lua"
					save({
						path = path,
						return_state = string.format('return "%s"', theme_name),
					})
				else
					print("Error applying colorscheme: " .. err)
				end
			end)
			return true
		end,
	})
end


vim.keymap.set("n", "<leader>sth", function()
	apply_theme()
end, { desc = "Switch theme" })

return M
