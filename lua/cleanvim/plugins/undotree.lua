return {
  "jiaoshijie/undotree",
  opts = {},
   config = function()
	  vim.keymap.set("n", "<leader>u", require('undotree').toggle, {
		  desc = "Undo tree"
	  })
  end
}
