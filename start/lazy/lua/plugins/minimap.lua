return {
  'echasnovski/mini.map',
  version = '*',
  event = { 'BufReadPost', 'BufNewFile', },
  lazy = true,
  keys = {
    { '<leader>am', function() require 'config.minimap'.open() end,         mode = { 'n', 'v', }, silent = true, desc = 'MiniMap open', },
    { '<leader>aM', function() require 'config.minimap'.close() end,        mode = { 'n', 'v', }, silent = true, desc = 'MiniMap close', },
    { '<leader>an', function() require 'config.minimap'.toggle_focus() end, mode = { 'n', 'v', }, silent = true, desc = 'MiniMap toggle_focus', },
  },
  init = function()
    require 'which-key'.register { ['<leader>a'] = { name = 'Side Panel', }, }
  end,
  config = function()
    require 'config.minimap'
  end,
}
