vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move highlighted line up' })
vim.keymap.set('v', 'K', ":m '>-2<CR>gv=gv", { desc = 'Move highlighted line down' })

vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Move half page down and center cursor' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Move half page up and center cursor' })

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- When pressing Esc key, also remove highlighted text from search.
vim.keymap.set('n', '<esc>', '<cmd>nohlsearch<cr>')

-- diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'go to previous [d]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'go to next [d]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'show diagnostic [e]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'open diagnostic [q]uickfix list' })
