return {
	-- the colorscheme should be available when starting Neovim
	{
		"Mofiqul/dracula.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[ colorscheme dracula ]])
			vim.cmd([[ highlight CursorLineNr guifg=#BD93F9 guibg=#44475A ]])
		end,
	},
}
