local M = {}

local create_floating_window =  require(
	"cleanvim.plugins.builtin.floatwindow"
).create_floating_window

local fm = require("cleanvim.plugins.builtin.floatmanager")
local terminal = fm.register("terminal")

local toggle_term = function()
	fm.toggle(terminal, function(state)
		state.floating = create_floating_window({ buf = state.floating.buf })
		if vim.bo[state.floating.buf].buftype ~= "terminal" then
			vim.cmd.terminal()
			local term_buf = vim.api.nvim_get_current_buf()
            vim.bo[term_buf].buflisted = false
            vim.bo[term_buf].bufhidden = "hide"
            vim.bo[term_buf].swapfile = false

            vim.api.nvim_buf_set_name(term_buf, "term://cleanvim/float")
        end

        -- Directly in insert mode
        vim.cmd("startinsert")
	end)
end

vim.api.nvim_create_user_command("ToggleTerm", toggle_term, {})
vim.keymap.set("n", "<leader>tt", function()
	toggle_term()
end, { desc = "Toggle terminal" })

-- Exit terminal mode through <esc> key
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Another option for escaping terminal
-- vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-n>", { desc = "Exit terminal mode" })


return M
