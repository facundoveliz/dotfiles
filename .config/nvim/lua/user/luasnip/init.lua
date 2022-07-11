local snip_status_ok, ls = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

require("luasnip.loaders.from_vscode").lazy_load()

ls.config.set_config({
	history = true,
	updateevents = "TextChanged, TextChangedI",
	enable_autosnippets = true,
})

local function reload_snips(lang)
	package.loaded["user.luasnip." .. lang] = nil
	return require("user.luasnip." .. lang)
end

ls.add_snippets("all", reload_snips("all"))
ls.add_snippets("lua", reload_snips("lua"))
