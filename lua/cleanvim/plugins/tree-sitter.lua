-- No parsers are installed up front: Neovim bundles c, lua, markdown, query,
-- vim and vimdoc, and core/autocmd.lua installs any other on first use.
return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
}
