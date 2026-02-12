local _, saved = pcall(require, "cleanvim.config.save_state")

vim.g.mapleader = " "
vim.g.cleanvim_theme =  saved.theme
vim.g.transparency = saved.transparency

-- Available options: "text-and-sign", "only-text", and "only-sign"
vim.g.view_diagnostic = saved.view_diagnostic

vim.g.format_on_save = saved.format_on_save
