return {
    "echasnovski/mini.nvim",
    config = function()
        -- Better Around/Inside textobjects
        --
        -- Examples:
        --  - va)  - [V]isually select [A]round [)]paren
        --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
        --  - ci'  - [C]hange [I]nside [']quote
        require("mini.ai").setup { n_lines = 500 }

        -- Add/delete/replace surroundings (brackets, quotes, etc.)
        --
        -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
        -- - sd'   - [S]urround [D]elete [']quotes
        -- - sr)'  - [S]urround [R]eplace [)] [']
        require("mini.surround").setup()

        -- Simple and easy statusline.
        --  You could remove this setup call if you don't like it,
        --  and try some other statusline plugin
        local statusline = require "mini.statusline"
        -- set use_icons to true if you have a Nerd Font
        statusline.setup { use_icons = vim.g.have_nerd_font }

        -- here we set the section for cursor location to LINE:COLUMN
        --- @diagnostic disable-next-line: duplicate-set-field
        statusline.section_location = function()
            return "%2l:%-2v"
        end

        --- @diagnostic disable-next-line: duplicate-set-field
        statusline.section_mode = function(args)
            local CTRL_S = vim.api.nvim_replace_termcodes("<C-S>", true, true, true)
            local CTRL_V = vim.api.nvim_replace_termcodes("<C-V>", true, true, true)
            local modes = {
                ["n"]    = { long = "NORMAL", short = "N", hl = "MiniStatuslineModeNormal" },
                ["v"]    = { long = "VISUAL", short = "V", hl = "MiniStatuslineModeVisual" },
                ["V"]    = { long = "V-LINE", short = "V-L", hl = "MiniStatuslineModeVisual" },
                [CTRL_V] = { long = "V-BLOCK", short = "V-B", hl = "MiniStatuslineModeVisual" },
                ["s"]    = { long = "SELECT", short = "S", hl = "MiniStatuslineModeVisual" },
                ["S"]    = { long = "S-LINE", short = "S-L", hl = "MiniStatuslineModeVisual" },
                [CTRL_S] = { long = "S-BLOCK", short = "S-B", hl = "MiniStatuslineModeVisual" },
                ["i"]    = { long = "INSERT", short = "I", hl = "MiniStatuslineModeInsert" },
                ["R"]    = { long = "REPLACE", short = "R", hl = "MiniStatuslineModeReplace" },
                ["c"]    = { long = "COMMAND", short = "C", hl = "MiniStatuslineModeCommand" },
                ["r"]    = { long = "PROMPT", short = "P", hl = "MiniStatuslineModeOther" },
                ["!"]    = { long = "SHELL", short = "SH", hl = "MiniStatuslineModeOther" },
                ["t"]    = { long = "TERMINAL", short = "T", hl = "MiniStatuslineModeOther" },
            }
            local mode_info = modes[vim.fn.mode()]
            local mode = statusline.is_truncated(args.trunc_width) and mode_info.short
                or mode_info.long
            return mode, mode_info.hl
        end
        -- ... and there is more!
        --  Check out: https://github.com/echasnovski/mini.nvim
    end,
}
