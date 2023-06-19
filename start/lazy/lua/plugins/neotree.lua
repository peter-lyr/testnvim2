return {
  'nvim-neo-tree/neo-tree.nvim',
  lazy = true,
  branch = 'v2.x',
  event = {
    'CursorMoved'
  },
  cmd = {
    'Neotree',
  },
  keys = {
    { '<leader>q',     function() require('config.neotree').filesystem_open() end,         mode = { 'n', 'v' }, desc = 'NeoTree open filesystem' },
    { '<leader><tab>', function() require('config.neotree').git_status_buffers_open() end, mode = { 'n', 'v' }, desc = 'NeoTree git_status buffers toggle' },

    { '<rightmouse>',  function() require('config.neotree').open() end,                      mode = { 'n', 'v' }, desc = 'NeoTree open' },
    { '<middlemouse>', function() require('config.neotree').close() end,                     mode = { 'n', 'v' }, desc = 'NeoTree close' },
  },
  dependencies = {
    require('plugins.plenary'),
    require('plugins.web-devicons'),
    'MunifTanjim/nui.nvim',
    's1n7ax/nvim-window-picker',
    require('plugins.bbye'),
  },
  config = function()
    require('config.neotree')
  end
}
