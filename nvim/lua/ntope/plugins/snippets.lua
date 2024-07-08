return {
	{
		"L3MON4D3/LuaSnip",
		lazy = true,
		config = function()
			local ls = require("luasnip")
			local fmt = require("luasnip.extras.fmt").fmt

			ls.config.set_config({
				updateevents = "TextChanged,TextChangedI",
				enable_autosnippets = true,
			})

			local t, i, c, f = ls.text_node, ls.insert_node, ls.choice_node, ls.function_node

			local same = function(index)
				return f(function(args)
					return args[1]
				end, { index })
			end

			local filename = function()
				return f(function(_args, snip)
					local name = vim.split(snip.snippet.env.TM_FILENAME, ".")
					return name[1] or ""
				end)
			end

			local log = ls.s(
				"log",
				fmt("console.log({});", {
					c(1, {
						i(1, "basic"),
						ls.sn(1, { t("'"), i(1, "labelled"), t("', "), same(1) }),
						ls.sn(1, { t("{ "), i(1, "object"), t(" }") }),
					}),
				})
			)

			local unwrap = ls.s(
				"uw",
				fmt("const {{ {} }} = {};", {
					i(1, "key"),
					i(2, "object"),
				})
			)

			local useState = ls.s(
				"us",
				fmt("const [{}, {}] = useState({});", {
					i(1, "state"),
					f(function(args)
						local name = args[1][1]
						local first = string.upper(string.sub(name, 1, 1))
						local rest = string.sub(name, 2, -1)
						return "set" .. first .. rest
					end, { 1 }),
					i(0),
				})
			)

			local useStateTyped = ls.s(
				"ust",
				fmt("const [{}, {}] = useState<{}>({});", {
					i(1, "state"),
					f(function(args)
						local name = args[1][1]
						local first = string.upper(string.sub(name, 1, 1))
						local rest = string.sub(name, 2, -1)
						return "set" .. first .. rest
					end, { 1 }),
					i(2),
					i(0),
				})
			)

			local fcomp = ls.s(
				"fcomp",
				fmt(
					[[
  export default function {}({{ {} }}) {{
    {}
    return (
      <div>hello {}</div>
    );
  }}
  ]],
					{
						filename(),
						i(1, "props"),
						i(0),
						filename(),
					}
				)
			)

			ls.add_snippets("javascript", { log, unwrap, useState, fcomp })
			ls.add_snippets("javascriptreact", { log, unwrap, useState, fcomp })
			ls.add_snippets("typescript", { log, unwrap, useState })
			ls.add_snippets("typescriptreact", { log, unwrap, useState, useStateTyped, fcomp })

			ls.add_snippets("markdown", {
				ls.s("link", fmt("[{}]({}.md)", { i(1, "filename"), same(1) })),
			})

			vim.keymap.set({ "i", "s" }, "<c-k>", function()
				if ls.expand_or_jumpable() then
					ls.expand_or_jump()
				else
					print("no snippet to expand")
				end
			end, { silent = true })

			vim.keymap.set({ "i", "s" }, "<c-h>", function()
				if ls.choice_active() then
					ls.change_choice(-1)
				else
					vim.lsp.buf.signature_help()
				end
			end, { silent = true })

			ls.config.setup({})
		end,
	},
}
