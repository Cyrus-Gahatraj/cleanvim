return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        -- main branch: setup() no longer takes ensure_installed/highlight/indent
        require("nvim-treesitter").install({
            "vim",
            "vimdoc",
            "lua",
            "markdown",
            "bash",
            "c",
        })
    end,
}
