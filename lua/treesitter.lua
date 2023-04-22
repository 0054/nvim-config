-- local status_ok, configs = pcall(require, "nvim-treesitter.configs")
-- if not status_ok then
--   return
-- end

require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",  -- A list of parser names, or "all"
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    auto_install = false,
    autopairs = {
        enable = true,
    },
    highlight = {
        enable = true, -- false will disable the whole extension
    },
    indent = {
        enable = true,
    },
}
