-- lua/plugins/configs/conform.lua

return {
  formatters_by_ft = {
    lua = { "stylua" },
  },

  -- só formata ao salvar arquivos Lua (os demais ficam como estão)
  format_on_save = function(bufnr)
    if vim.bo[bufnr].filetype ~= "lua" then
      return nil
    end

    return {
      timeout_ms = 500,
      lsp_format = "fallback",
    }
  end,
}
