vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init-packer.lua source <afile> | PackerCompile
    autocmd BufWritePost init-packer.lua source <afile> | PackerInstall
  augroup end
]])

-- Pluggins
return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- tpope's stuff
    use("tpope/vim-surround")
    use("tpope/vim-fugitive")

    -- Commenting stuff
    use("tpope/vim-commentary") -- Commenting made easy
    use({
        "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
            require("ts_context_commentstring").setup({})
            vim.g.skip_ts_context_commentstring_module = true
        end,
    })

    use("tpope/vim-unimpaired") -- Using for only :cnext and :cprevious

    -- Press <C-G>c in insert mode to toggle a temporary Caps Lock or
    -- Press gC in normal mode to toggle a permanent Caps Lock
    use("tpope/vim-capslock")
    use("tpope/vim-obsession")

    use("nvim-lua/plenary.nvim")
    use("wellle/targets.vim") -- provides additional text objects
    use("nvim-lualine/lualine.nvim")
    -- use("jiangmiao/auto-pairs")

    -- Git stuff
    use("f-person/git-blame.nvim")
    use({
        "sindrets/diffview.nvim",
        requires = "nvim-lua/plenary.nvim",
    })

    -- A high-performance color highlighter
    use({
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    })

    use({
        "rebelot/kanagawa.nvim",
        config = function()
            vim.cmd("colorscheme kanagawa")
        end,
    })

    -- Color themes
    -- use({
    --     "nyngwang/nvimgelion",
    --     config = function()
    --         vim.cmd("colorscheme nvimgelion")
    --         -- do whatever you want for further customization~
    --     end,
    -- })

    -- use({
    --     "sainnhe/gruvbox-material",
    --     config = function()
    --         vim.g.gruvbox_material_background = "hard"
    --         vim.g.gruvbox_material_better_performance = 1
    --         vim.cmd("colorscheme gruvbox-material")
    --     end,
    -- })

    -- use({
    --     "folke/tokyonight.nvim",
    --     config = function()
    --         vim.cmd("colorscheme tokyonight-night")
    --         -- vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])
    --         -- vim.cmd([[hi NvimTreeNormalNC guibg=NONE ctermbg=NONE]])
    --         vim.cmd([[hi LineNr guifg='#8389a3' guibg='#1c1b1b']]) -- Line number color
    --     end,

    -- use({
    --    "Everblush/nvim",
    --    as = "everblush",
    --    config = function()
    --        vim.cmd("colorscheme everblush")
    --    end,
    -- })

    -- })

    use({
        "nvim-telescope/telescope.nvim",
        config = function()
            require("telescope").setup({
                defaults = {
                    preview = {
                        treesitter = false,
                    },
                },
            })
        end,
    })

    -- LSP and autocompletion stuff
    use("neovim/nvim-lspconfig") -- configurations for Nvim LSP
    use("hrsh7th/nvim-cmp") -- Autocompletion plugin
    use("hrsh7th/cmp-nvim-lsp") -- neovim builtin LSP client completion source for nvim-cmp
    use("hrsh7th/cmp-buffer") -- nvim-cmp source for buffer words
    use("L3MON4D3/LuaSnip") -- Snippet engine for neovim
    use("saadparwaiz1/cmp_luasnip") -- luasnip completion source for nvim-cmp

    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
    })

    -- Auto close and auto rename html tag
    use({
        "windwp/nvim-ts-autotag",
        require("nvim-ts-autotag").setup(),
    })

    -- Peek lines as you type the line number
    use({
        "nacro90/numb.nvim",
        config = function()
            require("numb").setup()
        end,
    })

    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    })

    use({
        "karb94/neoscroll.nvim",
        config = function()
            require("neoscroll").setup()
        end,
    })

    -- Extends the default increment/decrement operators
    use({
        "nat-418/boole.nvim",
        config = function()
            require("boole").setup({
                mappings = {
                    increment = "<C-a>",
                    decrement = "<C-x>",
                },
            })
        end,
    })

    -- Underline the current word and its occurrences
    use("itchyny/vim-cursorword")

    -- Fancy cursor
    use({
        "gen740/SmoothCursor.nvim",
        config = function()
            require("smoothcursor").setup({})
        end,
    })

    use({
        "johmsalas/text-case.nvim",
        config = function()
            require("textcase").setup({})
        end,
    })

    use({
        "dnlhc/glance.nvim",
        config = function()
            require("glance").setup({
                -- your configuration
            })
        end,
    })

    -- Formatter plugin
    use({
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                format_on_save = {
                    timeout_ms = 500,
                    lsp_fallback = true,
                },
                formatters_by_ft = {
                    lua = { "stylua" },
                    python = { "isort", "black" },
                    javascript = { "biome" },
                    typescript = { "biome" },
                    javascriptreact = { "biome" },
                    typescriptreact = { "biome" },
                    markdown = { "prettierd" },
                    json = { "biome", "prettierd", stop_after_first = true },
                    yaml = { "biome" },
                    css = { "biome" },
                    sh = { "shellharden" },
                    go = { "gofmt", "golines" },
                    htmldjango = nil,
                    rust = { "rustfmt" },
                    gleam = { "gleam" },
                },
            })
        end,
    })

    --- Linter plugin
    use({
        "mfussenegger/nvim-lint",
        config = function()
            require("lint").linters_by_ft = {
                javascript = { "biomejs" },
                typescript = { "biomejs" },
                javascriptreact = { "biomejs" },
                typescriptreact = { "biomejs" },
            }
        end,
    })

    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            local hooks = require("ibl.hooks")
            -- create the highlight groups in the highlight setup hook,
            -- so they are reset every time the colorscheme changes
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "Lowcontrast", { fg = "#232a2d" })
            end)

            require("ibl").setup({
                indent = {
                    char = "▏",
                    highlight = { "Lowcontrast" },
                },
                scope = {
                    enabled = true,
                    highlight = {
                        "@function",
                    },
                },
            })
        end,
    })

    -- Documentation generator
    use({
        "kkoomen/vim-doge",
        run = ":call doge#install()",
    })

    use({ "jasonccox/vim-wayland-clipboard" })

    -- Toggle between HEX and RGB color formats inline
    use({
        "rocktimsaikia/color-switch.nvim",
        config = function()
            require("color-switch")
        end,
    })

    -- Co-pilot alternative
    -- use("Exafunction/codeium.vim")

    -- Fast vim motions and jumping
    use("justinmk/vim-sneak")

    use({
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    })

    -- Fast escape with jk
    use({ "jdhao/better-escape.vim", event = "InsertEnter" })

    -- Bookmark manager
    use({
        "otavioschwanck/arrow.nvim",
        config = function()
            require("arrow").setup({
                show_icons = false,
                leader_key = ";", -- Recommended to be a single key
                buffer_leader_key = "m", -- Per Buffer Mappings
            })
        end,
    })

    use({ "LunarVim/bigfile.nvim" })
end)
