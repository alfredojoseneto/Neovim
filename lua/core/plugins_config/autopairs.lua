local status_ok, config = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

require("nvim-autopairs").setup({
})
