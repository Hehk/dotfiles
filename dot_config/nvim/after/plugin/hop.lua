local hop = require("hop")
local directions = require("hop.hint").HintDirection

hop.setup()

local function bind(key, fn)
	vim.keymap.set("", key, fn, { remap = true })
end

bind("f", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end)
bind("F", function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end)
bind("t", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end)
bind("T", function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end)
