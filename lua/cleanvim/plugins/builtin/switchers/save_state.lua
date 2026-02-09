local save_transaparency = function(opts)
	opts = opts or {}
	local f = io.open(opts.path, "w")
	if f then
		f:write(opts.return_state)
		f:close()
	else
		print("Error: Could not open path " .. opts.path)
	end
end

return save_transaparency
