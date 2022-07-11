local U = {}

-- common format-on-save for lsp servers that implements formatting
-- @param client table
function U.fmt_on_save(client)
	if client.server_capabilities.documentFormattingProvider then
		vim.cmd([[
            augroup FORMATTING
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.format { async = true}
            augroup END
        ]])
	end
end

function U.capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	return require("cmp_nvim_lsp").update_capabilities(capabilities)
end

-- disable formatting for servers. handles by null-ls
-- @param client table
-- @see https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/avoiding-lsp-formatting-conflicts
function U.disable_formatting(client)
	-- client.resolved_capabilities.document_formatting = false
	client.server_capabilities.documentFormattingProvider = false
	-- client.resolved_capabilities.document_range_formatting = false
end

-- make luajit runtime files discoverable to the server
function U.get_luajit_path()
	local luajit_path = vim.split(package.path, ";")
	table.insert(luajit_path, "lua/?.lua")
	table.insert(luajit_path, "lua/?/init.lua")
	return luajit_path
end

-- make neovim runtime files discoverable to the server
function U.get_nvim_rtp_path()
	return { os.getenv("VIMRUNTIME") }
end

return U
