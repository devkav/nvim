local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local ascii = require("ascii")

local explorer_button = dashboard.button("SPC f", "  Jump to explorer")
local file_button = dashboard.button("SPC p f", "󰈞  Find file")
local word_button = dashboard.button("SPC p s", "󰈬  Find word")
local harpoon_button = dashboard.button("CTRL e", "  Open harpoon", "<C-e>")

explorer_button.opts.hl_shortcut = "Comment"
file_button.opts.hl_shortcut = "Comment"
word_button.opts.hl_shortcut = "Comment"
harpoon_button.opts.hl_shortcut = "Comment"

--[[
Icons:
 󰈞 󰊄  󰈬  
]]--

dashboard.section.header.opts.hl = "Comment"
dashboard.section.header.val = ascii.art.text.neovim.sharp
dashboard.section.buttons.val = {
  explorer_button,
  file_button,
  word_button,
  harpoon_button,
}

alpha.setup(dashboard.opts)
