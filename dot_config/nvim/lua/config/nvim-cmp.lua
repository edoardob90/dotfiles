local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require("cmp")
local autopairs = require("nvim-autopairs.completion.cmp")
local lspkind = require("lspkind")

-- To insert `(` after select function or method item
cmp.event:on("confirm_done", autopairs.on_confirm_done())

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = cmp.mapping.preset.insert({
        -- Use <C-b/f> to scroll the docs
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        
        -- Use <C-k/j> to switch in items
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),

        -- Use <CR>(Enter) to confirm selection
        -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                if luasnip.expandable() then
                    luasnip.expand()
                else
                    cmp.confirm({
                        select = true,
                    })
                end
            else 
                fallback()
            end
        end),

        -- A super tab
        -- source: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }), -- i - insert mode; s - select mode

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),

    -- Let's configure the item's appearance
    -- source: https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
    formatting = {
        -- Set order from left to right
        -- kind: single letter indicating the type of completion
        -- abbr: abbreviation of "word"; when not empty it is used in the menu instead of "word"
        -- menu: extra text for the popup menu, displayed after "word" or "abbr"
        fields = { 'abbr', 'menu' },

        -- customize the appearance of the completion menu
        format = lspkind.cmp_format({
            mode = 'symbol',          -- show only symbol annotations
            maxwidth = 50,            -- max width of the annotations
            ellipsis_char = '...',    -- show a symbol when the annotation is truncated
            show_labelDetails = true, -- show the label show_labelDetails
            -- The function below will be called before any actual modifications from lspkind
            before = function(entry, vim_item)
                vim_item.menu = ({
                    nvim_lsp = '[LSP]',
                    luasnip = '[LuaSnip]',
                    buffer = '[Buffer]',
                    path = '[Path]',
                    supermaven = '[SuperMaven]',
                })[entry.source.name]
                return vim_item
            end
        })
    },

    -- Set source precedence
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },   -- For nvim-lsp
        { name = 'luasnip' },    -- For luasnip user
        { name = 'buffer' },     -- For buffer word completion
        { name = 'path' },       -- For path completion
        { name = 'supermaven' }, -- Supermaven
    })
})
