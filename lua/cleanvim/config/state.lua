-- Persisted user state, kept outside the config repo so it never dirties git
local M = {}

local path = vim.fn.stdpath("state") .. "/cleanvim.json"

local defaults = {
	theme = "catppuccin",
	transparency = true,
	format_on_save = false,
	-- Available options: "text-and-sign", "only-text", "only-sign" and "none"
	view_diagnostic = "text-and-sign",
}

M.load = function()
	local ok, data = pcall(function()
		return vim.json.decode(table.concat(vim.fn.readfile(path), "\n"))
	end)
	return vim.tbl_extend("force", defaults, ok and type(data) == "table" and data or {})
end

M.set = function(key, value)
	local data = M.load()
	data[key] = value
	vim.fn.mkdir(vim.fn.fnamemodify(path, ":h"), "p")
	if vim.fn.writefile({ vim.json.encode(data) }, path) ~= 0 then
		vim.notify("Cleanvim: could not write " .. path, vim.log.levels.ERROR)
	end
end

return M
