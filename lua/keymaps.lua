local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
vim.g.mapleader = ","
vim.g.maplocalleader = ","


-- подсветка при копировании
map('v', 'S-Y', '"+y', {})

-- настройка табов barbar

-- Move to previous/next
-- map('n', '<A-h>', '<Cmd>BufferPrevious<CR>', default_opts)
-- map('n', '<A-l>', '<Cmd>BufferNext<CR>', default_opts)
-- map('n', '<A-c>', '<Cmd>BufferClose<CR>', default_opts)
-- map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', default_opts)
-- map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', default_opts)
-- map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', default_opts)
-- map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', default_opts)

-- открывает терминал
map('n', '<F1>', ':sp<CR>:terminal<CR>', {})
-- файловый браузер
map('n', '<F2>', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', default_opts)

-- goto defenition / declaration
map('n', '<leader>g', '<Cmd>lua vim.lsp.buf.declaration()<CR>', default_opts)
map('n', '<leader>G', '<Cmd>lua vim.lsp.buf.definition()<CR>', default_opts)

-- git 
map('n', '<leader>gb', '<Cmd>:Git blame<CR>', default_opts)
map('n', '<leader>gd', '<Cmd>:Gvdiffsplit<CR>', default_opts)


