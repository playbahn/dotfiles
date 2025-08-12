local zed_one_dark_white = '#acb2be'

return {
    'olimorris/onedarkpro.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins
    config = function()
        require('onedarkpro').setup {
            highlights = {
                ----------------------------------------------------------------------------- Common
                ['@attribute'] = { fg = '#74ade8' },
                Constant = { fg = '#dfc184' },
                ['@constant'] = { link = 'Constant' },
                Comment = { fg = '#5d636f' },
                ['@comment.documentation'] = { fg = '#878e98' },
                ['@string.escape'] = { fg = '#878e98' },
                Type = { fg = '${cyan}' },

                ---------------------------------------------------------------------------------- C
                ['@lsp.typemod.function.defaultLibrary.c'] = { link = 'Function' },

                -------------------------------------------------------------------------------- Lua
                ['@lsp.type.comment.lua'] = { link = nil }, -- group was applied to doc AND non-doc

                ------------------------------------------------------------------------------- Rust
                ['@attribute.rust'] = { fg = '${cyan}' },
                ['@attribute.builtin.rust'] = { fg = '${purple}' },
                ['@lsp.mod.mutable.rust'] = { italic = true },
                ['@lsp.typemod.namespace.crateRoot.rust'] = { fg = '#dde5f4' },
                ['@lsp.type.struct.rust'] = { fg = '${cyan}' },
                ['@lsp.type.namespace.rust'] = { fg = zed_one_dark_white },
                ['@lsp.type.interface.rust'] = { fg = '${cyan}' },
                ['@lsp.type.parameter.rust'] = { fg = '${red}' },
                ['@lsp.type.typeParameter.rust'] = { fg = '${cyan}' },
                ['@lsp.type.enum.rust'] = { fg = '${cyan}' },
                ['@lsp.type.formatSpecifier.rust'] = { link = '@string.escape' },
                ['@lsp.type.derive.rust'] = { fg = '${cyan}' },
                ['@lsp.type.selfTypeKeyword.rust'] = { fg = '${cyan}' },
                ['@lsp.type.macro.rust'] = { fg = '${blue}' },
                ['@lsp.typemod.function.defaultLibrary.rust'] = { link = 'Function' },
                ['@lsp.typemod.method.defaultLibrary.rust'] = { link = 'Function' },
                ['@lsp.typemod.typeAlias.associated.rust'] = { fg = '${cyan}' },
                ['@lsp.typemod.operator.controlFlow.rust'] = { fg = '${cyan}' },
                ['@lsp.typemod.comment.documentation.rust'] = { link = '@comment.documentation' },
                ['@module.rust'] = { fg = '${purple}' },
                ['@operator.rust'] = { fg = '${cyan}' },
                ['@odp.punctuation_token_bracket.rust'] = { fg = '${blue}' },
                ['@punctuation.bracket.rust'] = { fg = '#b2b9c6' },
                ['@lsp.type.escapeSequence.rust'] = { link = '@string.escape' },
            },
            options = {
                -- highlight_inactive_windows = true,
                cursorline = true,
                -- transparency = true,
                lualine_transparency = true,
            },
        }

        vim.cmd 'colorscheme onedark'
    end,
}
