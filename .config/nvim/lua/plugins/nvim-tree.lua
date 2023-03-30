-- empty setup using defaults
require("nvim-tree").setup({
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = true,
    },
    filters = {
        dotfiles = false,
    },
    git = {
        ignore = false,
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
})
