-- One icon set for everything: plugins asking for nvim-web-devicons get mini.icons
return {
    "nvim-mini/mini.icons",
    version = false,
    lazy = true,
    opts = {},
    init = function()
        package.preload["nvim-web-devicons"] = function()
            require("mini.icons").mock_nvim_web_devicons()
            return package.loaded["nvim-web-devicons"]
        end
    end,
}
