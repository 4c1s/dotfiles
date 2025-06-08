require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "clangd",
  "cmake",
  "bashls",
  "vale_ls",
  "vtsls",
  "tailwindcss",
  "pyright",
  "rust_analyzer",
  "biome",
}

vim.lsp.enable(servers)
