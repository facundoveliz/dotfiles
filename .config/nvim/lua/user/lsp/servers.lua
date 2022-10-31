-- NOTE: config shameless stealed from https://github.com/numToStr/dotfiles
local lsp = require("lspconfig")
local U = require("user.lsp.utils")

local capabilities = U.capabilities()
local flags = {
	allow_incremental_sync = true,
	debounce_text_changes = 200,
}

local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

local border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = true,
	signs = {
		active = signs,
	},
	update_in_insert = false,
	underline = false,
	severity_sort = true,
	float = {
		source = "always",
		border = border,
	},
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "ff", "<cmd>lua vim.lsp.buf.format { async = true}<CR>", opts)
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', opts)
keymap("n", "dn", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
keymap("n", "dp", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
keymap("n", "dl", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

local servers = { "gopls", "pyright", "tsserver", "jsonls", "yamlls", "cssls", "tailwindcss" }
for _, k in ipairs(servers) do
	lsp[k].setup({
		flags = flags,
		capabilities = capabilities,
		on_attach = function(client)
			U.disable_formatting(client)
		end,
	})
end

lsp.sumneko_lua.setup({
	flags = flags,
	capabilities = capabilities,
	on_attach = function(client)
		U.disable_formatting(client)
	end,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			telemetry = {
				enable = false,
			},
		},
	},
})
