local M = {}

local function apply_transparent()
	local nvim_hl = {
		"Normal", "NormalFloat", "FloatBorder", "Pmenu", "Terminal",
		"EndOfBuffer", "FoldColumn", "Folded", "SignColumn", "NormalNC",
		"TelescopeBorder", "TelescopeNormal", "TelescopePromptBorder", "TelescopePromptTitle",
		"WhichKeyFloat",
	}
	for _, hl in ipairs(nvim_hl) do
		vim.api.nvim_set_hl(0, hl, { bg = "none" })
	end
end

M.setup = function()
	if not vim.g.transparency then
		return
	end
	vim.api.nvim_create_autocmd("ColorScheme", {
		callback = function()
			apply_transparent()
		end,
	})
	apply_transparent()
end

return M
