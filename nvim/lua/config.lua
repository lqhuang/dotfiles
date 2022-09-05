function config.nvim_treesitter()
    -- Users of packer.nvim have reported that when using treesitter for folds,
    -- they sometimes receive an error "No folds found", or that treesitter highlighting does not apply.
    -- A workaround for this is to set the folding options in an autocmd:
    ---WORKAROUND
    vim.api.nvim_create_autocmd({
        'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'BufWinEnter'
    }, {
        group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
        callback = function()
            vim.opt.foldmethod = 'expr'
            vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
        end
    })
    ---ENDWORKAROUND

    require("nvim-treesitter.configs").setup({
        -- A list of parser names, or "all"
        ensure_installed = {
            "bash", "c", "lua", "rust", "python", "rst", "make", "markdown"
        },
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
        -- Automatically install missing parsers when entering buffer
        auto_install = true,
        -- Consistent syntax highlighting.
        highlight = {
            enable = true,
            disable = {},
            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false
        },
        -- Indentation based on treesitter for the = operator. NOTE: This is an experimental feature.
        indent = {enable = true},
        -- extra module: nvim-ts-rainbow
        rainbow = {
            enable = true,
            extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
            max_file_lines = 1000 -- Do not enable for files with more than 1000 lines, int
        }
        -- extra module: nvim-treesitter/nvim-treesitter-context
        -- context_commentstring = {enable = true, enable_autocmd = false},
        -- matchup = {enable = true}
    })
end
