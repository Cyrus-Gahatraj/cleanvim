local M = {}

M.setup = function()
    local theme_name = vim.g.cleanvim_theme or "catppuccin"
    local loader_ok, loader = pcall(require, "lazy.core.loader")
	local config_ok, config = pcall(require, "lazy.core.config")

    if loader_ok and config_ok then
		if config.plugins[theme_name] then
			pcall(loader.load, { theme_name }, { reason = "UI Config" })
		end
    end

    local colors_ok, _ = pcall(vim.cmd.colorscheme, theme_name)
    if not colors_ok then
        vim.cmd.colorscheme("default")
        print("Cleanvim: Theme '" .. theme_name .. "' not found, using fallback.")
    end
end

return M
