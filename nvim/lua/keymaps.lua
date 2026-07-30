-- Clear search highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Alias :Ex
vim.keymap.set("n", "<leader>cd", "<cmd>Ex<CR>", { desc = "Alias :Ex" })

-- Disable arrow movement
vim.keymap.set("", "<Up>", "<Nop>", { desc = "Don't use arrow keys to navigate" })
vim.keymap.set("", "<Down>", "<Nop>", { desc = "Don't use arrow keys to navigate" })
vim.keymap.set("", "<Left>", "<Nop>", { desc = "Don't use arrow keys to navigate" })
vim.keymap.set("", "<Right>", "<Nop>", { desc = "Don't use arrow keys to navigate" })

-- Easier split navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Telescope
-- NOTE: Can be found in /lua/plugins/telescope.lua

-- Conform
local function formatBuffer()
    require("conform").format({
        async = true
    })
end
vim.keymap.set({ "n", "v" }, "<leader>f", formatBuffer, { desc = "[F]ormat buffer" })

-- Neo-tree
vim.keymap.set("n", "<leader>e", "<Cmd>Neotree<CR>", { desc = "N[E]o-tree" })
vim.keymap.set("n", "<leader>ec", "<Cmd>Neotree close<CR>", { desc = "N[E]o-tree [C]lose" })
