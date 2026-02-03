return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps",
    },
  },
  config = function()
	  require("which-key").setup({
		  delay = 500,
		  preset = "helix",
	  })
  end,
}
