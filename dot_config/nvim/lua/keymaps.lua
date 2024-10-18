-- keymaps.lua
vim.g.mapleader = ' '      -- set leader to space
vim.g.maplocalleader = ',' -- set local leader to comma

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-----------------
-- Normal mode --
-----------------

-- Reload files that have changed outside the editor
keymap('n', '<leader>e', ':edit<CR>', opts)
-- Toggle highlights from previous search
keymap('n', '<leader><Space>', ':nohlsearch<CR>', opts)
-- Count occurrences of the latest searched pattern
keymap('n', '<leader>c', ':%s///gn<CR>', opts)
-- Quickly exit
keymap('n', '<leader>q', ':q<CR>', opts)
-- Save everything and exit
keymap('n', '<leader>Q', ':wqa<CR>', opts)
-- Force write
keymap('n', '<leader>w', ':w!<CR>', opts)
-- Cycle between tabs
keymap('n', '<leader><Right>', ':tabnext<CR>', opts)
keymap('n', '<leader><Left>', ':tabprev<CR>', opts)
-- Confirm quit
keymap('n', '<C-q>', ':confirm qall<CR>', opts)
-- Center search when navigating
keymap('n', 'n', 'nzz', opts)
keymap('n', 'N', 'Nzz', opts)
-- Yank from cursor till end of line
keymap('n', 'Y', 'y$', opts)
-- Window management
keymap('n', '<leader>s', ':split<CR>', opts)              -- split window
keymap('n', '<leader>n', ':new<CR>', opts)                -- new window
keymap('n', '<leader>v', ':vsplit<CR>', opts)             -- vertical split
keymap('n', '<leader>t', ':$tabnew<CR>', opts)            -- new tab
-- Window navigation
keymap('n', '<C-h>', '<C-w>h', opts)                      -- ctrl + h: move to the window on the left
keymap('n', '<C-j>', '<C-w>j', opts)                      -- ctrl + j: move to the window below
keymap('n', '<C-k>', '<C-w>k', opts)                      -- ctrl + k: move to the window above
keymap('n', '<C-l>', '<C-w>l', opts)                      -- ctrl + l: move to the window on the right
-- Window resizing
keymap('n', '<S-Up>', ':resize -2<CR>', opts)             -- alt + up: decrease height
keymap('n', '<S-Down>', ':resize +2<CR>', opts)           -- alt + down: increase height
keymap('n', '<S-Left>', ':vertical resize -2<CR>', opts)  -- alt + left: decrease width
keymap('n', '<S-Right>', ':vertical resize +2<CR>', opts) -- alt + right: increase width

-----------------
-- Insert mode --
-----------------

-- Use jk to exit insert mode
keymap('i', 'jk', '<ESC>', opts)


-----------------
-- Visual mode --
-----------------

-- Visual mode search for the current selection
-- keymap('v', '*', [[:<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>]], opts)
-- keymap('v', '#', [[:<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>]], opts)
keymap('v', '<', '<gv', opts) -- start visual mode and reselect the previous selection
keymap('v', '>', '>gv', opts)
