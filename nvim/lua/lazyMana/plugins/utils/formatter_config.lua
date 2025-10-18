return {
    {
        "stevearc/conform.nvim",
        config = function()
            local conform = require("conform")
            conform.setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    python = { "black" },
                    nix = { "alejandra" },
                    javascript = { "biome" },
                    typescript = { "biome" },
                    javascriptreact = { "biome" },
                    typescriptreact = { "biome" },
                },
                format_on_save = {
                    -- These options will be passed to conform.format()
                    timeout_ms = 500,
                    lsp_format = "fallback",
                },
            })
            vim.keymap.set("n", "<Space>ff", function()
                require("conform").format({ async = true, lsp_fallback = true })
            end, { noremap = true, silent = true, desc = "Format file with Conform" })
        end,
    },
}
