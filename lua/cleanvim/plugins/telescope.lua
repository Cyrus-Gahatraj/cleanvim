return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    keys = {
        { '<leader>ff', "<cmd>Telescope find_files<cr>", desc = 'Find files' },
        { '<leader>fg',  "<cmd>Telescope live_grep<cr>", desc = 'Live grep' },
        { '<leader>gf', "<cmd>Telescope git_files<cr>", desc = 'Git file' },
        { '<leader>fh', "<cmd>Telescope help_tags<cr>", desc = 'Help tags' },
        { '<leader>fc', function()
            require('telescope.builtin').find_files { cwd = vim.fn.stdpath("config") }
        end, desc = 'Config folder' },
    },
    config = function()
        local telescope = require('telescope')

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-h>"] = "which_key",
                    },
                },
            },
            extensions = {
                fzf = {}
            },
        })

        telescope.load_extension('fzf')
    end,
}
