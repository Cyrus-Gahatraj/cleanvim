local M = {}

vim.api.nvim_create_autocmd("User", {
    pattern = "LazyDone",
    once = true,
    callback = function()
        require("cleanvim.plugins.builtin.add.custom_add")
        require("cleanvim.plugins.builtin.switchers.theme_switcher")
        require("cleanvim.plugins.builtin.switchers.diagnostic_switcher")
        require("cleanvim.plugins.builtin.toggle.transparency")
        require("cleanvim.plugins.builtin.toggle.formatter")
        require("cleanvim.plugins.builtin.toggle.terminal")
    end,
})

return M;
