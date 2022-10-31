local snip_status_ok, ls = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

ls.config.set_config({
	history = true,
	updateevents = "TextChanged, TextChangedI",
	enable_autosnippets = true,
})

require("luasnip.loaders.from_vscode").lazy_load()

vim.keymap.set({ "i", "s" }, "<c-j>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-k>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

vim.keymap.set("i", "<c-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)

local function reload_snips(lang)
	package.loaded["user.luasnip." .. lang] = nil
	return require("user.luasnip." .. lang)
end

ls.add_snippets("all", reload_snips("all"))
ls.add_snippets("lua", reload_snips("lua"))
