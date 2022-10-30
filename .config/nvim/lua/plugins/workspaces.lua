require("telescope").load_extension("workspaces")
require("workspaces").setup({
	path = vim.fn.stdpath("config") .. "/workspaces",
	hooks = {
		open_pre = {},
		open = { "NvimTreeOpen" },
	},
})
