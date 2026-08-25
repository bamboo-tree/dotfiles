-- Themes
vim.pack.add { "https://github.com/ankushbhagats/pastel.nvim" }
vim.pack.add { "https://github.com/ellisonleao/gruvbox.nvim" }

-- UI/UX
vim.pack.add { "https://github.com/NMAC427/guess-indent.nvim" }
vim.pack.add { "https://github.com/lewis6991/gitsigns.nvim" }
vim.pack.add { "https://github.com/folke/which-key.nvim" }
vim.pack.add { "https://github.com/folke/todo-comments.nvim" }
vim.pack.add { "https://github.com/nvim-mini/mini.nvim" }
vim.pack.add { "https://github.com/nvim-tree/nvim-web-devicons" }
vim.pack.add { "https://github.com/rachartier/tiny-inline-diagnostic.nvim" }

-- Telescope + dependencies
vim.pack.add {
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope-ui-select.nvim",
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
}

-- LSP config related
vim.pack.add {
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
    "https://github.com/folke/lazydev.nvim",
    "https://github.com/j-hui/fidget.nvim"
}

-- LSPs
vim.pack.add {
    {
        src = "https://github.com/JavaHello/spring-boot.nvim",
        version = "218c0c26c14d99feca778e4d13f5ec3e8b1b60f0",
    },
    "https://github.com/MunifTanjim/nui.nvim",
    "https://github.com/mfussenegger/nvim-dap",
    "https://github.com/nvim-java/nvim-java",
    "https://github.com/nanotee/sqls.nvim"
}

-- Formating, autocompletion, snippets
vim.pack.add {
    "https://github.com/stevearc/conform.nvim",
    { src = "https://github.com/L3MON4D3/LuaSnip", version = vim.version.range "2.*" },
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range "1.*" }
}

-- Navigation
vim.pack.add { { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' } }
vim.pack.add { "https://github.com/nvim-neo-tree/neo-tree.nvim" }
