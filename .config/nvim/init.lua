-- https://learnxinyminutes.com/docs/lua/
-- :help lua-guide
-- (HTML version): https://neovim.io/doc/user/lua-guide.html
-- we provide a keymap "<space>sh" to [s]earch the [h]elp documentation
-- If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' ' -- Set <space> as the leader key
vim.g.maplocalleader = ' ' -- See `:help mapleader`

require 'settings' -- options, variables, etc
require 'keymaps' -- Basic Keymaps
require 'autocmds' -- Basic Autocommands
require 'diagnostics' -- vim.diagnostics stuff
require 'lsp' -- Stuff to do for every language

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        '--branch=stable',
        lazyrepo,
        lazypath,
    }
    if vim.v.shell_error ~= 0 then
        error('Error cloning lazy.nvim:\n' .. out)
    end
end

--- @type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
-- To check the current status of your plugins, run
--   :Lazy
-- You can press `?` in this menu for help. Use `:q` to close the window
-- To update plugins you can run
--   :Lazy update
require('lazy').setup({
    -- Highlight, edit, and navigate code
    require 'plugins.nvim-treesitter',
    -- Rust specific
    require 'plugins.rustaceanvim',
    -- Main LSP Configuration
    require 'plugins.nvim-lspconfig',
    -- (Auto)completion
    require 'plugins.blink_cmp',
    -- {} () [] <> etc
    require 'plugins.autopairs',
    -- Formatting
    require 'plugins.conform',
    -- configure Lua LSP for Neovim config, runtime and plugins
    -- Completion, annotations and signatures of Neovim apis
    require 'plugins.lazydev',
    -- onedarkpro with a shitload of mods
    require 'plugins.onedarkpro',
    -- Detect tabstop and shiftwidth automatically
    require 'plugins.guess-indent',
    -- Useful plugin to show you pending keybinds.
    require 'plugins.which-key',
    -- Fuzzy Finder (files, lsp, etc)
    require 'plugins.telescope',
    -- statusline
    -- require "plugins.lualine",
    -- Collection of various small independent plugins/modules
    require 'plugins.mini-nvim',
    -- require 'plugins.debug',
    require 'plugins.indent_line',
    -- require 'plugins.lint',
    require 'plugins.neo-tree',
    -- gitdiff gutter signs; utilities for managing changes
    require 'plugins.gitsigns',
    -- Highlight todo, notes, etc in comments
    require 'plugins.todo-comments',

    -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
    -- Or use telescope!
    -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
    -- you can continue same window with `<space>sr` which resumes last telescope search
}, {
    ui = {
        -- If you are using a Nerd Font: set icons to an empty table which will use the
        -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
        icons = vim.g.have_nerd_font and {} or {
            cmd = '⌘',
            config = '🛠',
            event = '📅',
            ft = '📂',
            init = '⚙',
            keys = '🗝',
            plugin = '🔌',
            runtime = '💻',
            require = '🌙',
            source = '📄',
            start = '🚀',
            task = '📌',
            lazy = '💤 ',
        },
    },
})
