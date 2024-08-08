return {
  'nvim-neorg/neorg',
  dependencies = { 'luarocks.nvim' },
  -- put any other flags you wanted to pass to lazy here!
  lazy = false,
  version = '*',
  config = function()
    require('neorg').setup {
      load = {
        ['core.defaults'] = {},
        ['core.summary'] = {},
        ['core.concealer'] = {
          config = {
            icon_preset = 'diamond',
          },
        },
        ['core.export'] = {},
        ['core.dirman'] = {
          config = {
            workspaces = {
              task_manager = '~/neorg_notes/task_manager',
              literature = '~/neorg_notes/literature',
            },
            default_workspace = 'task_manager',
          },
        },
      },
    }

    local group = vim.api.nvim_create_augroup('neorg-group', { clear = true })

    vim.keymap.set('n', '<leader>ng', function()
      vim.cmd [[Neorg index]]
    end, { desc = 'Toggle [N]eor[g]' })

    vim.keymap.set('n', '<leader>xng', function()
      vim.cmd [[Neorg return]]
    end, { desc = 'E[x]it [N]eor[g]' })

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
      pattern = { '*.norg' },
      group = group,
      command = 'set conceallevel=3 concealcursor=n',
    })
  end,
}
