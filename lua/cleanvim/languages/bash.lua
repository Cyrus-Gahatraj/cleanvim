-- bash-language-server runs shellcheck itself, so no separate linter
return {
    mason = { "bash-language-server", "shfmt", "shellcheck" },
    formatters = { sh = { "shfmt" }, bash = { "shfmt" } },
}
