vim.keymap.set("n", "<leader>l", ":Lazy<CR>", { desc = "lazy plugin" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

vim.keymap.set({"n", "v"}, "<leader>y", "\"+y", { desc = "Yank in +" })
vim.keymap.set({"n", "v"}, "<leader>p", "\"_dP", { desc = "Paste in void" })

-- Center
vim.keymap.set("n", "G", "Gzz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "#", "#zz")
vim.keymap.set("n", "g*", "g*zz")
vim.keymap.set("n", "g#", "g#zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to defination" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Diagnostic" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, { desc = "Go to prev diagnostic" })
vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, { desc = "References" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, { desc = "Help" })
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Code Format" })

