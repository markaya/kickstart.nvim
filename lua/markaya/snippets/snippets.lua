local ls = require 'luasnip'

-- local t = ls.text_node
--
local s = ls.snippet
local i = ls.insert_node
local extras = require 'luasnip.extras'
local fmt = require('luasnip.extras.fmt').fmt
local rep = extras.rep
-- NOTE: Lua Snippets
ls.add_snippets('lua', {
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
