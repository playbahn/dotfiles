local map = function(keys, func, desc, mode)
    mode = mode or 'n'
    vim.keymap.set(
        mode,
        keys,
        func,
        { silent = true, buffer = true, desc = 'rustaceanvim: ' .. desc }
    )
end

vim.opt_local.breakat:remove { '!', ':', '.' }
vim.opt_local.breakat:append '})]'

vim.g.rustfmt_autosave_if_config_present = 1

-- stylua: ignore start
map('<leader>a', function() vim.cmd 'RustLsp codeAction'    end, 'Code Action'        )
map('J',         function() vim.cmd 'RustLsp joinLines'     end, 'Join adjacent lines')
map('K',         function() vim.cmd 'RustLsp hover actions' end, 'Hover Actions'      )
-- stylua: ignore end
