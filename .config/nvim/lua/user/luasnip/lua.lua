local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local l = require("luasnip.extras").lambda
local i = ls.insert_node
local d = ls.dynamic_node
local t = ls.text_node
local s = ls.snippet_node
local snippet = ls.snippet

return {
	ls.parser.parse_snippet("tits", "if ${1:cond} then\n\t$0\nend"),
	snippet(
		"preq",
		fmt('local {1}_ok, {1} = pcall(require, "{}")\nif not {1}_ok then return end', {
			l(l._1:match("[^.]*$"):gsub("[^%a]+", "_"), 1),
			i(1, "module"),
		})
	),
}
