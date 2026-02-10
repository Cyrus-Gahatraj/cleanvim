local M = {}

local add_ai_group = function(prefix, name)
	return {
		{ prefix, group = name .. " textobject" },
		{ prefix .. "a", desc = name .. " argument" },
		{ prefix .. "b", desc = name .. " bracket" },
		{ prefix .. "c", desc = name .. " class" },
		{ prefix .. "d", desc = name .. " digit" },
		{ prefix .. "f", desc = name .. " function" },
		{ prefix .. "q", desc = name .. " quotes" },
		{ prefix .. "t", desc = name .. " tag" },
		{ prefix .. "?", desc = name .. " custom" },
	}
end

local add_sr_suffix = function(suffix, name)
	return {
		{ "s" .. suffix, group = "surround " .. name },
		{ "s" .. suffix .. "a", desc = "add " .. name .. " surround" },
		{ "s" .. suffix .. "d", desc = "delete " .. name .. " surround" },
		{ "s" .. suffix .. "r", desc = "replace " .. name .. " surround" },
		{ "s" .. suffix .. "f", desc = "find " .. name .. " surround right" },
		{ "s" .. suffix .. "F", desc = "find " .. name .. " surround left" },
		{ "s" .. suffix .. "h", desc = "highlight " .. name .. " surround" },
	}
end

M.setup = function()
	local ok, wk = pcall(require, "which-key")
	if not ok then
		return
	end

	local mapping = {
		-- Builtins
		{ "<leader>a", group = "Add stuffs" },
		{ "<leader>s", group = "Switch stuffs" },

		-- Git
		{ "<leader>g", group = "Git" },

		-- Code
		{ "<leader>c", group = "Code" },
		{ "<leader>cs", group = "Symbols" },

		-- Find
		{ "<leader>f", group = "Find" },

		-- Toggle
		{ "<leader>t", group = "Toggle" },

		-- Refactor
		{ "<leader>r", group = "Refactor" },

		-- Tabs
		{ "<leader><tab>", group = "Tabs" },

		-- Buffer
		{ "<leader>b", group = "Buffer" },
	}

	-- mini ai
	local ai_mapping = {
		mode = { "o", "v" },
	}

	vim.list_extend(ai_mapping, { mode = "o", "v" })
	vim.list_extend(ai_mapping, add_ai_group("a", "around"))
	vim.list_extend(ai_mapping, add_ai_group("i", "inside"))
	vim.list_extend(ai_mapping, add_ai_group("an", "around next"))
	vim.list_extend(ai_mapping, add_ai_group("in", "inside next"))
	vim.list_extend(ai_mapping, add_ai_group("al", "around last"))
	vim.list_extend(ai_mapping, add_ai_group("il", "inside last"))

	-- mini surround
	local sr_mapping = {
		mode = { "n", "v" },
	}

	vim.list_extend(sr_mapping, add_sr_suffix("", ""))
	vim.list_extend(sr_mapping, add_sr_suffix("n", "next"))
	vim.list_extend(sr_mapping, add_sr_suffix("l", "last"))

	wk.add(mapping)
	wk.add(ai_mapping)
	wk.add(sr_mapping)
end

return M
