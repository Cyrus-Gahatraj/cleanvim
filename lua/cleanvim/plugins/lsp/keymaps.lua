local has_telescope, telescope = pcall(require, "telescope.builtin")

if has_telescope then
    vim.keymap.set("n", "gd", telescope.lsp_definitions, { desc = "Go to definition" })
    vim.keymap.set("n", "gt", telescope.lsp_type_definitions, { desc = "Go to type definition" })
    vim.keymap.set("n", "<leader>rr", telescope.lsp_references, { desc = "References list" })
    vim.keymap.set("n", "<leader>csd", telescope.lsp_document_symbols, { desc = "Document symbols" })
    vim.keymap.set("n", "<leader>csw", telescope.lsp_workspace_symbols, { desc = "Workspace symbols" })
else
    -- Fallback to native LSP
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
    vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, { desc = "References list" })
    vim.keymap.set("n", "<leader>csd", vim.lsp.buf.document_symbols, { desc = "Document symbols" })
    vim.keymap.set("n", "<leader>csw", vim.lsp.buf.workspace_symbols, { desc = "Workspace symbols" })
end

-- Common LSP Keymaps
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Diagnostic" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, { desc = "Signature help" })
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
