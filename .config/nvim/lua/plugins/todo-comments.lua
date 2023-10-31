return {
	"folke/todo-comments.nvim",
	cmd = { "TodoTrouble", "TodoTelescope" },
	event = "VeryLazy",
	config = true,
	keys = {
		{ "<leader>ft", "<cmd>TodoTelescope<CR>" },
	},
}
