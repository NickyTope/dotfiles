local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt

ls.config.set_config({
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
})

ls.snippets = {
	all = {
		ls.s(
			"us",
			fmt("const [{}, {}] = useState({});\n", {
				ls.insert_node(1),
				ls.function_node(function(args)
					local name = args[1][1]
					local first = string.upper(string.sub(name, 1, 1))
					local rest = string.sub(name, 2, -1)
					return "set" .. first .. rest
				end, { 1 }),
				ls.insert_node(2),
			})
		),
	},
}

require("luasnip.loaders.from_snipmate").lazy_load()

vim.keymap.set({ "i", "s" }, "<c-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })
