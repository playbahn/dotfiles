return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            theme = "onedark",
        },
        sections = {
            lualine_b = {
                { "branch", icon = "" },
                "diff",
                "diagnostics",
            },
        },
    },
}
