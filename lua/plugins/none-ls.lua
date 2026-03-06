return {
	{
		"nvimtools/none-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvimtools/none-ls-extras.nvim",
    },
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {

          --Lua
					null_ls.builtins.formatting.stylua,
          --Javascript
          null_ls.builtins.formatting.prettierd,
          require("none-ls.diagnostics.eslint_d"),
          require("none-ls.code_actions.eslint_d"),
				},
			})

			vim.keymap.set("n", "<leader>gf", function() vim.lsp.buf.format({async = true}) end, {})
		end,
	},
}
