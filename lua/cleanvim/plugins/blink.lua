return {
	'saghen/blink.cmp',
	dependencies = { 'rafamadriz/friendly-snippets' },
    event = "InsertEnter",
	version = '1.*',
	opts = {
		keymap = {
			preset = 'default',
		},
		appearance = {
			nerd_font_variant = 'mono'
		},
		completion = {
			documentation = {
				auto_show = false,
			},
			menu = {
				border = "rounded",
			},
		},
		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
		},
		signature = { enabled = true },
	},
}

