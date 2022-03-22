local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}


return packer.startup(function(use)
    -- My plugins here
    use 'nvim-lualine/lualine.nvim'
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/plenary.nvim"
    use "windwp/nvim-autopairs"
    use "nvim-lua/popup.nvim"

    use "kyazdani42/nvim-web-devicons"
    use { "kyazdani42/nvim-tree.lua", config = function() require'nvim-tree'.setup {} end, }

    use 'stevearc/dressing.nvim'
    use "folke/twilight.nvim"
    use "sunjon/shade.nvim"
    use "shaeinst/roshnivim-cs"
    use 'tanvirtin/monokai.nvim'
    use 'shaunsingh/nord.nvim'
    use 'ellisonleao/gruvbox.nvim'
    use 'sainnhe/gruvbox-material'
    use "projekt0n/github-nvim-theme"

    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-file-browser.nvim"
    use "nvim-telescope/telescope-project.nvim"
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", }
    use "lukas-reineke/indent-blankline.nvim"

    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    -- use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
    -- use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

    -- Autocompletion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use 'hrsh7th/cmp-path'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'



    use 'mhinz/vim-startify'
    use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }

    -- -- cmp plugins
    -- use "hrsh7th/nvim-cmp" -- The completion plugin
    -- use "hrsh7th/cmp-buffer" -- buffer completions
    -- use "hrsh7th/cmp-path" -- path completions
    -- use "saadparwaiz1/cmp_luasnip" -- snippet completions
    -- use "hrsh7th/cmp-nvim-lsp"



    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

