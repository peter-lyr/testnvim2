local opt = vim.fn.expand '$VIMRUNTIME' .. '\\pack\\nvim_config\\opt\\'

return {
  name = 'tabline',
  lazy = true,
  dir = opt .. 'tabline',
  event = { 'BufReadPost', 'BufNewFile', },
  dependencies = {
    require 'plugins.plenary',
    require 'plugins.projectroot',
    'peter-lyr/vim-bbye',
  },
  keys = {
    { '<c-h>',       function() require 'tabline'.b_prev_buf() end,                 mode = { 'n', 'v', }, silent = true, desc = 'tabline b prev buffer', },
    { '<c-l>',       function() require 'tabline'.b_next_buf() end,                 mode = { 'n', 'v', }, silent = true, desc = 'tabline b next buffer', },
    { '<c-s-h>',     function() require 'tabline'.bd_prev_buf() end,                mode = { 'n', 'v', }, silent = true, desc = 'tabline bd prev buffer', },
    { '<c-s-l>',     function() require 'tabline'.bd_next_buf() end,                mode = { 'n', 'v', }, silent = true, desc = 'tabline bd next buffer', },
    { '<c-q><c-t>',  function() require 'tabline'.restore_hidden_tabs() end,        mode = { 'n', 'v', }, silent = true, desc = 'tabline restore hidden tabs', },
    { '<c-q>t',      function() require 'tabline'.restore_hidden_tabs() end,        mode = { 'n', 'v', }, silent = true, desc = 'tabline restore hidden tabs', },
    { '<c-q><c-o>',  function() require 'tabline'.append_one_proj_right_down() end, mode = { 'n', 'v', }, silent = true, desc = 'tabline append one proj right down', },
    { '<c-q>o',      function() require 'tabline'.append_one_proj_right_down() end, mode = { 'n', 'v', }, silent = true, desc = 'tabline append one proj right down', },
    { '<c-q><c-bs>', function() require 'tabline'.simple_statusline_toggle() end,   mode = { 'n', 'v', }, silent = true, desc = 'tabline simple_statusline_toggle', },
    { '<leader>at',  function() require 'tabline'.only_tabs_toggle() end,           mode = { 'n', 'v', }, silent = true, desc = 'tabline show only tabs toggle', },
  },
  init = function()
    vim.opt.tabline     = ' ' .. vim.loop.cwd()
    vim.opt.showtabline = 2
  end,
  config = function()
    require 'tabline'
  end,
}
