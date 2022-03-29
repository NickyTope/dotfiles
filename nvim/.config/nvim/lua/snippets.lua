local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt

ls.config.set_config({
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
})

local same = function(index)
	return ls.function_node(function(args)
		return args[1]
	end, { index })
end

local filename = function()
	return ls.function_node(function(_args, snip)
		local name = snip.snippet.env.TM_FILENAME
		return string.sub(name, 1, string.find(name, ".", 1, true) - 1)
	end)
end

local log = ls.s(
	"log",
	fmt("console.log('{}', {});", {
		ls.insert_node(1),
		same(1),
	})
)

local unwrap = ls.s(
	"uw",
	fmt("const {{ {} }} = {};", {
		ls.insert_node(1, "key"),
		ls.insert_node(2, "object"),
	})
)

local useState = ls.s(
	"us",
	fmt("const [{}, {}] = useState({});", {
		ls.insert_node(1),
		ls.function_node(function(args)
			local name = args[1][1]
			local first = string.upper(string.sub(name, 1, 1))
			local rest = string.sub(name, 2, -1)
			return "set" .. first .. rest
		end, { 1 }),
		ls.insert_node(2),
	})
)

local fcomp = ls.s(
	"fcomp",
	fmt("export default function {}() {{\n\treturn (\n\t\t<div>hello {}</div>\n\t);\n}}", {
		filename(),
		filename(),
	})
)

ls.snippets = {
	all = {},
	javascript = { log, unwrap, useState, fcomp },
	typescript = { log, unwrap },
	javascriptreact = { log, unwrap, useState, fcomp },
}

vim.keymap.set({ "i", "s" }, "<c-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })
