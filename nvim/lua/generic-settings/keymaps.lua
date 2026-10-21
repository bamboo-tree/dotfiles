-- Clear search highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight." })

-- Disable arrow movement
vim.keymap.set("", "<Up>", "<Nop>", { desc = "Don't use arrow keys to navigate." })
vim.keymap.set("", "<Down>", "<Nop>", { desc = "Don't use arrow keys to navigate." })
vim.keymap.set("", "<Left>", "<Nop>", { desc = "Don't use arrow keys to navigate." })
vim.keymap.set("", "<Right>", "<Nop>", { desc = "Don't use arrow keys to navigate." })

-- Easier split navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window." })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window." })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window." })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window." })
