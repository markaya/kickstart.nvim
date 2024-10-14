return {
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
      },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      local cmp = require 'cmp'

      local luasnip = require 'luasnip'
      local types = require 'luasnip.util.types'

      luasnip.config.setup {
        -- This tells Luasnip to remember to keep around the last snippet
        -- you can jump back into it even if you move outside of the selection
        history = true,

        -- This one is cool cause if you have dynamic snippets, it updates as
        -- you type!
        update_events = { 'TextChanged', 'TextChangedI' },

        -- Autosnippets
        enable_autosnippets = true,

        ext_opts = {
          [types.choiceNode] = {
            active = {
              virt_text = { { '<-', 'Error' } },
            },
          },
        },
      }

      local s = luasnip.snippet
      local t = luasnip.text_node
      local i = luasnip.insert_node
      local extras = require 'luasnip.extras'
      local fmt = require('luasnip.extras.fmt').fmt
      local rep = extras.rep
      luasnip.add_snippets('lua', {
        s(
          'objectNew',
          fmt(
            [[
          {} = {{}}

          function {}:new({})
            local newObj = {{}}
            self.__index = self
            return setmetatable(newObj, self)
          end
            ]],
            {
              i(1, 'Obj_name'),
              rep(1),
              i(2, 'args'),
            }
          )
        ),
      })
      -- i(1),
      -- t ' = {} \n\n',
      -- t 'function ',
      -- rep(1),
      -- t ':new(',
      -- i(2, 'args'),
      -- t ')\n',
      -- t 'end',

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },

        -- For an understanding of why these mappings were
        -- chosen, you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-y>'] = cmp.mapping.confirm { select = true },

          -- Manually trigger a completion from nvim-cmp.
          --  Generally you don't need this, because nvim-cmp will display
          --  completions whenever it has completion options available.
          ['<C-Space>'] = cmp.mapping.complete {},

          -- Think of <c-l> as moving to the right of your snippet expansion.
          --  So if you have a snippet that's like:
          --  function $name($args)
          --    $body
          --  end
          --
          -- <c-l> will move you to the right of each of the expansion locations.
          -- <c-h> is similar, except moving you backwards.
          ['<c-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<c-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),

          -- for more advanced luasnip keymaps (e.g. selecting choice nodes, expansion) see:
          --    https://github.com/l3mon4d3/luasnip?tab=readme-ov-file#keymaps
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
      }
    end,
  },
}
