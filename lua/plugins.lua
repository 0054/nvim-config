-- local fn = vim.fn
-- local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
-- if fn.empty(fn.glob(install_path)) > 0 then
--     packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
--     print "Installing packer close and reopen Neovim..."
--     vim.cmd [[packadd packer.nvim]]
-- end


-- автоматически утанавливать packer 
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/plenary.nvim" -- библиотека с функция для NVIM
    use "nvim-lua/popup.nvim" -- библиотека Popup API from vim in Neovim
    use 'stevearc/dressing.nvim' -- lib for pretty interface


    -- colorschemes
    use "shaeinst/roshnivim-cs" 
    use 'tanvirtin/monokai.nvim'
    use 'shaunsingh/nord.nvim'
    use 'ellisonleao/gruvbox.nvim'
    use 'NLKNguyen/papercolor-theme'
    -- use 'sainnhe/gruvbox-material'
    -- use "projekt0n/github-nvim-theme"

    -- use "romgrk/barbar.nvim" -- улучшенные табы

    -- поиск 
    use "nvim-telescope/telescope.nvim" -- поиск
    use "nvim-telescope/telescope-file-browser.nvim" -- расширения для поиска файлов
    use "nvim-telescope/telescope-project.nvim" -- расширение для создания проектов

    use "nvim-treesitter/nvim-treesitter" -- подсветка синтаксиса
    use "lukas-reineke/indent-blankline.nvim" -- показывает отступы


    -- LSP
    use "williamboman/mason.nvim" -- package manager for Neovim to install and manage LSP servers, DAP servers, linters, and formatters
    use "williamboman/mason-lspconfig.nvim" -- lsp manager
    use 'mfussenegger/nvim-dap' -- dap manager
    use 'mfussenegger/nvim-lint' -- linter and formatter manager 

    -- use "neovim/nvim-lspconfig" -- enable LSP
    -- use "jose-elias-alvarez/null-ls.nvim"

    -- use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    -- use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
    -- use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

    -- Autocompletion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use 'hrsh7th/cmp-path'

    -- snippets
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'

    use "kyazdani42/nvim-web-devicons" -- иконки 
    use { "kyazdani42/nvim-tree.lua", config = function() require'nvim-tree'.setup {} end, } -- дерево проекта
    use "windwp/nvim-autopairs" -- автоматические ковычки
    use 'mhinz/vim-startify' -- This plugin provides a start screen for Vim and Neovim.
    use 'tpope/vim-fugitive' -- Git integration
    use 'nvim-lualine/lualine.nvim' -- аналог airline
    use { 'numtostr/comment.nvim', config = function() require('Comment').setup() end } -- gcc
        -- `gcc` - Toggles the current line using linewise comment
        -- `gbc` - Toggles the current line using blockwise comment
        -- `[count]gcc` - Toggles the number of line given as a prefix-count using linewise
        -- `[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
        -- `gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
        -- `gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comment

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

