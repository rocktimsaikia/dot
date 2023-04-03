require("noice").setup({
    presets = {
        bottom_search = true,
    },
    views = {
        cmdline_popup = {
            border = {
                style = "none",
                padding = { 2, 3 },
            },
            filter_options = {},
            win_options = {
                winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
            },
        },
    },
    routes = {
        {
            view = "notify",
            filter = { event = "msg_showmode" },
        },
    },
})
