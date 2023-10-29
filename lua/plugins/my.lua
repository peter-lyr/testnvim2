local S = require 'startup'

return {
  {
    name = 'my_sessions',
    dir = '',
    lazy = true,
    event = { 'BufReadPost', 'BufNewFile', },
    init = function()
      if not S.load_whichkeys_txt_enable then
        require 'my_simple'.add_whichkey('<leader>s', 'sessions', 'My_Sessions')
      end
    end,
    config = function()
      require 'map.my_sessions'
    end,
  },
  {
    name = 'my_window',
    dir = '',
    lazy = true,
    keys = {
      { '<a-s-h>', function() require 'config.my_window'.height_less() end,   mode = { 'n', 'v', }, silent = true, desc = 'Window height_less', },
      { '<a-s-l>', function() require 'config.my_window'.height_more() end,   mode = { 'n', 'v', }, silent = true, desc = 'Window height_more', },
      { '<a-s-j>', function() require 'config.my_window'.width_less() end,    mode = { 'n', 'v', }, silent = true, desc = 'Window width_less', },
      { '<a-s-k>', function() require 'config.my_window'.width_more() end,    mode = { 'n', 'v', }, silent = true, desc = 'Window width_more', },
      { '<c-=>',   function() require 'config.my_window'.fontsize_up() end,   mode = { 'n', 'v', }, silent = true, desc = 'font_size up', },
      { '<c-->',   function() require 'config.my_window'.fontsize_down() end, mode = { 'n', 'v', }, silent = true, desc = 'font_size down', },
    },
    init = function()
      if not S.load_whichkeys_txt_enable then
        require 'my_simple'.add_whichkey('<leader>w', 'window', 'My_Window')
        require 'my_simple'.add_whichkey('<leader>x', 'window', 'My_Window', 'kill')
        require 'my_simple'.add_whichkey('<c-0>', 'window', 'My_Window', 'Font size')
      end
    end,
    config = function()
      require 'map.my_window'
    end,
  },
  {
    name = 'my_test',
    dir = '',
    lazy = true,
    init = function()
      if not S.load_whichkeys_txt_enable then
        require 'my_simple'.add_whichkey('<c-s-f4>', 'test', 'My_Test')
      end
    end,
    config = function()
      require 'map.my_test'
    end,
  },
  {
    name = 'my_tabline',
    dir = '',
    lazy = true,
    event = { 'BufReadPost', 'BufNewFile', },
    init = function()
      vim.opt.tabline = ' ' .. vim.loop.cwd()
      vim.opt.showtabline = 2
      if not S.load_whichkeys_txt_enable then
        require 'my_simple'.add_whichkey('<leader>q', 'tabline', 'My_Tabline')
      end
    end,
    config = function()
      require 'map.my_tabline'
    end,
  },
}
