return {
 'akinsho/bufferline.nvim',
  dependencies = {'nvim-tree/nvim-web-devicons'},
  config = function()
    require('bufferline').setup{
      options = {
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        truncate_names = true,
        left_trunc_marker = '',
        right_trunc_marker = '',
        --always_show_bufferline = false,
        --mode = "tabs",
        separator_style = "thick",
        offsets = {
            {
                filetype = "NvimTree",
                text = "FileExplorer",
                --text = function()
                --    return vim.fn.getcwd()
                --end,
                text_align = "center", -- "left" | "center" | "right"
                highlight = "Directory",
                separator = true, -- use a "true" to enable the default, or set your own character
            }
        },
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        }
      }
    }
  end
}
