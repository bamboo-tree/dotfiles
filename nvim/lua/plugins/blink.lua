require("blink.cmp").setup {
    keymap = {
        -- <tab>/<s-tab>: move to right/left of your snippet expansion
        -- <c-space>: Open menu or open docs if already open
        -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
        -- <c-e>: Hide menu
        -- <c-k>: Toggle signature help
        preset = "default",
    },
    appearance = {
        nerd_font_variant = "mono",
    },
    completion = {
        -- By default, you may press `<c-space>` to show the documentation.
        documentation = { auto_show = false, auto_show_delay_ms = 500 },
    },
    sources = {
        default = { "lsp", "path", "snippets" },
    },
    snippets = { preset = "luasnip" },
    fuzzy = { implementation = "lua" },
    signature = { enabled = true },
}
