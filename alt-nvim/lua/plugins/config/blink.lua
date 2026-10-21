require("blink.cmp").setup {
    keymap = {
        preset = "default",
    },
    appearance = {
        nerd_font_variant = "mono",
    },
    completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 1000 },
    },
    sources = {
        default = { "lsp", "path", "snippets" },
    },
    snippets = { preset = "luasnip" },
    fuzzy = { implementation = "lua" },
    signature = { enabled = true },
}
