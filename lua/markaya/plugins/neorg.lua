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
        ['core.concealer'] = {},
        ['core.dirman'] = {
          config = {
            workspaces = {
              work_stuff = '~/neorg_notes/work_stuff',
              knowledge_base = '~/neorg_notes/knowledge_base',
              task_manager = '~/neorg_notes/task_manager',
            },
            default_workspace = 'knowledge_base',
          },
        },
      },
    }
  end,
}
