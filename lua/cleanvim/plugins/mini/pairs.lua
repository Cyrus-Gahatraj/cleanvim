return {
    'nvim-mini/mini.pairs', version = false,
    event = "VeryLazy",
    config = function()
        require("mini.pairs").setup()
    end
}
