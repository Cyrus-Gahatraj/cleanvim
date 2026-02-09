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
vim.keymap.set("n", "gd", ":Telescope lsp_definitions<CR>", { desc = "Go to defination" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Diagnostic" })
vim.keymap.set("n", "<leader>rr", ":Telescope lsp_references<CR>", { desc = "References list" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, { desc = "Help" })
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Code Format" })
vim.keymap.set("n", "<leader>css", ":Telescope lsp_document_symbols<CR>", { desc = "Documents Symbols" })
vim.keymap.set("n", "<leader>csw", ":Telescope lsp_workspace_symbols<CR>", { desc = "Workspace Symbols" })

-- Git
vim.keymap.set("n", "<leader>gph", ":Gitsigns preview_hunk<CR>", { desc = "Git preview hunk" })
vim.keymap.set("n", "<leader>gpr", ":Gitsigns reset_hunk<CR>", { desc = "Git reset hunk" })
vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<CR>", { desc = "Git diff" })
vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "Git blame" })
vim.keymap.set("n", "<leader>gB", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle blame" })
vim.keymap.set("n", "<leader>gw", ":Gwrite<CR>", { desc = "Git add this" })

-- Oil 
vim.keymap.set("n", "<leader>e", ":Oil<CR>", { desc = "Open Explorer" })

