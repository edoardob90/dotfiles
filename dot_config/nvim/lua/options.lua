-- options.lua
local set = vim.opt

-- Hint: use `:h <option>` to figure out the meaning if needed
set.clipboard = 'unnamedplus'                       -- use system clipboard
set.completeopt = { 'menu', 'menuone', 'noselect' } -- completion options
set.mouse = 'a'                                     -- allow the mouse to be used in Nvim
set.encoding = 'utf-8'                              -- set the encoding of the file

-- Tab
set.tabstop = 4      -- number of visual spaces per TAB
set.softtabstop = 4  -- number of spacesin tab when editing
set.shiftwidth = 4   -- insert 4 spaces on a tab
set.expandtab = true -- tabs are spaces, mainly because of python
-- set.autointdent = true -- automatically set the indent of a new line (unsupported?)

-- UI config
set.number = true         -- show absolute number
set.relativenumber = true -- add numbers to each line on the left side
set.cursorline = true     -- highlight cursor line underneath the cursor horizontally
set.splitbelow = true     -- open new vertical split bottom
set.splitright = true     -- open new horizontal splits right
set.showmode = false      -- we are pro, we don't need the "-- INSERT --" mode hint
set.showmatch = true      -- show matching brackets when the cursor is over one
set.lazyredraw = true     -- do not redraw while executing macros
set.termguicolors = true  -- enable 24-bit RGB color in the terminal

-- Searching
set.incsearch = true  -- search as characters are entered
set.hlsearch = true   -- highlight matches (default: false)
set.ignorecase = true -- ignore case in searches by default
set.smartcase = true  -- but make it case sensitive if an uppercase is entered

-- Python interpreter
-- set python3_host_prog to the python3 binary in the virtualenv `nvim`
vim.g.python3_host_prog = vim.fs.normalize('~/.pyenv/versions/nvim/bin/python')
