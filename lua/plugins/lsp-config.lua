return {
	{
		"mason-org/mason.nvim",
		opts = {},
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({ ensure_installed = { "vimls", "lua_ls", "ts_ls", "jdtls" } })
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("vimls", { capabilities = capabilities })
			vim.lsp.enable("vimls")

			vim.lsp.config("lua_ls", {
				-- ... (keep cmd, filetypes, capabilities)
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT", -- Neovim uses LuaJIT
						},
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							-- Only load Neovim runtime files, not every single folder in your path
							library = {
								vim.env.VIMRUNTIME,
								-- Optional: Include your local config for completion of your own functions
								-- vim.fn.stdpath("config") .. "/lua"
							},
							checkThirdParty = false,
						},
						telemetry = { enable = false },
					},
				},
			})
			vim.lsp.enable("lua_ls")

			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
				root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
			})
			vim.lsp.enable("ts_ls")

			vim.lsp.config("jdtls", { capabilities = capabilities })
			vim.lsp.enable("jdtls")

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
