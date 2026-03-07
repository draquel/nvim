return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim", "nvim-tree/nvim-web-devicons" },
	lazy = false,
	config = function()
		
    require("neo-tree").setup({
			event_handlers = {
				{
					event = "file_opened",
					handler = function(file_path)
						-- Forces Neo-tree to close specifically after it opens a file
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
			},
		})

    vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left <CR>")
	end,
}
