local opt = vim.fn.expand '$VIMRUNTIME' .. '\\pack\\nvim_config\\opt\\'

return {
  name = 'maps',
  dir = opt .. 'maps',
  lazy = true,
  event = { 'CmdlineEnter', 'InsertEnter', 'ModeChanged', },
  dependencies = {
    require 'plugins.asyncrun',
    require 'plugins.notify',
    require 'plugins.projectroot',
    require 'plugins.whichkey',
  },
  keys = {

    -- record
    { 'q',                   '<cmd>WhichKey q<cr>',                           mode = { 'n', 'v', }, silent = true,  desc = 'nop', },
    { 'Q',                   'q',                                             mode = { 'n', 'v', }, silent = true,  desc = 'record', },

    -- undo
    { 'U',                   '<c-r>',                                         mode = { 'n', },      silent = true,  desc = 'redo', },

    -- go cmdline
    { '<leader>;',           ':',                                             mode = { 'n', 'v', }, silent = false, desc = 'go cmdline', },

    -- scroll horizontally
    { '<S-ScrollWheelDown>', '10zl',                                          mode = { 'n', 'v', }, silent = false, desc = 'scroll right horizontally', },
    { '<S-ScrollWheelUp>',   '10zh',                                          mode = { 'n', 'v', }, silent = false, desc = 'scroll left horizontally', },

    -- f5
    { '<f5>',                '<cmd>e!<cr>',                                   mode = { 'n', 'v', }, silent = true,  desc = 'e!', },

    -- cursor
    { '<c-j>',               '5j',                                            mode = { 'n', 'v', }, silent = true,  desc = '5j', },
    { '<c-k>',               '5k',                                            mode = { 'n', 'v', }, silent = true,  desc = '5k', },

    -- copy_paste
    { '<a-y>',               '"+y',                                           mode = { 'v', },      silent = true,  desc = '"+y', },
    { 'yii',                 '"+yi',                                          mode = { 'n', },      silent = true,  desc = '"+yi', },
    { 'yaa',                 '"+ya',                                          mode = { 'n', },      silent = true,  desc = '"+ya', },
    { '<a-d>',               '"+d',                                           mode = { 'v', },      silent = true,  desc = '"+d', },
    { 'dii',                 '"+di',                                          mode = { 'n', },      silent = true,  desc = '"+di', },
    { 'daa',                 '"+da',                                          mode = { 'n', },      silent = true,  desc = '"+da', },
    { '<a-c>',               '"+c',                                           mode = { 'v', },      silent = true,  desc = '"+c', },
    { 'cii',                 '"+ci',                                          mode = { 'n', },      silent = true,  desc = '"+ci', },
    { 'caa',                 '"+ca',                                          mode = { 'n', },      silent = true,  desc = '"+ca', },
    { '<a-p>',               '"+p',                                           mode = { 'n', 'v', }, silent = true,  desc = '"+p', },
    { '<a-s-p>',             '"+P',                                           mode = { 'n', 'v', }, silent = true,  desc = '"+P', },

    -- yank.lua
    { '<leader>y<leader>',   function() require 'yank'.fname() end,           mode = { 'n', 'v', }, silent = true,  desc = 'copy %:t to +', },
    { '<leader>yg',          function() require 'yank'.absfname() end,        mode = { 'n', 'v', }, silent = true,  desc = 'copy fullpath to +', },
    { '<leader>yw',          function() require 'yank'.cwd() end,             mode = { 'n', 'v', }, silent = true,  desc = 'copy cwd to +', },

    -- change_dir.lua
    { 'q.',                  function() require 'change_dir'.cur() end,       mode = { 'n', 'v', }, silent = true,  desc = 'cd %:h', },
    { 'qu',                  function() require 'change_dir'.up() end,        mode = { 'n', 'v', }, silent = true,  desc = 'cd ..', },
    { 'qw',                  function() require 'change_dir'.cwd() end,       mode = { 'n', 'v', }, silent = true,  desc = 'cd cwd', },

    -- font_size.lua
    { '<c-=>',               function() require 'font_size'.up() end,         mode = { 'n', 'v', }, silent = true,  desc = 'font_size up', },
    { '<c-->',               function() require 'font_size'.down() end,       mode = { 'n', 'v', }, silent = true,  desc = 'font_size down', },
    { '<c-0><c-0>',          function() require 'font_size'.normal() end,     mode = { 'n', 'v', }, silent = true,  desc = 'font_size normal', },
    { '<c-0>_',              function() require 'font_size'.min() end,        mode = { 'n', 'v', }, silent = true,  desc = 'font_size min', },
    { '<c-0><c-->',          function() require 'font_size'.frameless() end,  mode = { 'n', 'v', }, silent = true,  desc = 'font_size frameless', },
    { '<c-0><c-=>',          function() require 'font_size'.fullscreen() end, mode = { 'n', 'v', }, silent = true,  desc = 'font_size fullscreen', },

    -- start.lua
    { 'cs.',                 function() require 'start'.explorer_cur() end,   mode = { 'n', 'v', }, silent = true,  desc = 'start explorer_cur', },
    { 'csu',                 function() require 'start'.explorer_up() end,    mode = { 'n', 'v', }, silent = true,  desc = 'start explorer_up', },
    { 'csw',                 function() require 'start'.explorer_cwd() end,   mode = { 'n', 'v', }, silent = true,  desc = 'start explorer_cwd', },
    { 'csc',                 function() require 'start'.system_cur() end,     mode = { 'n', 'v', }, silent = true,  desc = 'start system_cur', },
    { '<leader>s.',          function() require 'start'.source_lua_vim() end, mode = { 'n', 'v', }, silent = true,  desc = 'source vim or lua', },

    -- git_push.lua
    '<leader>gg',
    { '<leader>ga',  function() require 'git_push'.addcommitpush() end,    mode = { 'n', 'v', }, silent = true, desc = 'Git Push add all commit and push', },
    { '<leader>gc',  function() require 'git_push'.commitpush() end,       mode = { 'n', 'v', }, silent = true, desc = 'Git Push commit and push', },
    { '<leader>ggc', function() require 'git_push'.commit() end,           mode = { 'n', 'v', }, silent = true, desc = 'Git Push just commit', },
    { '<leader>ggs', function() require 'git_push'.push() end,             mode = { 'n', 'v', }, silent = true, desc = 'Git Push just push', },
    { '<leader>ggg', function() require 'git_push'.graph() end,            mode = { 'n', 'v', }, silent = true, desc = 'Git Push graph', },
    { '<leader>ggv', function() require 'git_push'.init() end,             mode = { 'n', 'v', }, silent = true, desc = 'Git Push init', },
    { '<leader>ggf', function() require 'git_push'.pull() end,             mode = { 'n', 'v', }, silent = true, desc = 'Git Push pull', },
    { '<leader>gga', function() require 'git_push'.addall() end,           mode = { 'n', 'v', }, silent = true, desc = 'Git Push add -A', },
    { '<leader>ggr', function() require 'git_push'.reset_hard() end,       mode = { 'n', 'v', }, silent = true, desc = 'Git Push reset --hard', },
    { '<leader>ggd', function() require 'git_push'.reset_hard_clean() end, mode = { 'n', 'v', }, silent = true, desc = 'Git Push reset --hard && git clean -fd', },

    -- window.lua
    { '<a-s-h>',     function() require 'window'.height_less() end,        mode = { 'n', 'v', }, silent = true, desc = 'Window 10wincmd <', },
    { '<a-s-l>',     function() require 'window'.height_more() end,        mode = { 'n', 'v', }, silent = true, desc = 'Window 10wincmd >', },
    { '<a-s-j>',     function() require 'window'.width_less() end,         mode = { 'n', 'v', }, silent = true, desc = 'Window 10wincmd -', },
    { '<a-s-k>',     function() require 'window'.width_more() end,         mode = { 'n', 'v', }, silent = true, desc = 'Window 10wincmd +', },
  },
  init = function()
    require 'which-key'.register { ['<leader>gg'] = { name = 'Git Push', }, }
    require 'which-key'.register { ['<leader>y'] = { name = 'Yank', }, }
  end,
}
