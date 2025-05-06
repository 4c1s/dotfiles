require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "clangd", "cmake", "bashls", "vale_ls", "vtsls", "tailwindcss" }
vim.lsp.enable(servers)
