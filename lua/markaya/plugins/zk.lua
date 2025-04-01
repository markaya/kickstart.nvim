return {
  'zk-org/zk-nvim',
  config = function()
    require('zk').setup {
      -- See Setup section below
      picker = 'telescope',
    }

    vim.api.nvim_set_keymap('n', '<leader>zb', ':ZkBacklinks<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>zl', ':ZkLinks<CR>', { noremap = true, silent = true })

    vim.api.nvim_set_keymap('n', '<leader>zf', ':FindAndGoToDefinition<CR>', { noremap = true, silent = true })
  end,
}
