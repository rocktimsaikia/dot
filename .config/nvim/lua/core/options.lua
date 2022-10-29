local g = vim.g
local opt = vim.opt

-- disable netrw at the very start of your init.lua (strongly advised)
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- General settings
opt.number = true
opt.relativenumber = true
opt.shiftwidth = 2
opt.scrolloff = 8
opt.termguicolors = true
opt.background = "dark"

-- Search settings
opt.ignorecase = true
opt.smartcase = true

-- Cursor line
opt.cursorline = true

--  Makes life easier
-- opt.clipboard:append('unnamedplus')
opt.iskeyword:append("-")

-- Open vsplit to right
opt.splitright = true

-- Netrw settings
-- Hide the dotfiles by default
-- g.netrw_list_hide = '\\(^\\|\\s\\s\\)\\zs\\.\\S\\+'

opt.hidden = true
