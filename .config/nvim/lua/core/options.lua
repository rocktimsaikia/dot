local g = vim.g
local opt = vim.opt

opt.ttimeoutlen = -1

-- disable netrw at the very start of your init.lua (strongly advised)
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- General settings
opt.number = true
opt.relativenumber = true
opt.shiftwidth = 2
opt.scrolloff = 8
opt.termguicolors = true
-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.swapfile = false

-- Cursor line
opt.cursorline = true

--  Makes life easier
-- opt.clipboard:append('unnamedplus')
opt.iskeyword:append("-")

-- Open vsplit to right
opt.splitright = true
opt.splitbelow = true

-- Netrw settings
-- Hide the dotfiles by default
-- g.netrw_list_hide = '\\(^\\|\\s\\s\\)\\zs\\.\\S\\+'

opt.hidden = true

g.git_messenger_floating_win_opts = { border = "rounded" }
g.git_messenger_popup_content_margins = false

opt.list = true
-- opt.listchars:append("eol:↴")
-- opt.listchars:append("space:⋅")

opt.errorfile = os.getenv("HOME") .. "/nvim-errors.log" .. ">>"
