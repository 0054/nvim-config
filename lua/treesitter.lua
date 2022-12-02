local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {

    ensure_installed = "all",  -- A list of parser names, or "all"
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { "" }, -- List of parsers to ignore installing

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = false,

    autopairs = {
        enable = true,
    },
    highlight = {
        enable = true, -- false will disable the whole extension
        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        disable = { "" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
    },
    indent = {
        enable = true,
        -- disable = {
        --     "yaml"
        -- }
    },
    -- context_commentstring = {
    --     enable = true,
    --     enable_autocmd = false,
    -- },
}
