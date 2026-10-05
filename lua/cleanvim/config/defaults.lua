local saved = require("cleanvim.config.state").load()

vim.g.mapleader = " "
vim.g.cleanvim_theme = saved.theme
vim.g.transparency = saved.transparency
vim.g.view_diagnostic = saved.view_diagnostic
vim.g.format_on_save = saved.format_on_save
