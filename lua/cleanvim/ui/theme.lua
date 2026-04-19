local M = {}

local theme_map = {
    ["catppuccin"] = "catppuccin",
    ["catppuccin-latte"] = "catppuccin",
    ["cyberdream"] = "cyberdream",
    ["ethereal"] = "ethereal",
    ["everforest"] = "everforest",
    ["flexoki"] = "flexoki",
    ["gruvbox"] = "gruvbox",
    ["hackerman"] = "hackerman",
    ["kanagawa"] = "kanagawa",
    ["lumon"] = "lumon",
    ["matteblack"] = "matteblack",
    ["miasma"] = "miasma",
    ["monokai-pro"] = "monokai-pro",
    ["nord"] = "nordfox",
    ["osaka-jade"] = "bamboo",
    ["retro-82"] = "retro-82",
    ["ristretto"] = "monokai-pro",
    ["rose-pine"] = "rose-pine-moon",
    ["tokyonight"] = "tokyonight-night",
    ["vantablack"] = "vantablack",
    ["white"] = "white",
    ["bamboo"] = "bamboo",
}

M.setup = function()
    local theme_file = vim.g.cleanvim_theme or "catppuccin"
    local colorscheme = theme_map[theme_file] or theme_file
    
    local colors_ok, err = pcall(vim.cmd.colorscheme, colorscheme)
    if not colors_ok then
        vim.cmd.colorscheme("default")
        print("Cleanvim: Theme '" .. colorscheme .. "' not found, using default. Error: " .. (err or ""))
    end
end

return M