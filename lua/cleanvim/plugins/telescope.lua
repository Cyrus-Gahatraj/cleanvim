return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
        { "<leader>gf", "<cmd>Telescope git_files<cr>", desc = "Git file" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
        { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
        { "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Grep word under cursor" },
        { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
        { "<leader>f.", "<cmd>Telescope resume<cr>", desc = "Resume last search" },
        {
            "<leader>fc",
            function() require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") }) end,
            desc = "Config folder",
        },
    },
    config = function()
        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-h>"] = "which_key",
                    },
                },
                -- Lua patterns: %f[%w] anchors to a path segment start
                file_ignore_patterns = {
                    "%f[%w]node_modules/",
                    "^%.git/",
                    "%f[%w]dist/",
                    "%f[%w]build/",
                    "%f[%w]coverage/",
                    "%.next/",
                    "%.cache/",
                    "__pycache__/",
                    "%f[%w]venv/",
                    "%f[%w]target/",
                    "%.o$",
                    "%.so$",
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
            },
            extensions = {
                fzf = {},
            },
        })

        telescope.load_extension("fzf")
    end,
}
