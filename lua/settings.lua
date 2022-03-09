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
-- cmd'colorscheme onedark'


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
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]]
exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup end
]], false)



-- local lsp_installer = require("nvim-lsp-installer")
-- lsp_installer.on_server_ready(function(server)
--     local opts = {}
--     if server.name == "sumneko_lua" then
--         -- only apply these settings for the "sumneko_lua" server
--         opts.settings = {
--             Lua = {
--                 diagnostics = {
--                     -- Get the language server to recognize the 'vim', 'use' global
--                     globals = {'vim', 'use'},
--                 },
--                 workspace = {
--                     -- Make the server aware of Neovim runtime files
--                     library = vim.api.nvim_get_runtime_file("", true),
--                 },
--                 -- Do not send telemetry data containing a randomized but unique identifier
--                 telemetry = {
--                     enable = false,
--                 },
--             },
--         }
--     end
--     server:setup(opts)
-- end)




