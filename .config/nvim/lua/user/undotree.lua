return {
	"mbbill/undotree",
	keys = {
		{
			"<leader>ut",
			function()
				vim.cmd([[UndotreeToggle]])
			end,
		},
	},
}
