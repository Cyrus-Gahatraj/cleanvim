return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "VeryLazy",
    opts = {
        indent = {
            char = "│",
        },
        scope = {
            -- true: if don't like global indent
            enabled = false,
        },
    },
}
