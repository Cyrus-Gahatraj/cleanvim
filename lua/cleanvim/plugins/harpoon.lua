return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    keys = {
        { "<leader>ha", function() require("harpoon"):list():add() end, desc = "Harpoon add file" },
        { "<C-e>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon Menu" },

        -- Individual file navigation
        { "<leader>h1", function() require("harpoon"):list():select(1) end, desc = "Harpoon file 1" },
        { "<leader>h2", function() require("harpoon"):list():select(2) end, desc = "Harpoon file 2" },
        { "<leader>h3", function() require("harpoon"):list():select(3) end, desc = "Harpoon file 3" },
        { "<leader>h4", function() require("harpoon"):list():select(4) end, desc = "Harpoon file 4" },
        { "<leader>h5", function() require("harpoon"):list():select(5) end, desc = "Harpoon file 5" },

        -- Cycle through the list
        { "<leader>hn", function() require("harpoon"):list():next() end, desc = "Harpoon next" },
        { "<leader>hp", function() require("harpoon"):list():prev() end, desc = "Harpoon prev" },
    },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup({
            settings = {
                save_on_toggle = true,
            },
        })
    end,
}

