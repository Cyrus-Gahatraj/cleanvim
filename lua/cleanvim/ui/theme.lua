local M = {}

M.setup = function()
    local theme_name = vim.g.cleanvim_theme
    local loader_ok, loader = pcall(require, "lazy.core.loader")
    if loader_ok then
        pcall(loader.load, { theme_name }, { reason = "UI Config" })
    end

    local colors_ok, _ = pcall(vim.cmd.colorscheme, theme_name)
    if not colors_ok then
        vim.cmd.colorscheme("state")
        print("Cleanvim: Theme '" .. theme_name .. "' not found, using fallback.")
    end
end

return M
