vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
    callback = function(event)
        local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        -- Rename the variable under your cursor.
        map("grn", vim.lsp.buf.rename, "[R]e[n]ame")

        -- Execute a code action
        map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })

        --  Goto Declaration, in C this would take you to the header
        map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

        -- Highlight references of the word under your cursor
        -- When you move your cursor, the highlights will be cleared
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method("textDocument/documentHighlight", event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
                group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds { group = "lsp-highlight", buffer = event2.buf }
                end,
            })
        end

        -- Toggle inlay hints in code, if the language server you are using supports them
        if client and client:supports_method("textDocument/inlayHint", event.buf) then
            map("<leader>th",
                function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf }) end,
                "[T]oggle Inlay [H]ints")
        end
    end,
})

-- LSP servers
local servers = {
    clangd = {},
    jdtls = {},
    lua_ls = {},
    sqls = {}
}

local ensure_installed = vim.tbl_keys(servers)
vim.list_extend(ensure_installed, {
    "stylua",
})

require("mason-tool-installer").setup { ensure_installed = ensure_installed }

for name, server in pairs(servers) do
    vim.lsp.config(name, server)
    vim.lsp.enable(name)
end
