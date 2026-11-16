local M = {}

-- Theme files whose name differs from the colorscheme they load
local theme_map = {
    ["nord"] = "nordfox",
    ["rose-pine"] = "rose-pine-moon",
    ["tokyonight"] = "tokyonight-night",
}

M.colorscheme_for = function(theme_file) return theme_map[theme_file] or theme_file end

M.setup = function()
    -- Under Omarchy the desktop owns the theme, so it wins over the saved one
    if require("cleanvim.omarchy").start() then return end

    local colorscheme = M.colorscheme_for(vim.g.cleanvim_theme or "catppuccin")

    local colors_ok, err = pcall(vim.cmd.colorscheme, colorscheme)
    if not colors_ok then
        vim.cmd.colorscheme("default")
        print(
            "Cleanvim: Theme '"
                .. colorscheme
                .. "' not found, using default. Error: "
                .. (err or "")
        )
    end
end

return M
