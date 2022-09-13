local config_mod = require('config')

local M = {}

M.is_bootstrap = false

local function boot_packer()
    local fn = vim.fn
    local install_path = fn.stdpath('data') ..
                             '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        M.is_bootstrap = true
        packer_bootstrap = fn.system({
            'git', 'clone', '--depth', '1',
            'https://github.com/wbthomason/packer.nvim', install_path
        })
        vim.api.nvim_command "packadd packer.nvim"
    end
end

local function recompiled_after_updated()
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
        group = vim.api
            .nvim_create_augroup('packer_user_config', {clear = true}),
        command = 'source <afile> | PackerCompile',
        pattern = vim.fn.expand 'lua/?.lua'
    })
end

local startup_fn = function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- syntax
    use {
        'nvim-treesitter/nvim-treesitter',
        opt = true,
        run = function()
            require('nvim-treesitter.install').update({with_sync = true})
        end,
        config = config_mod.nvim_treesitter,
        event = 'BufReadPost'
    }
    use {"p00f/nvim-ts-rainbow", opt = true, after = "nvim-treesitter"}

    -- LSP
    use 'neovim/nvim-lspconfig'

    -- Autocompletion
    use {
        'hrsh7th/nvim-cmp',
        config = config_mod.nvim_cmp,
        requires = {
            {'hrsh7th/cmp-nvim-lua'}, {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lsp-signature-help'}
            -- {"onsails/lspkind.nvim"}
        }
    }
    -- use "L3MON4D3/LuaSnip"
    -- use "saadparwaiz1/cmp_luasnip"

    -- use({
    --     "jose-elias-alvarez/null-ls.nvim",
    --     config = function() require("null-ls").setup() end,
    --     requires = {"nvim-lua/plenary.nvim"}
    -- })

    -- Better comment action
    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }

    -- UI
    use {
        'kyazdani42/nvim-web-devicons',
        config = function()
            require('nvim-web-devicons').setup {default = true}
        end
    }
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
        requires = {
            'kyazdani42/nvim-web-devicons', 'arkav/lualine-lsp-progress'
        }
    }
    use {
        'kyazdani42/nvim-tree.lua',
        config = function()
            require('nvim-tree').setup({
                sort_by = "name" -- "case_sensitive",
                -- view = {adaptive_size = true}
            })
        end,
        requires = {'kyazdani42/nvim-web-devicons'}
    }
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup({
                -- -- LuaFormatter off
                -- signs = {
                --     add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
                --     change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
                --     delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
                --     topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
                --     changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
                -- },
                -- -- LuaFormatter on
                signcolumn = true,
                watch_gitdir = {interval = 5000}
            })
        end
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if M.is_bootstrap then require('packer').sync() end
end

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.

function M.load_plugins()

    boot_packer()
    require('packer').startup(startup_fn)

    if M.is_bootstrap then
        print '=================================='
        print '    Plugins are being installed'
        print '    Wait until Packer completes,'
        print '       then restart nvim'
        print '=================================='
        return
    end

    recompiled_after_updated()
end

return M

