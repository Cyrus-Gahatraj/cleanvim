local number_tweak = vim.api.nvim_create_augroup("NumberTweak", { clear = true })

-- Turn OFF relative numbers when entering the command line
vim.api.nvim_create_autocmd("CmdlineEnter", {
    group = number_tweak,
    callback = function()
        if vim.wo.relativenumber then
            vim.b.restorable_relativenumber = true
            vim.wo.relativenumber = false
            -- refresh lualine first so the forced redraw doesn't paint a stale NORMAL
            pcall(function() require("lualine").refresh() end)
            vim.cmd("redraw")
        end
    end,
})

-- Turn ON relative numbers when leaving the command line
vim.api.nvim_create_autocmd("CmdlineLeave", {
    group = number_tweak,
    callback = function()
        if vim.b.restorable_relativenumber then
            vim.wo.relativenumber = true
            vim.b.restorable_relativenumber = false
        end
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("highlight on yank", { clear = true }),
    callback = function() vim.hl.on_yank() end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
    desc = "Restore last cursor position",
    group = vim.api.nvim_create_augroup("last-position", { clear = true }),
    callback = function(args)
        local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
        if mark[1] > 1 and mark[1] <= vim.api.nvim_buf_line_count(args.buf) then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Auto start tree-sitter, installing the parser on first use
local ts_tried = {}
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("treesitter-start", { clear = true }),
    callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if not lang then return end

        local start = function()
            if pcall(vim.treesitter.start, args.buf, lang) then
                vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end
        end

        if vim.treesitter.language.add(lang) then return start() end

        local ok, ts = pcall(require, "nvim-treesitter")
        if not ok or ts_tried[lang] or not vim.list_contains(ts.get_available(), lang) then
            return
        end
        ts_tried[lang] = true
        ts.install(lang):await(vim.schedule_wrap(function()
            if vim.api.nvim_buf_is_valid(args.buf) then start() end
        end))
    end,
})
