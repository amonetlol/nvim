--  ╭──────────────────────────────────────────────────────────╮
--  │                      BASIC KEYMAPS                       │
--  ╰──────────────────────────────────────────────────────────╯

-- Exit from insert mode
vim.keymap.set('i', 'kj', '<esc>')

-- Better up/down
vim.keymap.set({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Search
vim.keymap.set('n', '<Leader>s', '/')
vim.keymap.set('n', '<Leader>S', '?')
vim.keymap.set('n', 'ƒ', '/')

-- Search for matches within visual selection
-- vim.keymap.set('x', '<space>/', '<Esc>/\\%V')

-- Search and replace word under the cursor
vim.keymap.set('n', '<leader>R', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')

-- Search and replace in visual selection
vim.keymap.set('x', '<leader>/', [[:s/\%V]])

-- For correcting a word in insert mode
vim.keymap.set('i', '<c-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u')

-- Buffers
vim.keymap.set('n', '<Space>bd', '<cmd>bd<cr>', { desc = 'Delete Buffer' })

-- Move to window (split) using <space> hlkj keys
-- vim.keymap.set('n', '<Space>h', '<c-w>h', { desc = 'Split Left' })
-- vim.keymap.set('n', '<Space>l', '<c-w>l', { desc = 'Split Right' })
-- vim.keymap.set('n', '<Space>k', '<c-w>k', { desc = 'Split Up' })
-- vim.keymap.set('n', '<Space>j', '<c-w>j', { desc = 'Split Down' })

-- Resize split panes
vim.keymap.set('n', '<M-UP>', '<cmd>resize +2<cr>')
vim.keymap.set('n', '<M-DOWN>', '<cmd>resize -2<cr>')
vim.keymap.set('n', '<M-LEFT>', '<cmd>vertical resize +2<cr>')
vim.keymap.set('n', '<M-RIGHT>', '<cmd>vertical resize -2<cr>')

-- Move lines
vim.keymap.set('n', '<c-k>', ':m -2<CR>==')
vim.keymap.set('n', '<c-j>', ':m +1<CR>==')
-- vim.keymap.set('i', '<c-k>', '<esc><cmd>m .-2<cr>==gi')
-- vim.keymap.set('i', '<c-j>', '<esc><cmd>m .+1<cr>==gi')
vim.keymap.set('v', '<c-k>', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', '<c-j>', ":m '>+1<CR>gv=gv")

-- Indent lines in visual selection
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Paste
vim.keymap.set('v', 'p', '"_dP')
vim.keymap.set('n', 'dD', '"_dd')

-- Not yanking with 'c' and 'x'
vim.keymap.set({ 'n', 'v' }, 'c', '"_c')
vim.keymap.set('n', 'C', '"_C')
-- vim.keymap.set('n', 'x', '"_x')

-- Change inner quotes
vim.keymap.set('o', 'iq', "i'")
vim.keymap.set('o', 'iQ', 'i"')

-- Add blank line without leaving normal mode
vim.keymap.set('n', '<leader>o', 'o<Esc>')
vim.keymap.set('n', '<leader>O', 'O<Esc>')

-- Delete word with backspace
vim.keymap.set('n', '<BS>', 'ge')
vim.keymap.set('n', '<C-BS>', 'a<C-w>')

-- Clear search with <esc>
vim.keymap.set({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })

-- Add new file
vim.keymap.set('n', '<leader>fn', '<cmd>enew<cr>', { desc = 'New File' })

--  ╭──────────────────────────────────────────────────────────╮
--  │                 PLUGINS RELATED KEYMAPS                  │
--  ╰──────────────────────────────────────────────────────────╯

-- Bufferline.nvim
vim.keymap.set('n', '<S-Left>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Buffer Previous' })
vim.keymap.set('n', '<S-Right>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Buffer Next' })
vim.keymap.set('n', '<space>bp', '<cmd>BufferLineTogglePin<cr>', { desc = 'Pin Buffer' })
vim.keymap.set('n', '<space>bk', '<cmd>BufferLinePick<cr>', { desc = 'Pick Buffer' })
vim.keymap.set('n', '<space>b<left>', '<cmd>BufferLineMovePrev<cr>', { desc = 'Move Buffer to the left' })
vim.keymap.set('n', '<space>b<right>', '<cmd>BufferLineMoveNext<cr>', { desc = 'Move Buffer to the right' })
vim.keymap.set('n', '<space>b1', '<cmd>BufferLineGoToBuffer 1<cr>', { desc = 'Go to Buffer 1' })
vim.keymap.set('n', '<space>b2', '<cmd>BufferLineGoToBuffer 2<cr>', { desc = 'Go to Buffer 2' })
vim.keymap.set('n', '<space>b3', '<cmd>BufferLineGoToBuffer 3<cr>', { desc = 'Go to Buffer 3' })
vim.keymap.set('n', '<space>b4', '<cmd>BufferLineGoToBuffer 4<cr>', { desc = 'Go to Buffer 4' })
vim.keymap.set('n', '<space>b5', '<cmd>BufferLineGoToBuffer 5<cr>', { desc = 'Go to Buffer 5' })
vim.keymap.set('n', '<space>b6', '<cmd>BufferLineGoToBuffer 6<cr>', { desc = 'Go to Buffer 6' })
vim.keymap.set('n', '<space>b7', '<cmd>BufferLineGoToBuffer 7<cr>', { desc = 'Go to Buffer 7' })
vim.keymap.set('n', '<space>b8', '<cmd>BufferLineGoToBuffer 8<cr>', { desc = 'Go to Buffer 8' })
vim.keymap.set('n', '<space>b9', '<cmd>BufferLineGoToBuffer 9<cr>', { desc = 'Go to Buffer 9' })

-- nvim-treehopper
vim.keymap.set('o', 'm', [[:<c-u>lua require 'tsht'.nodes()<cr>]], { silent = true, remap = true })
vim.keymap.set('x', 'm', [[:<c-u>lua require 'tsht'.nodes()<cr>]], { silent = true })

-- lazy.nvim
vim.keymap.set('n', '<Leader>la', '<cmd>Lazy<cr>', { desc = 'Open Lazy' })
vim.keymap.set('n', '<Leader>lc', '<cmd>Lazy check<cr>', { desc = 'Check Lazy Plugins' })
vim.keymap.set('n', '<Leader>ls', '<cmd>Lazy sync<cr>', { desc = 'Sync Lazy Plugins' })

-- nvim-dap
vim.keymap.set('n', '<leader>dB', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', { desc = 'Add Conditional Breakpoint' })
vim.keymap.set('n', '<leader>dc', '<cmd>DapContinue<CR>', { desc = 'Dap Continue' })
vim.keymap.set('n', '<leader>di', '<cmd>DapStepInto<CR>', { desc = 'Dap Step Into' })
vim.keymap.set('n', '<leader>do', '<cmd>DapStepOver<CR>', { desc = 'Dap Step Over' })
vim.keymap.set('n', '<leader>ds', '<cmd>DapStepOut<CR>', { desc = 'Dap Step Out' })
vim.keymap.set('n', '<leader>dt', '<cmd>DapTerminate<CR>', { desc = 'Dap Terminate' })
vim.keymap.set('n', '<leader>dl', '<cmd>DapShowLog<CR>', { desc = 'Dap Show Log' })
vim.keymap.set('n', '<leader>dr', '<cmd>DapToggleRepl<CR>', { desc = 'Dap Toggle Repl' })

-- telescope.nvim
vim.keymap.set('n', '<leader>fc', ":lua require'telescope.builtin'.commands{}<cr>", { desc = 'List Commands' })
vim.keymap.set('n', '<leader>fj', '<cmd>Telescope emoji<cr>', { desc = 'Find emoji' })
vim.keymap.set('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>', { desc = 'Recently opened files' })
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope symbols<cr>', { desc = 'Find Symbols' })
vim.keymap.set('n', '<leader>fr', ':lua require"telescope.builtin".registers{}<cr>', { desc = 'List Registers' })

-- diffview.nvim
vim.keymap.set('n', '<leader>go', '<cmd>DiffviewOpen<cr>', { desc = 'Open Diffview' })
vim.keymap.set('n', '<leader>gc', '<cmd>DiffviewClose<cr>', { desc = 'Close Diffview' })

-- hop.nvim
vim.keymap.set('n', '<leader>hl', '<cmd>HopLine<cr>', { desc = 'Hop Line' })
vim.keymap.set('n', '<leader>h1', '<cmd>HopChar1<cr>', { desc = 'Hop 1 Char' })
vim.keymap.set('n', '<leader>h2', '<cmd>HopChar2<cr>', { desc = 'Hop 2 Chars' })
vim.keymap.set('n', '<leader>hc', '<cmd>HopVertical<cr>', { desc = 'Hop Vertical' })

-- trouble.nvim
vim.keymap.set('n', '<leader>xw', '<cmd>TroubleToggle lsp_workspace_diagnostics<cr>', { desc = 'Trouble Workspace Diagnostics' })
vim.keymap.set('n', '<leader>xd', '<cmd>TroubleToggle lsp_document_diagnostics<cr>', { desc = 'Trouble Document Diagnostics' })
vim.keymap.set('n', '<leader>xl', '<cmd>TroubleToggle loclist<cr>', { desc = 'Trouble Location List' })
vim.keymap.set('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>', { desc = 'Trouble Quickfix' })

-- noice.nvim
vim.keymap.set('n', '<space>nn', '<cmd>Noice<cr>', { desc = 'Noice Messages' })
vim.keymap.set('n', '<space>nd', '<cmd>NoiceDismiss<cr>', { desc = 'Noice Dismiss' })
vim.keymap.set('n', '<space>nl', '<cmd>NoiceLast<cr>', { desc = 'Noice Last' })
vim.keymap.set('n', '<space>nt', '<cmd>NoiceTelescope<cr>', { desc = 'Noice Telescope' })
