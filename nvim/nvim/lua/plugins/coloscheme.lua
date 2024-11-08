return {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
        require("kanagawa").setup({
            transparent = true,
            theme = "dragon"
        })
        vim.cmd([[colorscheme kanagawa]])
    end,
}
