return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = ':Git' })

    local markaya_fugitive = vim.api.nvim_create_augroup('markaya_fugitive', {})

    local autocmd = vim.api.nvim_create_autocmd
    autocmd('BufWinEnter', {
      group = markaya_fugitive,
      pattern = '*',
      callback = function()
        if vim.bo.ft ~= 'fugitive' then
          return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = { buffer = bufnr, remap = false }

        -- TODO: Must fix these remaps to work

        --[[ vim.keymap.set('n', '<leader>p', function()
          vim.cmd.Git 'push'
        end, vim.tbl_deep_extend('keep', opts, { desc = 'Git push' }))

        vim.keymap.set('n', '<leader>P', function()
          vim.cmd.Git { 'pull', '--rebase' }
        end, vim.tbl_deep_extend('keep', opts, { desc = 'Git pull --rebase' }))

        -- NOTE: It allows me to easily set the branch i am pushing and any tracking
        -- needed if i did not set the branch up correctly
        
        vim.keymap.set('n', '<leader>t', ':Git push -u origin ', vim.tbl_deep_extend('keep', opts, { desc = 'Git pull --rebase' })) ]]
      end,
    })

    -- vim.keymap.set('n', 'gu', '<cmd>diffget //2<CR>')
    -- vim.keymap.set('n', 'gh', '<cmd>diffget //3<CR>')
  end,
}
