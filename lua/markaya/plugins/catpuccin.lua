return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000, -- make sure to load this before all the other start plugins.
    init = function()
      vim.cmd.colorscheme 'catppuccin-frappe'
    end,
  },
}
