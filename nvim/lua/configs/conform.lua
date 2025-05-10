local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    cmake = { "cmakelang" },
    css = { "prettier" },
    html = { "prettier" },
    bash = { "shfmt" },
    json = { "fixjson" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
