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

-- disable formatting for servers. handles by null-ls
function U.disable_formatting(client)
	client.server_capabilities.documentFormattingProvider = false
end

return U
