return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		ident = {
			highlight = {
				"RainbowViolet",
				"RainbowCyan",
				"RainbowYellow",
				"RainbowGreen",
				"RainbowBlue",
				"RainbowOrange",
				"RainbowRed",
			},
			char = "▏",
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
			},
		},
	},

	config = function(_, opts)
		-- local highlight = {}
		local hooks = require("ibl.hooks")
		-- create the highlight groups in the highlight setup hook, so they are reset
		-- every time the colorscheme changes
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
			vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
			vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
			vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
			vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
			vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
			vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
		end)

		-- vim.g.rainbow_delimiters = { highlight = highlight }
		vim.g.rainbow_delimiters = { highlight = opts.ident.highlight }

		require("ibl").setup({
			-- indent = { highlight = opts.ident.highlight, char = opts.ident.char },
			scope = { highlight = opts.ident.highlight, char = opts.ident.char, show_exact_scope = true },
		})

		hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
	end,
}
