local _, saved = pcall(require, "cleanvim.config.save_state")

vim.g.mapleader = " "
vim.g.cleanvim_theme =  saved.theme
vim.g.transparency = true

-- Available options: "text-and-sign", "only-text", and "only-sign"
vim.g.view_diagnostic = "text-and-sign"
