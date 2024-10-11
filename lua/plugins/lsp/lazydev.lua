return {
    {
        'folke/lazydev.nvim',
        ft = 'lua',
        dependencies = {
            { 'justinsgithub/wezterm-types', lazy = true },
            { 'Bilal2453/luvit-meta', lazy = true },
        },
        opts = {
            library = {
                'lazy.nvim',
                'luvit-meta/library',
                { path = 'wezterm-types', mods = { 'wezterm' } },
            },
        },
    },
    {
        'hrsh7th/nvim-cmp',
        opts = function(_, opts)
            opts.sources = opts.sources or {}
            table.insert(opts.sources, {
                name = 'lazydev',
                group_index = 0, -- set group index to 0 to skip loading LuaLS completions
            })
        end,
    },
}
