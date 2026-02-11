return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Harpoon add file" })

        -- Enable if you want harpoon menu with telescope
        -- local has_telescope, telescope = pcall(require, "telescope")
        -- if has_telescope then
        --     telescope.load_extension('harpoon')
        --     vim.keymap.set("n", "<C-e>", telescope.extensions.harpoon.marks, { desc = "Harpoon Telescope Menu" })
        -- else
        --     vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon Menu" })
        -- end
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon Menu" })

        -- Navigate files
        for i = 1, 5 do
            vim.keymap.set("n", "<leader>h" .. i, function()
                harpoon:list():select(i)
            end, { desc = "Harpoon file " .. i })
        end

		vim.keymap.set("n", "<leader>hn", function()
			harpoon:list():next()
		end, { desc = "Harpoon next" })

		vim.keymap.set("n", "<leader>hp", function()
			harpoon:list():prev()
		end, { desc = "Harpoon prev" })
    end,
}

