local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
vim.g.mapleader = ","
vim.g.maplocalleader = ","


map('v', 'S-Y', '"+y', {})
map('n', '<F1>', ':sp<CR>:terminal<CR>', {})

map('n', 'g<leader>', '<Cmd>lua vim.lsp.buf.declaration()<CR>', default_opts)
map('n', 'G<leader>', '<Cmd>lua vim.lsp.buf.definition()<CR>', default_opts)


map('n', '<F2>', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', default_opts)
