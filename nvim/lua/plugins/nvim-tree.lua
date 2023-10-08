return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local function my_on_attach(bufnr)
			local api = require("nvim-tree.api")

			-- recommended settings from nvim-tree documentation
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			-- other settings that are working better
			-- vim.g.nvim_tree_ignore = { ".git", "node_modules", ".cache", "__pycache" }
			vim.g.nvim_tree_auto_open = 0
			vim.g.nvim_tree_auto_close = 0
			vim.g.nvim_tree_follow = 1
			vim.g.nvim_tree_git_hl = 1
			vim.g.nvim_tree_indent_markers = 1

			-- change color for arrows in tree to light blue
			vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			-- default mappings
			api.config.mappings.default_on_attach(bufnr)

			-- custom mappings
			vim.keymap.set("n", "<C-[>", api.tree.change_root_to_parent, opts("Up"))
			vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts("Down"))
			vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
			vim.keymap.del("n", "<Esc>", { buffer = bufnr }) -- scape do nothing
			-- vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
		end

		-- configure nvim-tree
		require("nvim-tree").setup({
			view = {
				width = 35,
				-- relativenumber = true,
				relativenumber = false,
			},
			-- change folder arrow icons
			renderer = {
				group_empty = true,
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "", -- arrow when folder is closed
							arrow_open = "", -- arrow when folder is open
						},
					},
				},
			},
			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				dotfiles = true,
				-- custom = { ".DS_Store" },
			},
			live_filter = {
				prefix = "[FILTER]: ",
				always_show_folders = true,
			},
			git = {
				ignore = false,
			},
			on_attach = my_on_attach,
		})

		vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
	end,
}
