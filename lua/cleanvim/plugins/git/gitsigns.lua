return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("gitsigns").setup({
            preview_config = {
                border = "rounded",
                style = "minimal",
                relative = "cursor",
                row = 0,
                col = 1,
            },
        })

        -- Hunk navigation (h is free in mini.bracketed)
        vim.keymap.set(
            "n",
            "]h",
            function() require("gitsigns").nav_hunk("next") end,
            { desc = "Next hunk" }
        )
        vim.keymap.set(
            "n",
            "[h",
            function() require("gitsigns").nav_hunk("prev") end,
            { desc = "Prev hunk" }
        )
        vim.keymap.set(
            "n",
            "<leader>gS",
            "<cmd>Gitsigns stage_hunk<CR>",
            { desc = "Git stage hunk" }
        )

        -- Git preview commands
        vim.keymap.set(
            "n",
            "<leader>gph",
            "<cmd>Gitsigns preview_hunk<CR>",
            { desc = "Git preview hunk" }
        )
        vim.keymap.set(
            "n",
            "<leader>gpr",
            "<cmd>Gitsigns reset_hunk<CR>",
            { desc = "Git reset hunk" }
        )
        vim.keymap.set(
            "n",
            "<leader>gB",
            "<cmd>Gitsigns toggle_current_line_blame<CR>",
            { desc = "Toggle blame" }
        )
    end,
}
