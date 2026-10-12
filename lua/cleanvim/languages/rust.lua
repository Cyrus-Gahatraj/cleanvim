-- rustfmt ships with rustup; without it, rust-analyzer formats instead
return {
    mason = { "rust-analyzer" },
    formatters = { rust = { "rustfmt" } },
}
