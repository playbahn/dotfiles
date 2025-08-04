local map = function(keys, func, desc, mode)
    mode = mode or 'n'
    vim.keymap.set(
        mode,
        keys,
        func,
        { silent = true, buffer = true, desc = 'rustaceanvim: ' .. desc }
    )
end

map('<leader>a', function()
    vim.cmd.RustLsp 'codeAction'
end, 'Code Action')

map('J', function()
    vim.cmd.RustLsp 'joinLines'
end, 'Join adjacent lines')

map('K', function()
    vim.cmd.RustLsp { 'hover', 'actions' }
end, 'Hover Actions')
