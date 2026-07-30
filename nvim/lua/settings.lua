-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Line number
vim.o.number = true
vim.o.relativenumber = true

-- Tabs as spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Vertical ruler
vim.opt.colorcolumn = "80,100,140"

-- Show cursor line
vim.opt.cursorline = true

-- Don't show the mode
vim.o.showmode = false

-- Scrolloff
vim.opt.scrolloff = 8

-- Disable mouse
vim.opt.mouse = ""

-- Case-insensitive searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Signcolumn
vim.opt.signcolumn = "yes"

-- Timings
vim.opt.updatetime = 2000
vim.opt.timeoutlen = 500

-- New split position
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Show whitespaces
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview subtitutions live
vim.opt.inccommand = "split"

-- Confirm "dangerous" operations
vim.o.confirm = true
