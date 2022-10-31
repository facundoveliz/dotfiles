local U = {}

function U.fmt_on_save(client)
	if client.server_capabilities.documentFormattingProvider then
		vim.cmd([[
            augroup FORMATTING
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
        ]])
	end
end

function U.capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	return require("cmp_nvim_lsp").default_capabilities(capabilities)
end

-- disable formatting for servers. handles by null-ls
function U.disable_formatting(client)
	-- client.resolved_capabilities.document_formatting = false
	client.server_capabilities.documentFormattingProvider = false
	-- client.resolved_capabilities.document_range_formatting = false
end

return U
