local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

map('v', 'S-Y', '"+y', {})

map('n', '<F1>', ':nohl<CR>', default_opts)
