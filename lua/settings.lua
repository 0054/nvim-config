local cmd = vim.cmd
local exec = vim.api.nvim_exec
local g = vim.g
local opt = vim.opt


-- g.tagbar_compact = 1
-- g.tagbar_sort = 0


opt.colorcolumn = '120'              -- Разделитель на 120 символов
opt.cursorline = true               -- Подсветка строки с курсором
opt.number = true                   -- Включаем нумерацию строк
opt.splitright = true               -- vertical split вправо
opt.splitbelow = true               -- horizontal split вниз
opt.termguicolors = true      --  24-bit RGB colors
vim.o.signcolumn = 'yes:1'
vim.opt.mouse = 'a'

-- cmd'colorscheme rvcs'
-- cmd'colorscheme gruvbox'
-- cmd'colorscheme abscs'
cmd'colorscheme carbonfox'


-- cmd([[
-- filetype indent plugin on
-- syntax enable
-- ]])

-- отступы
opt.expandtab = true      -- use spaces instead of tabs
opt.shiftwidth = 4        -- shift 4 spaces when tab
opt.tabstop = 4           -- 1 tab == 4 spaces
opt.softtabstop = 4
opt.smartindent = true    -- autoindent new lines

cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

cmd [[
autocmd FileType terraform setlocal ts=2 sts=2 sw=2
]]

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

