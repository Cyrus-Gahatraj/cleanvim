local state = "cleanvim.config.save_state."

return {
	theme = require(state .. "theme"),
	transparency = require(state .. "transparency"),
	format_on_save = require(state .. "format_on_save"),
}
