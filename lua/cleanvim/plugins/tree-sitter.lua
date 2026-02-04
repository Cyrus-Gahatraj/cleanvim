return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  opts = {
	  ensure_installed = {
		  "vim",
		  "help",
		  "lua",
		  "markdown",
		  "bash",
		  "c",
	  },
	  sync_install = false,
	  indent = { enable = true },
	  highlight = {
		  enable = true,
		  additional_vim_regex_highlighting = false,
	  },
	  auto_install = true,
	}
}
