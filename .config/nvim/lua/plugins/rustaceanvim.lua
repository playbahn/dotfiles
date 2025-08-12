return {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false, -- This plugin is already lazy
    dependencies = {
        { 'j-hui/fidget.nvim', opts = {} }, -- Useful status updates for LSP.
        'saghen/blink.cmp',
    },
    config = function()
        -- From rustaceanvim docs:
        -- You can also use :h vim.lsp.config to configure vim.g.rustaceanvim.server options.
        -- For example, vim.lsp.config("*", {}) or vim.lsp.config("rust-analyzer", {}).
        -- Notice that its "rust-analyzer" (here), and not "rust_analyzer" (nvim-lspconfig)
        vim.lsp.config('rust-analyzer', {
            capabilities = require('blink.cmp').get_lsp_capabilities({}, true),
            settings = {
                ['rust-analyzer'] = {
                    check = {
                        command = 'clippy',
                        extraArgs = { '--no-deps' },
                    },
                    inlayHints = {
                        bindingModeHints = { enable = true },
                        closingBraceHints = { minLines = 0 },
                        closureCaptureHints = { enable = true },
                        closureReturnTypeHints = { enable = 'always' },
                        expressionAdjustmentHints = {
                            enable = 'reborrow',
                            hideOutsideUnsafe = true,
                        },
                        lifetimeElisionHints = {
                            enable = 'skip_trivial',
                            useParameterNames = true,
                        },
                        maxLength = vim.NIL,
                        semanticHighlighting = {
                            punctuation = {
                                enable = true,
                                specialization = { enable = true },
                            },
                        },
                        typing = { triggerChars = '=.{(><' },
                    },
                },
            },
        })
        --- @type `rustaceanvim.Opts`
        vim.g.rustaceanvim = {
            --- @type `rustaceanvim.tools.Opts`
            tools = {
                code_actions = { ui_select_fallback = true },
                reload_workspace_from_cargo_toml = true,
                --- @type vim.lsp.util.open_floating_preview.Opts
                float_win_config = {
                    border = { '', '', '', ' ', '', '', '', ' ' },
                    max_width = 100,
                },
            },
            --- @type `rustaceanvim.lsp.ClientOpts`
            --- rustaceanvim-specific server options
            --- @type `rustaceanvim.lsp.ClientConfig`
            server = {},
            --- @type `rustaceanvim.dap.Opts`
            dap = {},
        }
    end,
}
