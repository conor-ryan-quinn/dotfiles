return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 20,
			open_mapping = [[<c-\>]],
			hide_numbers = true,
			direction = "float",
			shade_filetypes = {},
			close_on_exit = true,
		})
	end,
}
