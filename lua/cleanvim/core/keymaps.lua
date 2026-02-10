vim.keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "lazy plugin" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank in +" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"_dP', { desc = "Paste in void" })

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

-- Tabs
vim.keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<CR>", { desc = "Open Tab" })
vim.keymap.set("n", "<leader><tab>x", "<cmd>tabclose<CR>", { desc = "Close Tab" })
vim.keymap.set("n", "<leader><tab>n", "<cmd>tabnext<CR>", { desc = "Next Tab" })
vim.keymap.set("n", "<leader><tab>p", "<cmd>tabprev<CR>", { desc = "Previous Tab" })

-- Buffer
vim.keymap.set("n", "<leader>bd", "<cmd>bp|bd #<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>br", "<cmd>e #<CR>", { desc = "Reopen last buffer" })

