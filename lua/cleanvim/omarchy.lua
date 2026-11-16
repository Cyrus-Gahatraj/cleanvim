-- Omarchy integration: follow the desktop theme while running under Omarchy.
--
-- Omarchy renders the active theme into ~/.local/state/omarchy/current:
--   theme.name             the theme name, e.g. "tokyo-night"
--   theme/colors.toml      the palette every themed app is drawn with
--   theme/neovim.lua       the lazy.nvim spec Omarchy generates for Neovim
--
-- Cleanvim reads those files instead of keeping a copy, so switching the
-- desktop theme switches the editor theme with it.
local M = {}

local current = vim.fn.expand("~/.local/state/omarchy/current")

-- The plugin Omarchy picks for a theme -> the cleanvim theme module that loads
-- that plugin. Omarchy's generic themes ship a palette instead of a plugin and
-- are drawn with aether, which needs no entry here.
local theme_modules = {
    ["ribru17/bamboo.nvim"] = "bamboo",
    ["catppuccin/nvim"] = "catppuccin",
    ["scottmckendry/cyberdream.nvim"] = "cyberdream",
    ["bjarneo/ethereal.nvim"] = "ethereal",
    ["neanias/everforest-nvim"] = "everforest",
    ["kepano/flexoki-neovim"] = "flexoki",
    ["ellisonleao/gruvbox.nvim"] = "gruvbox",
    ["rebelot/kanagawa.nvim"] = "kanagawa",
    ["loctvl842/monokai-pro.nvim"] = "monokai-pro",
    ["EdenEast/nightfox.nvim"] = "nord",
    ["rose-pine/neovim"] = "rose-pine",
    ["folke/tokyonight.nvim"] = "tokyonight",
}

local function read(path)
    local ok, lines = pcall(vim.fn.readfile, path)
    if not ok or #lines == 0 then return nil end
    return table.concat(lines, "\n")
end

-- The spec Omarchy renders names the plugin and colorscheme a theme was built
-- around, and carries the palette for its generic aether themes.
local function scan_spec()
    local chunk = loadfile(current .. "/theme/neovim.lua")
    if not chunk then return nil, nil, nil end

    local ok, plugins = pcall(chunk)
    if not ok or type(plugins) ~= "table" then return nil, nil, nil end

    local plugin, colorscheme, colors
    for _, entry in ipairs(plugins) do
        if type(entry) == "table" then
            if type(entry[1]) == "string" and theme_modules[entry[1]] then plugin = entry[1] end
            if type(entry.opts) == "table" then
                colorscheme = entry.opts.colorscheme or colorscheme
                colors = entry.opts.colors or colors
            end
        end
    end
    return plugin, colorscheme, colors
end

-- colors.toml is a flat `key = "#rrggbb"` file, the shape aether's colors
-- option expects. Non-colour keys such as `mode` simply don't match.
local function palette()
    local colors_toml = read(current .. "/theme/colors.toml") or ""
    local colors = {}
    for key, value in colors_toml:gmatch('([%w_]+)%s*=%s*"(#%x+)"') do
        colors[key] = value
    end
    return next(colors) and colors or nil
end

M.name = function()
    local name = read(current .. "/theme.name")
    return name and vim.trim(name) or nil
end

-- Off when not inside Omarchy, or when the user turned the sync off.
M.enabled = function()
    if M.name() == nil then return false end
    return require("cleanvim.config.state").load().omarchy_sync ~= false
end

-- -> { name, module, colorscheme, colors? } for the active desktop theme.
M.theme = function()
    local name = M.name()
    if name == nil then return nil end

    local plugin, colorscheme, colors = scan_spec()

    if plugin and colorscheme then
        return { name = name, module = theme_modules[plugin], colorscheme = colorscheme }
    end

    -- A theme either ships a plugin cleanvim does not track, or Omarchy draws
    -- it generically. Both still have a palette, so draw them with aether.
    return {
        name = name,
        module = "aether",
        colorscheme = "aether",
        colors = colors or palette(),
    }
end

M.apply = function(theme)
    theme = theme or M.theme()
    if theme == nil then return false end

    vim.g.cleanvim_theme = theme.colorscheme

    -- aether keeps its palette in setup() options, so a loaded instance has to
    -- see the new one before the colorscheme reads it again. On first load the
    -- theme spec below takes the palette straight from vim.g.
    if theme.module == "aether" then
        vim.g.cleanvim_omarchy_colors = theme.colors
        local ok, aether = pcall(require, "aether")
        if ok and theme.colors then aether.setup({ colors = theme.colors }) end
    end

    local ok, err = pcall(vim.cmd.colorscheme, theme.colorscheme)
    if not ok then
        vim.notify(
            "Cleanvim: Omarchy theme '" .. theme.name .. "' failed: " .. tostring(err),
            vim.log.levels.WARN
        )
    end
    return ok
end

-- Omarchy rewrites `theme` and `theme.name` inside `current`, so the directory
-- is the stable thing to watch. One switch touches several files, hence the
-- debounce.
local watcher, pending

M.follow = function()
    if watcher or vim.fn.isdirectory(current) == 0 then return end

    watcher = vim.uv.new_fs_event()
    if watcher == nil then return end

    local ok = watcher:start(current, {}, function(err, filename)
        if err or (filename and not filename:find("^theme")) then return end
        vim.schedule(function()
            if pending or not M.enabled() then return end
            pending = vim.defer_fn(function()
                pending = nil
                M.apply()
            end, 250)
        end)
    end)

    if not ok then
        watcher:close()
        watcher = nil
    end
end

-- Follow the desktop theme. Returns false when cleanvim should use its own.
M.start = function()
    if not M.enabled() then return false end

    local theme = M.theme()
    if theme == nil then return false end

    M.apply(theme)
    M.follow()
    return true
end

return M
