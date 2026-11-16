return {
    "bjarneo/aether.nvim",
    branch = "v3",
    name = "aether",
    lazy = true,
    priority = 1000,
    -- Omarchy's generic themes are drawn from the desktop palette, which
    -- cleanvim.omarchy copies here before loading the colorscheme.
    opts = function() return { colors = vim.g.cleanvim_omarchy_colors or {} } end,
}
