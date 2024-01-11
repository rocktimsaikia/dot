local g = vim.g
local opt = vim.opt

opt.ttimeoutlen = -1

vim.opt.tabstop = 2 -- Set the number of spaces that a <Tab> in the file counts for.
vim.opt.shiftwidth = 2 -- Set the number of spaces to use for each step of (auto)indent.
vim.opt.expandtab = false -- Use tabs, not spaces.
vim.opt.smarttab = true -- Insert tabs on the start of a line according to shiftwidth.

-- General settings
opt.number = true
opt.relativenumber = true

opt.scrolloff = 8
opt.termguicolors = true

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.swapfile = false

-- Cursor line
opt.cursorline = true

--  Makes life easier
opt.iskeyword:append("-")

-- Open vsplit to right
opt.splitright = true
opt.splitbelow = true

opt.hidden = true

g.git_messenger_floating_win_opts = { border = "rounded" }
g.git_messenger_popup_content_margins = false

-- opt.list = true
-- opt.listchars:append("eol:↴")
-- opt.listchars:append("space:⋅")

-- opt.spell = true
-- opt.spelllang = "en_us"

g.copilot_filetypes = { markdown = true }

-- Fix spell error by <C-x-s>
opt.spell = true
opt.spelllang = "en"

g.doge_doc_standard_python = "numpy"
g.doge_enable_mappings = 0
g.doge_buffer_mappings = 0
