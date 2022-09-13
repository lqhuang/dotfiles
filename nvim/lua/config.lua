local C = {} -- C for Config

function C.nvim_treesitter()
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

    -- But open all folding by default
    vim.api.nvim_create_autocmd({'BufWinEnter'}, {
        group = vim.api.nvim_create_augroup('TS_OPEN_IN_UNFOLDED', {}),
        command = "normal zR",
        pattern = "*"
    })

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
            extended_mode = false, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
            max_file_lines = 10000
        }
        -- extra module: nvim-treesitter/nvim-treesitter-context
        -- context_commentstring = {enable = true, enable_autocmd = false},
        -- matchup = {enable = true}
    })
end

function C.nvim_cmp()

    local cmp = require 'cmp' -- Set up nvim-cmp.
    -- local lspkind = require('lspkind')

    cmp.setup({
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            end
        },
        window = {
            -- completion = cmp.config.window.bordered(),
            -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({select = true}) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
            {name = 'nvim_lsp'}, {name = 'nvim_lsp_signature_help'},
            {name = 'nvim_lua'}, {name = 'buffer'}
        })

        -- -- Set up lspkind.nvim
        -- formatting = {
        --     format = lspkind.cmp_format({
        --         mode = 'symbol',
        --         maxwidth = 50,
        --         preset = 'codicons'
        --     })
        -- }
    })

    -- Set up lspconfig.
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp
                                                                         .protocol
                                                                         .make_client_capabilities())
end

return C
