local cmd = vim.cmd
local exec = vim.api.nvim_exec
local g = vim.g
local opt = vim.opt


g.tagbar_compact = 1
g.tagbar_sort = 0


opt.colorcolumn = '80'              -- Разделитель на 80 символов
opt.cursorline = true               -- Подсветка строки с курсором
opt.number = true                   -- Включаем нумерацию строк
opt.splitright = true               -- vertical split вправо
opt.splitbelow = true               -- horizontal split вниз
opt.termguicolors = true      --  24-bit RGB colors
vim.o.signcolumn = 'yes:1'
vim.opt.mouse = 'a'
-- cmd'colorscheme rvcs'
cmd'colorscheme gruvbox'


cmd([[
filetype indent plugin on
syntax enable
]])
opt.expandtab = true      -- use spaces instead of tabs
opt.shiftwidth = 4        -- shift 4 spaces when tab
opt.tabstop = 4           -- 1 tab == 4 spaces
opt.smartindent = true    -- autoindent new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

cmd [[
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=<:>
]]

cmd [[
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]]

exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup end
]], false)

vim.opt.list = true
vim.opt.listchars:append("eol:↴")
vim.opt.clipboard = 'unnamed,unnamedplus'

-- cmd([[ 
--     function! DetectAnsible()
--         for line in getline(1, 1000)
--             if line =~ '- name:'
--                 setfiletype yaml.ansible
--                 break
--             endif
--         endfor
--     endfunction
--     autocmd au BufRead,BufNewFile * call DetectAnsible()
--     ]])

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_trailing_blankline_indent = false,
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true,
}

-- require('lualine').setup()
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}


require'shade'.setup({
  overlay_opacity = 50,
  opacity_step = 1,
  keys = {
    brightness_up    = '<C-Up>',
    brightness_down  = '<C-Down>',
    toggle           = '<Leader>s',
  }
})


-- Set barbar's options
require'bufferline'.setup {
  -- Enable/disable animations
  animation = true,

  -- Enable/disable auto-hiding the tab bar when there is a single buffer
  auto_hide = false,

  -- Enable/disable current/total tabpages indicator (top right corner)
  tabpages = true,

  -- Enable/disable close button
  closable = true,

  -- Enables/disable clickable tabs
  --  - left-click: go to buffer
  --  - middle-click: delete buffer
  clickable = true,

  -- Excludes buffers from the tabline
  -- exclude_ft = {'javascript'},
  -- exclude_name = {'package.json'},

  -- Enable/disable icons
  -- if set to 'numbers', will show buffer index in the tabline
  -- if set to 'both', will show buffer index and icons in the tabline
  icons = true,

  -- If set, the icon color will follow its corresponding buffer
  -- highlight group. By default, the Buffer*Icon group is linked to the
  -- Buffer* group (see Highlighting below). Otherwise, it will take its
  -- default value as defined by devicons.
  icon_custom_colors = false,

  -- Configure icons on the bufferline.
  icon_separator_active = '▎',
  icon_separator_inactive = '▎',
  icon_close_tab = '',
  icon_close_tab_modified = '●',
  icon_pinned = '車',

  -- If true, new buffers will be inserted at the start/end of the list.
  -- Default is to insert after current buffer.
  insert_at_end = false,
  insert_at_start = false,

  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 1,

  -- Sets the maximum buffer name length.
  maximum_length = 30,

  -- If set, the letters for each buffer in buffer-pick mode will be
  -- assigned based on their name. Otherwise or in case all letters are
  -- already assigned, the behavior is to assign letters in order of
  -- usability (see order below)
  semantic_letters = true,

  -- New buffer letters are assigned in this order. This order is
  -- optimal for the qwerty keyboard layout but might need adjustement
  -- for other layouts.
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

  -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
  -- where X is the buffer number. But only a static string is accepted here.
  no_name_title = nil,
}

-- local nvim_tree_events = require('nvim-tree.events')
-- local bufferline_state = require('bufferline.state')
--
-- local function get_tree_size()
--   return vim.api.nvim_win_get_width(0)
-- end
-- nvim_tree_events.on_tree_open(function()
--   bufferline_state.set_offset(get_tree_size())
-- end)
--
-- nvim_tree_events.on_tree_resize(function()
--   bufferline_state.set_offset(get_tree_size())
-- end)
--
-- nvim_tree_events.on_tree_close(function()
--   bufferline_state.set_offset(0)
-- end)
