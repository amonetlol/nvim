local toggleterm = require('toggleterm')

toggleterm.setup({
  -- Configurações gerais padrão
  shade_terminals = true,
  persist_size = true,
  insert_mappings = true,
})

-- ==========================================
-- MAPEAMENTO PARA ABRIR OS TERMINAIS
-- ==========================================

-- Ctrl + ' abre em modo FLOAT (flutuante)
vim.keymap.set({'n', 't'}, "<C-'>", "<Cmd>ToggleTerm direction=float<CR>", { desc = "Terminal Flutuante" })

-- Ctrl + \ abre em modo HORIZONTAL com tamanho 30
vim.keymap.set({'n', 't'}, "<C-\\>", "<Cmd>ToggleTerm size=30 direction=horizontal<CR>", { desc = "Terminal Horizontal" })

-- Ctrl + | abre em modo VERTICAL com tamanho 30
-- Nota: Como o '|' geralmente precisa do Shift, o Neovim lê como <C-[> ou <C-S-|> dependendo do terminal.
-- O mapeamento abaixo cobre a maioria dos emuladores de terminal modernos.
vim.keymap.set({'n', 't'}, "<C-|>", "<Cmd>ToggleTerm size=30 direction=vertical<CR>", { desc = "Terminal Vertical" })


-- ==========================================
-- MAPEAMENTO PARA SAIR DO MODO TERMINAL
-- ==========================================
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  
  -- ESC sai do modo de inserção/digitação do terminal
  vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], opts)
  
  -- Ctrl + / também sai do modo de inserção/digitação
  -- Em muitos terminais, Ctrl + / envia o sinal <C-_>, por isso mapeamos ambos para garantir
  vim.keymap.set('t', '<C-/>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-_>', [[<C-\><C-n>]], opts)
end

-- Aplica as regras de saída (ESC e Ctrl+/) sempre que um terminal do ToggleTerm abrir
vim.cmd('autocmd! TermOpen term://* toggleterm#* lua set_terminal_keymaps()')
