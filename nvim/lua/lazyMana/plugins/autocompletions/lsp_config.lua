return {
	{
		-- DO NOT USE MASON FOR NIXOS
		-- ONLY HERE AS A DEPENDENCY FOR mason-lspconfig
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			-- NIXOS DOES NOT WORK WITH MASON
			-- local mason_lsp_config = require('mason-lspconfig')
			-- mason_lsp_config.setup({
			--     ensure_installed = { "jdtls", "pylsp", "lua_ls", "vimls", 'html', 'biome' },
			-- })

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			-- WARNING: SET UP LANGUAGE SERVER HERE

			vim.lsp.enable("biome")
			vim.lsp.enable("lua_ls")

			vim.lsp.enable("pylsp")
			vim.lsp.enable("pyright")

			vim.lsp.enable("vimls")
			vim.lsp.enable("html")
			vim.lsp.enable("nil_ls")
            vim.lsp.enable("tsserver")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action)
		end,
	},
}
