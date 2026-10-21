require("pckr").add {
    -- UI
    { "bamboo-tree/pearly.nvim" },
    { "nvim-tree/nvim-web-devicons" },
    { "folke/todo-comments.nvim" },

    -- UX
    { "NMAC427/guess-indent.nvim" },
    { "lewis6991/gitsigns.nvim" },
    { "folke/which-key.nvim" },
    { "nvim-mini/mini.nvim" },
    { "rachartier/tiny-inline-diagnostic.nvim" },

    -- Telescope
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },

    -- Autocompletion
    { "stevearc/conform.nvim" },
    { "L3MON4D3/LuaSnip" },
    { "saghen/blink.lib" },
    { "saghen/blink.cmp" },

    -- Treesitter
    { "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate" },

    -- Navigation
    { "MunifTanjim/nui.nvim" },
    { "nvim-neo-tree/neo-tree.nvim" },

    -- LSP tools
    { "neovim/nvim-lspconfig" },
    { "mason-org/mason.nvim" },
    { "mason-org/mason-lspconfig.nvim" },
    { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    { "folke/lazydev.nvim" },
    { "j-hui/fidget.nvim" },

    -- LSPs
    { "JavaHello/spring-boot.nvim" },
    { "MunifTanjim/nui.nvim" },
    { "mfussenegger/nvim-dap" },
    { "nvim-java/nvim-java" },
}
