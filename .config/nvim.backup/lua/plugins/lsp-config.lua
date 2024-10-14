return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local config = require("plugins.configs.lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.tsserver.setup({
				on_attach = config.on_attach,
				capabilities = capabilities,
        init_options = {
          preferences = {
            disableSuggestions = true,
          }
        }
			})
			lspconfig.lua_ls.setup({
				capabilites = capabilities,
			})
			lspconfig.gopls.setup({
				capabilites = capabilities,
			})
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "<leader>fr", vim.lsp.buf.references, {})
			vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})

			vim.keymap.set({ "n" }, "<leader>gl", vim.diagnostic.open_float, {})
		end,
	},
}
