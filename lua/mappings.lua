local map = vim.keymap.set

-- CTRL+S = Salvar
-- CTRL+q = wqa
-- CTRL+d = deleta conteudo todo
-- CTRL+c = copiar conteduo todo
-- CTRL+n = NvimTreeToggle
-- CTRL+n = NvimTreeFocus
-- SELECT + gf = abrir arquivo
-- ALT+q = fecha buffer
-- Cursor MOUSE + gx = abri link no navegador
-- F1 = cheatsheet
-- split = :sp
-- vsplit = :vp
-- Novo Arquivo = :enew
-- :sp | term = split terminal
-- :vp | term = vsplit terminal

-- ### TERMminal ###
-- Ctrl + ' = float term
-- CTRL + \ = horizontal term
-- Sair = exit 

-- general mappings
map("n", "<C-s>", "<cmd> w <CR>")
map("i", "jk", "<ESC>")
map("n", "<C-c>", "<cmd> %y+ <CR>") -- copy whole filecontent
map("n", "<C-d>", function()
  vim.cmd("%d")
  --vim.notify("Conteúdo do arquivo deletado", vim.log.levels.INFO)
end, { desc = "🗑️ Deletar todo o conteúdo" })

-- nvimtree
map("n", "<C-n>", "<cmd> NvimTreeToggle <CR>")
map("n", "<leader>e", "<cmd> NvimTreeToggle <CR>", { desc = "Explorer" })
map("n", "<C-h>", "<cmd> NvimTreeFocus <CR>")
map("n", "<leader>E", "<cmd> NvimTreeFocus <CR>", { desc = "Explorer Focus" })

-- ==================== TELESCOPE ================================================================================

vim.keymap.set("n", "<leader>t", "<Nop>", { desc = "+Telescope" })

-- Find Files
vim.keymap.set("n", "<leader>tf", function()
  require("telescope.builtin").find_files()
end, { desc = "Find Files (cwd)" })

-- Find Files no Home
vim.keymap.set("n", "<leader>tH", function()
  require("telescope.builtin").find_files {
    cwd = vim.fn.expand "~",
    hidden = true,
  }
end, { desc = "Find Files (Home)" })

-- Old Files
vim.keymap.set("n", "<leader>to", function()
  require("telescope.builtin").oldfiles()
end, { desc = "Old Files" })

-- Live Grep (cwd)
vim.keymap.set("n", "<leader>tw", function()
  require("telescope.builtin").live_grep()
end, { desc = "Live Grep (cwd)" })

-- Live Grep no Home
vim.keymap.set("n", "<leader>th", function() -- mudei para <leader>th pra ficar consistente
  require("telescope.builtin").live_grep {
    cwd = vim.fn.expand "~",
    additional_args = { "--hidden" },
  }
end, { desc = "Live Grep (Home)" })

-- Git Status
vim.keymap.set("n", "<leader>tg", function()
  require("telescope.builtin").git_status()
end, { desc = "Git Status" })

-- ==================== FIM_TELESCOPE ================================================================================

-- bufferline, cycle buffers
map("n", "<Tab>", "<cmd> BufferLineCycleNext <CR>")
map("n", "<S-Tab>", "<cmd> BufferLineCyclePrev <CR>")
map("n", "<A-q>", "<cmd> bd <CR>")

-- comment.nvimmap("n", "<leader>q", { "<cmd>qwa<CR>", desc = ":qwa" })
map("n", "<leader>/", "gcc", { remap = true })
map("v", "<leader>/", "gc", { remap = true })

-- Fechar / Salvar
map("n", "<leader>q", "<cmd>wqa<CR>", { desc = ":wqa" })
map("n", "<C-q>", "<cmd>wqa<CR>", { desc = ":wqa" })
map("n", "<leader>Q", "<cmd>q!<CR>", { desc = ":q!" })

-- ==================== Settings ================================================================================
map("n", "<leader>c", "<Nop>", { desc = " Settings" })
map("n", "<leader>ct", "<cmd>Themery<cr>", { desc = " Themery - Switch theme" })
map("n", "<leader>cr", "<cmd>so<cr>", { desc = "󰑓 Reload config" })

-- cheatsheet Mappings
map('n', '<leader>cf', function()
    local mappings_file = vim.fn.expand('~/.config/nvim/lua/mappings.lua')
    vim.cmd('edit ' .. vim.fn.fnameescape(mappings_file))
end, { desc = "cheatsheet (mappings.lua) F1" })

map("n", "<F1>", "<cmd>edit ~/.config/nvim/lua/mappings.lua<cr>", { desc = "cheatsheet (mappings.lua)" })

-- format
map("n", "<leader>cc", function()
  require("conform").format()
end, { desc = "Formatar codigo" })

-- ==================== FIM_Settings ================================================================================


