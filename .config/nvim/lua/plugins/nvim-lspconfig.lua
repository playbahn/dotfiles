return {
    'neovim/nvim-lspconfig',
    dependencies = {
        { 'j-hui/fidget.nvim', opts = {} }, -- Useful status updates for LSP.
        'saghen/blink.cmp', -- Allows extra capabilities provided by blink.cmp
    },
    config = function()
        -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
        -- and elegantly composed help section, `:help lsp-vs-treesitter`

        -- See `:help lspconfig-all` for a list of all the pre-configured LSPs
        -- Available keys are:
        --  - cmd (table): Override the default command used to start the server
        --  - filetypes (table): Override the default list of associated filetypes for the server
        --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
        --  - settings (table): Override the default settings passed when initializing the server.
        --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/

        local servers = {
            clangd = {},
            bashls = {},
            lua_ls = {
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = 'Replace',
                        },
                        diagnostics = {
                            disable = { 'missing-fields' },
                        },
                    },
                },
            },
        }

        -- LSP servers and clients are able to communicate to each other what features they support.
        --  By default, Neovim doesn't support everything that is in the LSP specification.
        --  When you add blink.cmp, luasnip, etc. Neovim now has *more* capabilities.
        --  So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
        local capabilities = require('blink.cmp').get_lsp_capabilities({}, true)

        for server, opts in pairs(servers) do
            opts.capabilities = vim.tbl_deep_extend('force', capabilities, opts.capabilities or {})
            vim.lsp.config(server, opts)
            vim.lsp.enable(server)
        end
    end,
}
