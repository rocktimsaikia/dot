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
map("n", "<C-m>", ":NvimTreeFocus<CR>")
map("n", "<C-c>", ":NvimTreeCollapse<CR>")

-- gitsigns

-- telescope
map("n", "<leader>h", ":Telescope help_tags<CR>")
map("n", "<leader>ff", ':lua require("telescope.builtin").find_files({ hidden=true })<CR>')
map("n", "<leader>fg", ':lua require("telescope.builtin").live_grep()<CR>')
map("n", "<leader>fgg", ':lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>')
map("n", "<leader>fb", ':lua require("telescope.builtin").buffers()<CR>')
map("n", "<leader>rr", ":Telescope lsp_references<CR>")
map("n", "<leader>gd", ":Telescope lsp_definations<CR>")
map("n", "<leader>tt", ":Telescope lsp_type_definitions<CR>")
-- telescope extensions
map("n", "<leader>p", ":Telescope workspaces<CR>")
map("n", "<leader>gs", ':lua require("telescope.builtin").git_status()<CR>')

-- harpoon
map("n", "<leader>a", ':lua require("harpoon.mark").add_file()<CR>')
map("n", "<leader>]", ':lua require("harpoon.ui").nav_next()<CR>')
map("n", "<leader>[", ':lua require("harpoon.ui").nav_prev()<CR>')

-- neogeon | create functio annotations
map("n", "<leader>nf", ":lua require('neogen').generate()<CR>")

map("n", "S", ":SplitjoinSplit<CR>")

-- Plannery mapping for running tests
map("n", "<leader>t", "<Plug>PlenaryTestFile")
