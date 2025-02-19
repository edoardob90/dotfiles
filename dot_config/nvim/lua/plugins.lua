local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

-- Auto-install lazy.nvim if not present
if not vim.uv.fs_stat(lazypath) then
    print('Installing lazy.nvim....')
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
    print('Done.')
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    { 'folke/tokyonight.nvim' },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'tokyonight-night',
                },
            })
        end,
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end,
    },
    {
        'gelguy/wilder.nvim',
        config = function()
            require('config.wilder')
        end,
    },
    {
        "onsails/lspkind.nvim",
        event = { "VimEnter" },
        config = function()
            require("config.lspkind")
        end,
    },
    -- Auto-completion engine: nvim-cmp
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "lspkind.nvim",              -- icons for nvim-cmp
            "hrsh7th/cmp-nvim-lsp",      -- lsp auto-completion
            "hrsh7th/cmp-buffer",        -- buffer auto-completion
            "hrsh7th/cmp-path",          -- path auto-completion
            "hrsh7th/cmp-cmdline",       -- cmdline auto-completion
            {
                'windwp/nvim-autopairs', -- auto-pairs
                event = 'InsertEnter',
                config = true
            },
        },
        config = function()
            require("config.nvim-cmp")
        end,
    },
    -- Snippets engine: LuaSnip (required by nvim-cmp)
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
    },
    {
        'hat0uma/csvview.nvim',
        config = function()
            require('config.csvview')
        end,
    },
    {
        "kylechui/nvim-surround",
        version = "v2.3.0",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end,
    },
    {
        "vladdoster/remember.nvim",
        version = "v1.4.1",
        config = true,
    },
    {
      "supermaven-inc/supermaven-nvim",
      event = { "InsertEnter" },
      config = function()
        require("supermaven-nvim").setup({
            keymaps = {
                accept_suggestion = "<Tab>",
                clear_suggestion = "<C-]>",
                accept_word = "<C-j>",
            },
            ignore_filetypes = { markdown = true, text = true },
        })
      end,
    },
})
