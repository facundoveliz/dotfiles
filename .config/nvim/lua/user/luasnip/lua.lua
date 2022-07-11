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
	snippet("doc", {
		t("--- "),
		i(1, "Function description."),
		d(2, function(_, snip)
			local parms, ret = next_fun_parms(tonumber(snip.env.TM_LINE_NUMBER))
			assert(parms, "Did not find a function!")

			local parm_nodes = {}
			for j, parm in ipairs(parms) do
				table.insert(parm_nodes, t({ "", "-- @param " .. parm .. " " }))
				table.insert(parm_nodes, i(j, "Parameter description."))
			end

			if ret then
				table.insert(parm_nodes, t({ "", "-- @return " }))
				table.insert(parm_nodes, i(#parms + 1, "Return description."))
			end

			return s(1, parm_nodes)
		end),
	}),
}
