local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--- GENERAL MAPPINGS ---

vim.g.mapleader = " "

-- Disable arrow keys
map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")

-- Map Esc to jj
map("i", "jj", "<Esc>")

-- Clear search highlighting with <leader> and c
map("n", "<leader>c", ":nohl<CR>")

-- Move around splits using Ctrl + {h,j,k,l}
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Reload configuration without restart nvim
map("n", "<leader>r", ":so %<CR>")

-- Fast saving with <leader> and s
map("n", "<leader>s", ":w<CR>")

-- Quickfix list
vim.cmd([[
function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction
]])
map("n", "wq", ":call ToggleQuickFix()<CR>")

-- Open buffers
map("n", "<leader>b", ":ls<cr>:b<space>")

-- Undo breakpoints
map("i", ",", ",<C-g>u")
map("i", ".", ".<C-g>u")
map("i", ":", ":<C-g>u")
map("i", ";", ";<C-g>u")

--- PLUGIN KEY MAPPINGS ---

-- nvim-tree
map("n", "<C-,>", ":NvimTreeFindFileToggle<CR>")
map("n", "<C-m>", ":NvimTreeFocus<CR>")

-- gitsigns
map("n", "gbb", ":Gitsigns toggle_current_line_blame<CR>")
map("n", "gdd", ":Gitsigns diffthis<CR>")

-- telescope
map("n", "<leader>ff", ':lua require("telescope.builtin").find_files({ hidden=true })<CR>')
map("n", "<leader>fg", ':lua require("telescope.builtin").live_grep()<CR>')
map("n", "<leader>fgg", ':lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>')
map("n", "<leader>fb", ':lua require("telescope.builtin").buffers()<CR>')
map("n", "<leader>rr", ":Telescope lsp_references<CR>")
map("n", "<leader>tt", ":Telescope lsp_type_definations<CR>")
-- telescope git
map("n", "<leader>gs", ':lua require("telescope.builtin").git_status()<CR>')
map("n", "<leader>gb", ':lua require("telescope.builtin").git_branches()<CR>')
map("n", "<leader>gc", ':lua require("telescope.builtin").git_commits()<CR>')
map("n", "<leader>gss", ':lua require("telescope.builtin").git_stash()<CR>')
-- telescope extensions
map("n", "<leader>gi", ":Telescope gh issues<CR>")
map("n", "<leader>gp", ":Telescope gh pull_request author=rocktimsaikia<CR>")
map("n", "<leader>gr", ":Telescope gh run limit=2<CR>")

-- harpoon
map("n", "am", ':lua require("harpoon.mark").add_file()<CR>')
map("n", "aq", ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
map("n", "a]", ':lua require("harpoon.ui").nav_next()<CR>')
map("n", "a[", ':lua require("harpoon.ui").nav_prev()<CR>')

-- fugitive
map("n", "gaa", ":Git add .")

-- neogeon | create functio annotations
map("n", "<leader>nf", ":lua require('neogen').generate()<CR>")
