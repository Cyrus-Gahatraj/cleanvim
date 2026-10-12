-- Each file next to this one describes a language: the mason packages it needs
-- (LSP servers start automatically once installed) and which formatters and
-- linters run per filetype. Turn languages on/off with <leader>tl.
local M = {}

local state = require("cleanvim.config.state")
local dir = vim.fn.stdpath("config") .. "/lua/cleanvim/languages"

M.all = function()
    local names = {}
    for _, file in ipairs(vim.fn.readdir(dir)) do
        local name = file:match("^(.+)%.lua$")
        if name and name ~= "init" then table.insert(names, name) end
    end
    return names
end

M.enabled = function() return state.load().languages end

-- A language file that was deleted or has a typo shouldn't break startup
local get = function(name)
    local ok, lang = pcall(require, "cleanvim.languages." .. name)
    return ok and type(lang) == "table" and lang or {}
end

local by_ft = function(key)
    local result = {}
    for _, name in ipairs(M.enabled()) do
        for ft, tools in pairs(get(name)[key] or {}) do
            result[ft] = tools
        end
    end
    return result
end

M.formatters = function() return by_ft("formatters") end
M.linters = function() return by_ft("linters") end

local enabled_packages = function()
    local packages = {}
    for _, name in ipairs(M.enabled()) do
        for _, pkg in ipairs(get(name).mason or {}) do
            packages[pkg] = true
        end
    end
    return packages
end

M.mason_install = function(names, on_done)
    local registry = require("mason-registry")
    registry.refresh(vim.schedule_wrap(function()
        for _, name in ipairs(names) do
            local ok, pkg = pcall(registry.get_package, name)
            if not ok then
                vim.notify("Cleanvim: unknown mason package " .. name, vim.log.levels.WARN)
            elseif not pkg:is_installed() and not pkg:is_installing() then
                vim.notify("Cleanvim: installing " .. name)
                pkg:install(
                    {},
                    vim.schedule_wrap(function(success)
                        if not success then
                            return vim.notify(
                                "Cleanvim: failed to install " .. name,
                                vim.log.levels.ERROR
                            )
                        end
                        vim.notify("Cleanvim: installed " .. name)
                        if on_done then on_done(name) end
                    end)
                )
            end
        end
    end))
end

-- Install whatever the enabled languages need and isn't there yet
M.install = function() M.mason_install(vim.tbl_keys(enabled_packages())) end

-- Remove packages of a language that no other enabled language still uses
local uninstall = function(name)
    local registry = require("mason-registry")
    local keep = enabled_packages()
    local ok, mappings = pcall(function() return require("mason-lspconfig").get_mappings() end)
    for _, pkg_name in ipairs(get(name).mason or {}) do
        if not keep[pkg_name] and registry.is_installed(pkg_name) then
            local server = ok and mappings.package_to_lspconfig[pkg_name]
            if server then vim.lsp.enable(server, false) end
            registry.get_package(pkg_name):uninstall()
        end
    end
end

M.toggle = function(name)
    local enabled = M.enabled()
    local on = not vim.list_contains(enabled, name)
    if on then
        table.insert(enabled, name)
    else
        enabled = vim.tbl_filter(function(n) return n ~= name end, enabled)
    end
    state.set("languages", enabled)

    -- rewire already-loaded plugins; unloaded ones read the list when they load
    if package.loaded["conform"] then
        package.loaded["conform"].formatters_by_ft = M.formatters()
    end
    if package.loaded["lint"] then package.loaded["lint"].linters_by_ft = M.linters() end

    if on then
        M.install()
    else
        uninstall(name)
    end
    return on
end

return M
