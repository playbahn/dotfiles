return {
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
        'folke/lazydev.nvim',
        {
            -- Snippet Engine
            'L3MON4D3/LuaSnip',
            version = '2.*',
            -- Build Step is needed for regex support in snippets. This step is not supported in
            -- many windows environments. Remove the below condition to re-enable on windows.
            build = vim.fn.has 'win32' == 0
                and vim.fn.executable 'make' == 1
                and 'make install_jsregexp',
            dependencies = {
                -- Snippets collection for a set of different programming languages (VS Code style)
                -- https://github.com/rafamadriz/friendly-snippets
                'rafamadriz/friendly-snippets',
            },
            config = function()
                require('luasnip.loaders.from_vscode').lazy_load() -- For VS Code style snippets
                require('luasnip').setup()
            end,
        },
    },
    opts_extend = { 'sources.default' },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
        keymap = {
            -- 'default' (recommended) for mappings similar to built-in completions
            --   <c-y> to accept ([y]es) the completion.
            --    This will auto-import if your LSP supports it.
            --    This will expand snippets if the LSP sent a snippet.
            -- 'super-tab' for tab to accept
            -- 'enter' for enter to accept
            -- 'none' for no mappings
            --
            -- For an understanding of why the 'default' preset is recommended,
            -- you will need to read `:help ins-completion`
            --
            -- No, but seriously. Please read `:help ins-completion`, it is really good!
            --
            -- All presets have the following mappings:
            -- <tab>/<s-tab>: move to forward/backward of your snippet expansion
            -- <c-space>: Open menu or open docs if already open
            -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
            -- <c-e>: Hide menu
            -- <c-k>: Toggle signature help
            --
            -- See :h blink-cmp-config-keymap for defining your own keymap
            preset = 'default',
            -- stylua: ignore start
            ['<A-1>'] = { function(cmp) cmp.accept({ index = 01 }) end },
            ['<A-2>'] = { function(cmp) cmp.accept({ index = 02 }) end },
            ['<A-3>'] = { function(cmp) cmp.accept({ index = 03 }) end },
            ['<A-4>'] = { function(cmp) cmp.accept({ index = 04 }) end },
            ['<A-5>'] = { function(cmp) cmp.accept({ index = 05 }) end },
            ['<A-6>'] = { function(cmp) cmp.accept({ index = 06 }) end },
            ['<A-7>'] = { function(cmp) cmp.accept({ index = 07 }) end },
            ['<A-8>'] = { function(cmp) cmp.accept({ index = 08 }) end },
            ['<A-9>'] = { function(cmp) cmp.accept({ index = 09 }) end },
            ['<A-0>'] = { function(cmp) cmp.accept({ index = 10 }) end },
            -- stylua: ignore end

            -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
            --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
        },
        appearance = {
            -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'normal',
        },
        completion = {
            -- Controls what the plugin considers to be a keyword,
            -- used for fuzzy matching and triggering completions
            keyword = {
                -- 'prefix' will fuzzy match on the text before the cursor
                -- 'full' will fuzzy match on the text before _and_ after the cursor
                -- example: 'foo_|_bar' will match 'foo_' for 'prefix' and 'foo__bar' for 'full'
                range = 'prefix',
            },
            -- Controls when to request completion items from the sources and show the completion menu
            trigger = {
                -- When true, will show completion window after backspacing into a keyword
                show_on_backspace_in_keyword = true,
            },
            -- Manages the completion list and its behavior when selecting items
            list = {
                selection = {
                    -- looks nice with ghost text
                    auto_insert = false,
                },
            },
            -- Manages the appearance of the completion menu
            menu = {
                scrollbar = false,
                draw = {
                    -- Use treesitter to highlight the label text for the given list of sources
                    --   Too noisy, kind_icon is enough
                    treesitter = {
                        -- 'lsp',
                    },
                    -- Components to render, grouped by column. Check out
                    -- https://cmp.saghen.dev/configuration/completion#available-components
                    columns = {
                        { 'item_idx' },
                        { 'kind_icon' },
                        { 'label' },
                    },
                    -- Definitions for possible components to render. Each defines:
                    --   ellipsis: whether to add an ellipsis when truncating the text
                    --   width: control the min, max and fill behavior of the component
                    --   text function: will be called for each item
                    --   highlight function: will be called only when the line appears on screen
                    components = {
                        -- Overriding `columns[1].item_idx`
                        item_idx = {
                            text = function(ctx)
                                return ctx.idx == 10 and '0'
                                    or ctx.idx > 10 and ' '
                                    or tostring(ctx.idx)
                            end,
                        },
                    },
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500,
                -- Whether to use treesitter highlighting, disable if you run into performance issues
                treesitter_highlighting = true,
                window = {
                    scrollbar = false,
                },
            },
            -- Displays a preview of the selected item on the current line
            ghost_text = {
                enabled = true,
                -- Show the ghost text when an item has been selected
                show_with_selection = true,
                -- Show the ghost text when no item has been selected, defaulting to the first item
                show_without_selection = true,
                -- Show the ghost text when the menu is open
                show_with_menu = true,
                -- Show the ghost text when the menu is closed
                show_without_menu = true,
            },
        },
        -- See :h blink-cmp-config-fuzzy for more information
        fuzzy = {
            implementation = 'prefer_rust_with_warning',
        },
        -- Shows a signature help window while you type arguments for a function
        signature = {
            enabled = true,
        },
        -- things that provide you with completion items, trigger characters, documentation and signature help
        sources = {
            -- `lsp`, `path`, `snippets`, `luasnip`, `buffer`, and `omni` sources are built-in
            default = { 'lsp', 'path', 'snippets' },
            per_filetype = {
                lua = { inherit_defaults = true, 'lazydev' },
            },
            providers = {
                path = {
                    opts = {
                        -- Path completion from cwd instead of current buffer's directory
                        get_cwd = function(_)
                            return vim.fn.getcwd()
                        end,
                    },
                },
                snippets = {
                    -- Hide snippets after trigger character
                    should_show_items = function(ctx)
                        local disabled_nodes = { 'string_content', 'string_literal' }
                        local success, node = pcall(vim.treesitter.get_node)
                        local in_string = success
                            and node
                            and vim.tbl_contains(disabled_nodes, node:type())
                        return not in_string and ctx.trigger.initial_kind ~= 'trigger_character'
                    end,
                },
                lazydev = {
                    name = 'LazyDev',
                    module = 'lazydev.integrations.blink',
                    -- make lazydev completions top priority (see `:h blink.cmp`)
                    score_offset = 100,
                },
            },
        },
        snippets = {
            preset = 'luasnip',
        },
    },
}
