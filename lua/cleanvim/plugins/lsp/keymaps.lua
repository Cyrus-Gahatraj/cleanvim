-- Buffer-local, set on LspAttach so non-LSP buffers keep the builtin gd / K
return function(buf)
    local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
    end

    local has_telescope, telescope = pcall(require, "telescope.builtin")

    if has_telescope then
        map("n", "gd", telescope.lsp_definitions, "Go to definition")
        map("n", "gt", telescope.lsp_type_definitions, "Go to type definition")
        map("n", "<leader>rr", telescope.lsp_references, "References list")
        map("n", "<leader>csd", telescope.lsp_document_symbols, "Document symbols")
        map("n", "<leader>csw", telescope.lsp_dynamic_workspace_symbols, "Workspace symbols")
    else
        -- Fallback to native LSP
        map("n", "gd", vim.lsp.buf.definition, "Go to definition")
        map("n", "gt", vim.lsp.buf.type_definition, "Go to type definition")
        map("n", "<leader>rr", vim.lsp.buf.references, "References list")
        map("n", "<leader>csd", vim.lsp.buf.document_symbol, "Document symbols")
        map("n", "<leader>csw", vim.lsp.buf.workspace_symbol, "Workspace symbols")
    end

    -- Common LSP Keymaps
    map("n", "K", vim.lsp.buf.hover, "Hover documentation")
    map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
    map("i", "<C-h>", vim.lsp.buf.signature_help, "Signature help")
    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
end
