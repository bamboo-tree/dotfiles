-- MINI ICONS
if vim.g.have_nerd_font then
    local icons = require('mini.icons')
    icons.setup()
    -- Backwards compatibility with plugins that require `nvim-web-devicons`
    MiniIcons.mock_nvim_web_devicons()
end

-- MINI STATUSLINE
local statusline = require("mini.statusline")
statusline.setup({
    use_icons = vim.g.have_nerd_font 
})

-- MINI PAIRS
local pairs = require("mini.pairs")
pairs.setup()

-- MINI TRAILSPACE
local trailspace = require("mini.trailspace")
trailspace.setup()
