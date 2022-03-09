local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
map('v', 'S-Y', '"+y', {})

map('n', '<F2>', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', default_opts)
map('n', '<C-p>', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], default_opts)
