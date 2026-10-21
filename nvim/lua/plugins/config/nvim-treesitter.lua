local ts = require("nvim-treesitter")

local parsers = {
    "bash",
    "c",
    "diff",
    "html",
    "lua",
    "luadoc",
    "markdown",
    "markdown_inline",
    "query",
    "vim",
    "vimdoc",
    "java",
    "python",
}

ts.install(parsers)

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup(
        "MyTreeSitter",
        { clear = true }
    ),

    callback = function(args)
        local buf = args.buf
        local ft = vim.bo[buf].filetype
        local lang = vim.treesitter.language.get_lang(ft)

        if not lang then
            return
        end

        local installed = require("nvim-treesitter").get_installed("parsers")

        if not vim.tbl_contains(installed, lang) then
            return
        end

        local ok = pcall(vim.treesitter.start, buf, lang)

        if not ok then
            return
        end

        -- Włącz wcięcia tylko wtedy, gdy są obsługiwane.
        if vim.treesitter.query.get(lang, "indents") then
            vim.bo[buf].indentexpr =
            "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    end,

})
