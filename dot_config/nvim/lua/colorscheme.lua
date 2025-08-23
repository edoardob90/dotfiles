-- colorscheme.lua
-- local colorscheme = 'tokyonight-night' -- set colorscheme
local colorscheme = 'flexoki'

-- Lua protected call to prevent errors if the colorscheme is not found
local is_ok = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not is_ok then
    vim.notify('Error: colorscheme ' .. colorscheme .. ' not found.')
    return
end
