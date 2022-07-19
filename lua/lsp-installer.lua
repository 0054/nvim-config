-- -------------------------------------------------------------------------- --
--  LSP-INSTALLER
-- GITHUB https://github.com/williamboman/nvim-lsp-installer
-- -------------------------------------------------------------------------- --

local lsp_installer = require("nvim-lsp-installer")


local DEFAULT_SETTINGS = {
    -- ensure_installed = {
    --     'pyrightls',
    --     'terraformls',
    --     'bashls',
    --     'groovyls',
    --     'ansiblels',
    --     'dockerls'
    -- },
    automatic_installation = false,
    ui = {
        -- Whether to automatically check for outdated servers when opening the UI window.
        check_outdated_servers_on_open = true,

        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        border = "none",
        icons = {

            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }

    }

}
-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
lsp_installer.settings(DEFAULT_SETTINGS)
-- lsp_installer.settings({
--     ui = {
--         icons = {
--
--             server_installed = "✓",
--             server_pending = "➜",
--             server_uninstalled = "✗"
--         }
--     }
-- })
--
--
