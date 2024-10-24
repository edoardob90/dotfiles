local csv = require('csvview')

csv.setup({
    view = {
        display_mode = "border",
    }
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = {"*.csv"},
    callback = function()
        csv.enable()
    end
})
