return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                theme = "auto",
                component_separators = { left = "|", right = "|" },
                section_separators = { left = "", right = "" },
                globalstatus = true,
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = {
                    {
                        "buffers",
                        show_filename_only = true,
                        hide_filename_extension = true,
                        show_modified_status = true,
                        mode = 0,
                        max_length = vim.o.columns * 2 / 3,
                        symbols = {
                            modified = " ●",
                            alternate_file = "",
                            directory = "",
                        },
                    },
                },
                lualine_x = { "diagnostics", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        })
    end,
}
