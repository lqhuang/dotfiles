local is_bootstrap = false

local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    is_bootstrap = true

    packer_bootstrap = fn.system({
        'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim', install_path
    })
    vim.api.nvim_command "packadd packer.nvim"
end

-- configure Neovim to automatically run `:PackerCompile` whenever `plugins.lua`
-- is updated with an autocommand:
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--   augroup end
-- ]])

-- modern version
vim.api.nvim_create_autocmd({'BufWritePost'}, {
    group = vim.api.nvim_create_augroup('packer_user_config', {clear = true}),
    command = 'source <afile> | PackerCompile',
    pattern = vim.fn.expand '$MYVIMRC' -- try to modify to `plugins.lua` here
})

require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- syntax
    use {
        'nvim-treesitter/nvim-treesitter',
        opt = true,
        run = function()
            require('nvim-treesitter.install').update({with_sync = true})
        end,
        config = "import to here",
        event = 'BufReadPost',
        requires = {
            "p00f/nvim-ts-rainbow",
            opt = true,
            after = "nvim-treesitter"
        }
    }
    -- use {
    --     "p00f/nvim-ts-rainbow",
    --     opt = true,
    --     after = "nvim-treesitter",
    -- }

    -- LSP
    use 'neovim/nvim-lspconfig'

    -- Autocompletion
    use {'hrsh7th/nvim-cmp', requires = {'hrsh7th/cmp-nvim-lsp'}}

    -- use({
    --     "jose-elias-alvarez/null-ls.nvim",
    --     config = function() require("null-ls").setup() end,
    --     requires = {"nvim-lua/plenary.nvim"}
    -- })

    -- Editor

    -- Better comment action
    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }

    -- UI
    use {
        'nvim-lualine/lualine.nvim', -- Fancier statusline
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled = true
                    -- theme = 'onedark',
                    -- component_separators = '|',
                    -- section_separators = ''
                }
            }
        end,
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup({
                signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
                numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
                linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
                word_diff = false -- Toggle with `:Gitsigns toggle_word_diff`
            })
        end
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then require('packer').sync() end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
    print '=================================='
    print '    Plugins are being installed'
    print '    Wait until Packer completes,'
    print '       then restart nvim'
    print '=================================='
    return
end

