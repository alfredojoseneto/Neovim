return {
	"jpalardy/vim-slime",
	config = function()
		vim.g.slime_target = "tmux"
		vim.keymap.set({ "n", "v" }, "<leader>j", "<cmd>SlimeSend<CR>", { desc = "Send to Tmux" })
	end,
}
