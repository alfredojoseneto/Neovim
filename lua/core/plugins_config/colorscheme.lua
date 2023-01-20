local colorscheme = "tokyonight"

local status_ok, message = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return message
end
