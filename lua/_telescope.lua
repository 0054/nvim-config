-- -------------------------------------------------------------------------- --
-- TELESCOPE
-- GITHUB https://github.com/nvim-telescope/telescope.nvim
-- -------------------------------------------------------------------------- --

require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    file_browser = {
      -- theme = "ivy",
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    -- project = {
    --   base_dirs = {
    --     '~/ta',
    --   },
    -- },
  },
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}
require'telescope'.load_extension('project')
require'telescope'.load_extension('file_browser')


-- require'telescope'.extensions.project.project{}


local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- map('n', '<C-p>', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], default_opts)

-- Find files using Telescope command-line sugar.
map('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], default_opts)
map('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], default_opts)
map('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], default_opts)
map('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], default_opts)
map('n', '<leader>fc', [[<cmd>lua require('telescope.builtin').colorscheme()<cr>]], default_opts)
map('n', '<leader>fr', ":Telescope file_browser<CR>", default_opts)
map('n', '<leader>fp', ":lua require'telescope'.extensions.project.project{}<CR>", default_opts)
-- map('n', '<leader>fp', [[<cmd>lua require('telescope'.extentions.project.project{}<cr>]], default_opts)

