require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<space>h", function() Snacks.terminal.open() end)
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
