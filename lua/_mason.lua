require("mason").setup()
-- Although many packages are perfectly usable out of the box through Neovim builtins, 
-- it is recommended to use other 3rd party plugins to further integrate these. 
-- The following plugins are recommended:
-- 	LSP: lspconfig & mason-lspconfig.nvim
-- 	DAP: nvim-dap Linters: null-ls.nvim or nvim-lint
-- 	Formatters: null-ls.nvim or formatter.nvim



local lspconfig = require("mason-lspconfig").setup()
-- require("mason-lspconfig").setup({
--     ensure_installed = {
--         "jdtls",
--         "lua-language-server",
--         "python-lsp-server",
--         "terraform-ls",
--         "yaml-language-server"
--     }
-- })
require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,


    -- Next, you can provide targeted overrides for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    -- ["pylsp"] = function()
    --     lspconfig.pylsp.setup {
    --         Plugins = {
    --             flake8 = {
    --                 enable = true
    --             }
    --         }
    --     }
    -- end

    -- ["rust_analyzer"] = function ()
    --     require("rust-tools").setup {}
    -- end
}


local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
map('n', '<leader>m', '<Cmd>:Mason<CR>', default_opts)

