local zed_one_dark_white = '#acb2be'
local zed_one_dark_constant = '#dfc184'

return {
    'olimorris/onedarkpro.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins
    config = function()
        require('onedarkpro').setup {
            -- stylua: ignore
            highlights = {
                ['@attribute.rust']                           = { fg = '${cyan}' },
                ['@attribute.builtin.rust']                   = { fg = '${purple}' },
                ['@comment.documentation.rust']               = { fg = '#878e98' },
                ['@comment.rust']                             = { fg = '#5d636f' },
                ['@constant.rust']                            = { fg = '#dfc184' },
                ['@lsp.mod.mutable.rust']                     = { italic = true },
                ['@lsp.typemod.namespace.crateRoot.rust']     = { fg = '#dde5f4' },
                ['@lsp.type.const.rust']                      = { fg = zed_one_dark_constant },
                ['@lsp.type.struct.rust']                     = { fg = '${cyan}' },
                ['@lsp.type.namespace.rust']                  = { fg = zed_one_dark_white },
                ['@lsp.type.interface.rust']                  = { fg = '${cyan}' },
                ['@lsp.type.parameter.rust']                  = { fg = '${red}' },
                ['@lsp.type.typeParameter.rust']              = { fg = '${cyan}' },
                ['@lsp.type.enum.rust']                       = { fg = '${cyan}' },
                ['@lsp.type.formatSpecifier.rust']            = { fg = '${purple}' },
                ['@lsp.type.derive.rust']                     = { fg = '${cyan}' },
                ['@lsp.type.selfTypeKeyword.rust']            = { fg = '${cyan}' },
                ['@lsp.type.macro.rust']                      = { fg = '${blue}' },
                ['@lsp.typemod.function.defaultLibrary.rust'] = { fg = '${blue}' },
                ['@lsp.typemod.method.defaultLibrary.rust']   = { fg = '${blue}' },
                ['@lsp.typemod.typeAlias.associated.rust']    = { fg = '${cyan}' },
                ['@lsp.typemod.operator.controlFlow.rust']    = { fg = '${cyan}' },
                ['@module.rust']                              = { fg = '${purple}' },
                ['@odp.punctuation_token_bracket.rust']       = { fg = '${blue}' },
                ['@operator']                                 = { fg = zed_one_dark_white },
                ['@punctuation.bracket.rust']                 = { fg = zed_one_dark_white },
                ['@lsp.type.escapeSequence.rust']             = { fg = '#878e98' },
                ['@type.builtin.rust']                        = { fg = '${cyan}' },
                ['@type.rust']                                = { fg = '${cyan}' },
                ['@variable.rust']                            = { fg = zed_one_dark_white },
                ['@variable.parameter.rust']                  = { fg = zed_one_dark_white },
            },
            options = {
                cursorline = true,
                -- transparency = true,
                lualine_transparency = true,
            },
        }
        vim.cmd.colorscheme 'onedark'
    end,
}
