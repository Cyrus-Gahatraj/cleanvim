local M = {}

local function apply_transparent()
    local nvim_hl = {
        "Normal",
        "NormalFloat",
        "FloatBorder",
        "Pmenu",
        "PmenuThumb",
        "PmenuSbar",
        "Terminal",
        "EndOfBuffer",
        "FoldColumn",
        "Folded",
        "SignColumn",
        "NormalNC",
        "TelescopeBorder",
        "TelescopeNormal",
        "TelescopePromptBorder",
        "TelescopePromptTitle",
        "WhichKeyFloat",
        "BlinkCmpMenu",
        "BlinkCmpMenuBorder",
        "BlinkCmpScrollBarGutter",
        "BlinkCmpDoc",
        "BlinkCmpDocBorder",
    }
    for _, name in ipairs(nvim_hl) do
        -- keep fg/bold/etc., only drop the background
        local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
        hl.bg, hl.ctermbg = nil, nil
        vim.api.nvim_set_hl(0, name, hl)
    end
end

M.setup = function()
    vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
            if vim.g.transparency then apply_transparent() end
        end,
    })
    if vim.g.transparency then apply_transparent() end
end

return M
