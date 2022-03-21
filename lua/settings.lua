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
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
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

