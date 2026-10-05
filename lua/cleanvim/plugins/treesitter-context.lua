return {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        max_lines = 3,
    },
    keys = {
        { "<leader>tc", "<cmd>TSContext toggle<CR>", desc = "Toggle code context" },
    },
}
