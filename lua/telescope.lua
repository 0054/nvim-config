-- -------------------------------------------------------------------------- --
-- TELESCOPE
-- GITHUB https://github.com/nvim-telescope/telescope.nvim
-- -------------------------------------------------------------------------- --



local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- map('n', '<C-p>', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], default_opts)

-- Find files using Telescope command-line sugar.
map('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], default_opts)
map('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], default_opts)
map('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], default_opts)
map('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], default_opts)
map('n', '<leader>fc', [[<cmd>lua require('telescope.builtin').colorscheme()<cr>]], default_opts)

