return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			capabilities.workspace = {
				didChangeWatchedFiles = {
					dynamicRegistration = true,
				},
			}

			local on_attach = function(client, bufnr)
				local opts = { noremap = true, silent = true }
				local keymap = vim.api.nvim_buf_set_keymap

				keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
				keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
				keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
				keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
				keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
				keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
				keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
				keymap(bufnr, "n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
				keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
				keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
				keymap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
				keymap(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)

				local active_clients = vim.lsp.get_active_clients()
				if client.name == "denols" then
					for _, client_ in pairs(active_clients) do
						if client_.name == "tsserver" then
							client_.stop()
						end
					end
				elseif client.name == "tsserver" then
					for _, client_ in pairs(active_clients) do
						if client_.name == "denols" then
							client.stop()
						end
					end
				end
			end

			vim.diagnostic.config({
				update_in_insert = true,
				underline = false,
        virtual_text = true
			})

			local servers = {
				"lua_ls",
				"ts_ls", -- Changed from "ts_ls" to match correct server name
				"biome",
				"denols",
				"pyright",
			}

			for _, server in pairs(servers) do
				local opts = {
					on_attach = on_attach,
					capabilities = capabilities,
				}

				-- Add server-specific configurations
				if server == "denols" then
					opts = vim.tbl_deep_extend("force", {
						root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
						init_options = {
							lint = true,
							unstable = true,
							suggest = {
								imports = {
									hosts = {
										["https://deno.land"] = true,
									},
								},
							},
						},
					}, opts)
				end

				if server == "tsserver" then
					opts = vim.tbl_deep_extend("force", {
						root_dir = lspconfig.util.root_pattern("package.json"),
						single_file_support = false,
					}, opts)
				end

				local require_ok, settings = pcall(require, "plugins.lspsettings." .. server)
				if require_ok then
					opts = vim.tbl_deep_extend("force", settings, opts)
				end

				lspconfig[server].setup(opts)
			end
		end,
	},
}
