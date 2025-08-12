-- Diagnostic Config
-- See :help vim.diagnostic.Opts
vim.diagnostic.config {
    -- underline = { severity = vim.diagnostic.severity.ERROR },
    virtual_text = {
        spacing = 2,
        format = function(diagnostic)
            return diagnostic.message:match '^([^\n]*)'
        end,
    },
    signs = vim.g.have_nerd_font and {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
    } or {},
    float = {
        header = "",
        --- @diagnostic disable-next-line
        border = { '', '', '', ' ', '', '', '', ' ' },
        suffix = function(diagnostic, _, _)
            --- @diagnostic disable-next-line
            return string.format(' [%s %s]', diagnostic.source, diagnostic.code)
        end,
    },
    update_in_insert = true,
    severity_sort = true,
    jump = {
        float = true,
    }
}
