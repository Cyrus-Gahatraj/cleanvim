-- Debugging. Adapters are not installed by default: run `:DapInstall <adapter>`
-- (e.g. python, codelldb, delve, js) and mason-nvim-dap configures it.
local dap = function(fn)
    return function() require("dap")[fn]() end
end

return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "igorlfs/nvim-dap-view",
        "mason-org/mason.nvim",
        "jay-babu/mason-nvim-dap.nvim",
    },
    cmd = { "DapInstall", "DapUninstall" },
    keys = {
        { "<F5>", dap("continue"), desc = "Debug: Continue" },
        { "<F10>", dap("step_over"), desc = "Debug: Step over" },
        { "<F11>", dap("step_into"), desc = "Debug: Step into" },
        { "<F12>", dap("step_out"), desc = "Debug: Step out" },

        { "<leader>Db", dap("toggle_breakpoint"), desc = "Toggle breakpoint" },
        {
            "<leader>DB",
            function() require("dap").set_breakpoint(vim.fn.input("Condition: ")) end,
            desc = "Conditional breakpoint",
        },
        { "<leader>Dc", dap("continue"), desc = "Start / continue" },
        { "<leader>Do", dap("step_over"), desc = "Step over" },
        { "<leader>Di", dap("step_into"), desc = "Step into" },
        { "<leader>DO", dap("step_out"), desc = "Step out" },
        { "<leader>Dr", dap("run_to_cursor"), desc = "Run to cursor" },
        { "<leader>Dt", dap("terminate"), desc = "Terminate" },
        {
            "<leader>Dv",
            function() require("dap-view").toggle() end,
            desc = "Toggle debug view",
        },
    },
    config = function()
        require("dap-view").setup({ auto_toggle = true })
        require("mason-nvim-dap").setup({ handlers = {} })
    end,
}
