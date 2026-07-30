require("pastel").setup({
  background = {
    dark = "pastelblack",
    light = "pastelsoft",
  },
  palette = nil,
  termguicolors = true,
  style = {
    transparent = false,
    inactive = true,
    border = true,
    float = true,
    border = true,
    bold = true,
    italic = true,
    underline = true,
    invert_title = false,
    simple_syntax = false,
    dynamic_statusline = false,
  },
  colors = {
    common = {},
    global = {},
  },
  highlights = {
    global = {},
  },
  exclude = {
    core = {},
    plugins = {},
  },
  filetypes = {},
})
