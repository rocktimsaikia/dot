local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--- GENERAL MAPPINGS ---
vim.g.mapleader = " "

-- Quick bulk rename
map("n", "<leader>n", "*:%s//")

-- Select remaps
map("n", "vv", "V")
map("n", "V", "v$")

-- Clipboard
map("v", "<leader>y", '"+y')
map("n", "<leader>wy", 'viw"+y')

-- Disable arrow keys
map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")

-- Map Esc to jj
map("i", "jj", "<Esc>")

-- Clear search highlighting with <leader> and c
map("n", "<leader>c", ":nohl<CR>")

-- Split remapping
map("n", ",s", ":vsplit<CR>")
map("n", ",d", ":split<CR>")

-- Move around splits using Ctrl + {h,j,k,l}
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Reload configuration without restart nvim
map("n", "<leader>r", ":so %<CR>")

-- Fast saving with <leader> and s
map("n", "<leader>s", ":w<CR>")
map("n", "<leader>qa", ":qa<CR>")

-- -- Quickfix list
-- vim.cmd([[
-- function! ToggleQuickFix()
--     if empty(filter(getwininfo(), 'v:val.quickfix'))
--         copen
--     else
--         cclose
--     endif
-- endfunction
-- ]])
-- map("n", "wq", ":call ToggleQuickFix()<CR>")

-- Undo breakpoints
map("i", ",", ",<C-g>u")
map("i", ".", ".<C-g>u")
map("i", ":", ":<C-g>u")
map("i", ";", ";<C-g>u")

--- PLUGIN KEY MAPPINGS ---

-- nvim-tree
map("n", "<C-,>", ":NvimTreeFindFileToggle<CR>")
map("n", "<C-c>", ":NvimTreeCollapse<CR>")

-- gitsigns

-- telescope
map("n", "<leader>h", ":Telescope help_tags<CR>")
map("n", "<leader>ff", ':lua require("telescope.builtin").find_files({ hidden=true })<CR>')
map("n", "<leader>fg", ':lua require("telescope.builtin").live_grep()<CR>')
map("n", "<leader>fb", ':lua require("telescope.builtin").buffers()<CR>')
map("n", "<leader>rr", ":Telescope lsp_references<CR>")
map("n", "<leader>gd", ":Telescope lsp_definations<CR>")
map("n", "<leader>tt", ":Telescope lsp_type_definitions<CR>")
-- telescope extensions
map("n", "<leader>p", ":Telescope workspaces<CR>")
map("n", "<leader>gs", ':lua require("telescope.builtin").git_status()<CR>')

-- neogeon | create functio annotations
map("n", "<leader>nf", ":lua require('neogen').generate()<CR>")

map("n", "<M-s>", ":TSJToggle<CR>")

-- Plannery mapping for running tests
map("n", "<leader>t", "<Plug>PlenaryTestFile")

-- Git commit browser
map("n", "<leader>gb", ":GV<CR>")
map("n", "<leader>gc", ":GV!<CR>")

-- grapple.nvim
map("n", "<leader>aa", ":GrapplePopup tags<CR>")
map("n", "<leader>.", ":GrappleTag<CR>")

-- Git diff browser
local diffview_open = false

function toggle_diffview()
	if not diffview_open then
		vim.cmd("DiffviewOpen")
		diffview_open = true
	else
		vim.cmd("DiffviewClose")
		diffview_open = false
	end
end

map("n", "<leader>gd", ":lua toggle_diffview()<CR>")

map("n", "<leader>b", ":ls<CR>:b<Space>")

map("i", "<leader>]", "<Plug>(copilot-next)")
