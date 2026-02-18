return {
  "folke/trouble.nvim",
  opts = {
      auto_open = false,
      auto_close = true,
      focus = false,
      follow = false,
      restore = false,
      auto_preview = false,

      win = {
          position = "bottom",
          height = 10,
          border = "single",
      },

      indent_guides = false,
  },
  cmd = "Trouble",
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xb",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    -- the position is in left for better viewing
    -- also as no file tree is present
    {
      "<leader>co",
      "<cmd>Trouble symbols toggle focus=false win.position=left<cr>",
      desc = "Code Outline (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=left<cr>",
      desc = "LSP Definitions / references (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
}
