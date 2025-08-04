return {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
        {
            '<leader>f',
            function()
                require('conform').format { async = true, lsp_format = 'fallback' }
            end,
            mode = '',
            desc = '[F]ormat buffer (conform.nvim)',
        },
    },
    --- @type conform.setupOpts
    opts = {
        notify_on_error = true,
        -- format_on_save = function(bufnr)
        --     local disable_filetypes = { c = true, cpp = true }
        --     if disable_filetypes[vim.bo[bufnr].filetype] then
        --         return nil
        --     else
        --         return {
        --             timeout_ms = 500,
        --             lsp_format = 'fallback',
        --         }
        --     end
        -- end,
        formatters_by_ft = {
            sh = { 'shfmt', lsp_format = 'fallback', stop_after_first = true },
            bash = { 'shfmt', lsp_format = 'fallback', stop_after_first = true },
            lua = { 'stylua', lsp_format = 'fallback', stop_after_first = true },
        },
        formatters = {
            shfmt = {
                append_args = {
                    '--case-indent',
                    '--space-redirects', -- redirect operators will be followed by a space
                },
            },
            stylua = {
                append_args = {
                    '--column-width',
                    '100',
                    '--indent-type',
                    'Spaces',
                    '--indent-width',
                    '4',
                    '--call-parentheses',
                    'None',
                },
            },
        },
    },
}
