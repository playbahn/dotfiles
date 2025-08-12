return {
    { -- Add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help ibl`
        main = 'ibl',
        --- @module "ibl"
        --- @type ibl.config
        opts = {
            indent = {
                char = { '▏' },
            },
            whitespace = {
                highlight = { 'Function' },
            },
            scope = {
                show_end = false,
                show_start = false,
            },
        },
    },
}
