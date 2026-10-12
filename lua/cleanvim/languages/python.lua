-- ruff: one fast binary for formatting, import sorting and linting (via its LSP)
return {
    mason = { "pyright", "ruff" },
    formatters = { python = { "ruff_organize_imports", "ruff_format" } },
}
