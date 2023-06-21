vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 100,
        })
    end,
})
--
-- vim.api.nvim_create_autocmd('BufWritePost', {
--     pattern = 'packer_init.lua',
--     callback = function ()
--         vim.cmd('luafile %')
--         vim.cmd('lua vim.notify("Packer Source", "info")')
--     end,
-- })

-- Inlay hints
vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
    callback = function()
        vim.lsp.buf.inlay_hint(0, true)
    end,
})
vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
    callback = function()
        vim.lsp.buf.inlay_hint(0, false)
    end,
})
