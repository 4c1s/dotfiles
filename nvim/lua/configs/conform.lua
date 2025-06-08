local options = {
  formatters_by_ft = {
    c = { "clang-format" },
    cpp = { "clang-format" },
    lua = { "stylua" },
    -- cmake = { "cmakelang" },
    css = { "prettier" },
    html = { "prettier" },
    bash = { "shfmt" },
    json = { "fixjson" },
    javascript = { "biome" },
    typescript = { "biome" },
    tsx = { "biome" },
    python = { "black" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
