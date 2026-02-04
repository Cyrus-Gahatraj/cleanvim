local M = {}

M.setup = function()
	local view_type = vim.g.view_diagnostic
	local severity = vim.diagnostic.severity

	local config = {
		virtual_text = (view_type == "text-and-sign" or view_type == "only-text") and {
			prefix = '●',
			spacing = 4,
		} or false,

		signs = (view_type == "text-and-sign" or view_type == "only-sign") and {
            text = {
                [severity.ERROR] = " ",
                [severity.WARN] = " ",
                [severity.HINT] = "󰠠 ",
                [severity.INFO] = " ",
            },
        } or false,

		float = { border = "rounded" },
		update_in_insert = false,
	}

	vim.diagnostic.config(config)
end

return M
