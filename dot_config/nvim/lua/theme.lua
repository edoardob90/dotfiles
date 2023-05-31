-- color scheme
require("catppuccin").setup({
    flavour = "mocha",
    backgroung = {
        light = "latte",
        dark = "mocha",
    }
})

vim.cmd.colorscheme "catppuccin-mocha"

-- status line: lualine
require("lualine").setup({
    options = {
        theme = "catppuccin"
    }
})
