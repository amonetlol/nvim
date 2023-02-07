require('mason').setup({
    ui = {
        icons = {
            package_installed = ' ',
            package_pending = ' ',
            package_uninstalled = ' ',
        },
    },
})
require('mason-lspconfig').setup()
local lspconfig = require('lspconfig')

-- local navic = require('nvim-navic')

-- CMP LSP
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Options with description
local opts = function(desc)
    return { noremap = true, silent = true, desc = desc }
end

-- local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, opts('Open Diagnostic Window'))
vim.keymap.set('n', '<space><left>', vim.diagnostic.goto_prev, opts('Previous Diagnostic'))
vim.keymap.set('n', '<space><right>', vim.diagnostic.goto_next, opts('Next Diagnostic'))
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts('Send Diagnostic to Locallist'))

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = function(desc)
        return { noremap = true, silent = true, buffer = bufnr, desc = desc }
    end
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts('Go to Declaration'))
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts('Go to Definition'))
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts('Hover'))
    vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, bufopts('Go to Implementation'))
    vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help, bufopts('Signature Help'))
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts('Add workspace folder'))
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts('Remove workspace folder'))
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts('List workspace folders'))
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts('Type Definition'))
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts('Rename LSP'))
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts('Code Action LSP'))
    vim.keymap.set('n', 'gR', vim.lsp.buf.references, bufopts('Go to Reference'))
    vim.keymap.set('n', '<space>f', function()
        vim.lsp.buf.format({ async = true })
    end, bufopts('Formatting'))
    vim.keymap.set('v', '<space>1f', vim.lsp.buf.format, bufopts('Range Fromatting'))
    -- navic.attach(client, bufnr)
end

-- Keymaps
-- local on_attach = function(client, bufnr)
--     vim.keymap.set('n', '<space>d', '<cmd>lua vim.diagnostic.open_float()<CR>', { buffer = true })
--     vim.keymap.set('n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { buffer = true })
--     vim.keymap.set('n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', { buffer = true })
--     vim.keymap.set('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', { buffer = true })
--     vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { buffer = true })
--     vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { buffer = true })
--     vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { buffer = true })
--     vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { buffer = true })
--     vim.keymap.set('n', '<leader>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { buffer = true })
--     vim.keymap.set('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', { buffer = true })
--     vim.keymap.set('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', { buffer = true })
--     vim.keymap.set('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', { buffer = true })
--     vim.keymap.set('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { buffer = true })
--     vim.keymap.set('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { buffer = true })
--     vim.keymap.set('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { buffer = true })
--     vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { buffer = true })
--     vim.keymap.set('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting_sync()<CR>', { buffer = true })
--     navic.attach(client, bufnr)
-- end

-- Borders
-- vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#181926]])
-- vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#181926]])

local border = {
    { '┌', 'FloatBorder' },
    { '─', 'FloatBorder' },
    { '┐', 'FloatBorder' },
    { '│', 'FloatBorder' },
    { '┘', 'FloatBorder' },
    { '─', 'FloatBorder' },
    { '└', 'FloatBorder' },
    { '│', 'FloatBorder' },
}

-- LSP settings (for overriding per client)
local handlers = {
    ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
    ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

-- Disable lsp (not cmp) inline diagnostics error messages
-- vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--     virtual_text = false,
-- })

-- SERVERS
-- Lua server
lspconfig.sumneko_lua.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    handlers = handlers,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                -- enable = true,
                globals = { 'vim', 'use', 'winid' },
            },
            workspace = {
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.stdpath('config') .. '/lua'] = true,
                    [vim.fn.expand('%:p:h')] = true,
                },
                -- library = vim.api.nvim_get_runtime_file('', true),
                -- library = ${workspace}/**/init.lua,
            },
            completion = {
                enable = true,
            },
            format = {
                enable = true,
                defaultConfig = {
                    indent_style = 'space',
                    indent_size = '4',
                    quote_style = 'single',
                },
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

-- JavaScript Server
lspconfig.tsserver.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    handlers = handlers,
    -- settings = {
    --     tsserver = {
    --         init_options = {
    --             preferences = {
    --                 quotePreference = 'single',
    --                 disableSuggestions = true,
    --             },
    --         }
    --     }
    -- }
    init_options = {
        preferences = {
            quotePreference = 'single',
            disableSuggestions = true,
        },
    },
})

-- Python Server
lspconfig.pyright.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    handlers = handlers,
})

-- Emmet Server
lspconfig.emmet_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    handlers = handlers,
    filetypes = { 'html', 'sass', 'scss', 'css', 'typescriptreact', 'javascriptreact', 'vue' },
})

-- CSS Server
lspconfig.cssls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    handlers = handlers,
    settings = {
        css = {
            lint = {
                unknownAtRules = 'ignore',
            },
        },
    },
})

-- Tailwind Server
-- lspconfig.tailwindcss.setup({
--     capabilities = capabilities,
--     on_attach = on_attach,
--     handlers = handlers,
-- })

-- Volar Vue Server
lspconfig.volar.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    handlers = handlers,
    filetypes = {
        'vue', --[[ 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'json' ]]
    },
    init_options = {
        preferences = {
            disableSuggestions = true,
        },
        languageFeatures = {
            diagnostics = true,
        },
        typescript = {
            serverPath = '/Users/ilias/.local/share/nvim/lsp_servers/tsserver/node_modules/typescript/lib/tsserverlibrary.js',
        },
    },
})

-- JSON Server
lspconfig.jsonls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    handlers = handlers,
    filetypes = { 'json', 'jsonc' },
    init_options = {
        provideFormatter = true,
    },
})

-- HTML Server
lspconfig.html.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    handlers = handlers,
})

-- LTex Server
lspconfig.ltex.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    handlers = handlers,
    settings = {
        ltex = {
            language = 'de-DE',
        },
    },
})

-- TexLab Server
lspconfig.texlab.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    handlers = handlers,
    settings = {
        texlab = {
            auxDirectory = '.',
            bibtexFormatter = 'texlab',
            build = {
                args = { '-pdf', '-interaction=nonstopmode', '-synctex=1', '%f' },
                executable = 'latexmk',
                forwardSearchAfter = false,
                onSave = false,
            },
            chktex = {
                onEdit = false,
                onOpenAndSave = false,
            },
            diagnosticsDelay = 300,
            formatterLineLength = 100,
            forwardSearch = {
                args = {},
            },
            latexFormatter = 'latexindent',
            latexindent = {
                modifyLineBreaks = false,
            },
        },
    },
})

-- PHP Server
lspconfig.intelephense.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    handlers = handlers,
})

-- Java Server
-- lspconfig.jdtls.setup({
--     capabilities = capabilities,
--     on_attach = on_attach,
--     handlers = handlers,
-- })

-- YAML Server
lspconfig.yamlls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    handlers = handlers,
    settings = {
        yaml = {
            validate = true,
            hover = true,
            completion = true,
            format = {
                enable = true,
                singleQuote = true,
                bracketSpacing = true,
            },
            editor = {
                tabSize = 2,
            },
            schemaStore = {
                enable = true,
            },
        },
        editor = {
            tabSize = 2,
        },
    },
})

-- Rust
lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    handlers = handlers,
})

-- Diagnostics signs
local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
    virtual_text = {
        prefix = '■ ', -- Could be '●', '▎', 'x', '■', , 
    },
    float = { border = border },
    -- virtual_text = false,
    -- signs = true,
    -- underline = true,
})
