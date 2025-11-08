-- lsp.lua
-- LSP configuration using vim.lsp.config() API

-- Configure beancount-language-server
vim.lsp.config('beancount', {
    cmd = { 'beancount-language-server', '--stdio' },
    filetypes = { 'beancount' },
    root_dir = vim.fs.dirname(vim.fs.find({ 'main.bean', '.git' }, { upward = true })[1]),
    init_options = {
        journal_file = vim.fs.normalize('~/git/beancount/main.bean'),
        formatting = {
            prefix_width = 30,
            currency_column = 60,
            number_currency_spacing = 1,
        },
    },
})

-- Auto-enable beancount LSP for beancount filetypes
vim.lsp.enable('beancount')
