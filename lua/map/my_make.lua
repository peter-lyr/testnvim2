local M = {}
local B = require 'my_base'
B.load_require_common()
M.source = require 'my_base'.get_source(debug.getinfo(1)['source'])
M.loaded = B.get_loaded(M.source)
M.lua = string.match(M.loaded, '%.([^.]+)$')
--------------------------------------------

function M.opt(desc)
  return { silent = true, desc = M.lua .. ' ' .. desc, }
end

vim.keymap.set({ 'n', 'v', }, '<leader>bcm', function() require 'config.my_make'.make() end, M.opt 'make')
vim.keymap.set({ 'n', 'v', }, '<leader>bcM', function() require 'config.my_make'.make 'start' end, M.opt 'make start')
vim.keymap.set({ 'n', 'v', }, '<leader>bcc', function() require 'config.my_make'.clean() end, M.opt 'clean')
vim.keymap.set({ 'n', 'v', }, '<leader>bcr', function() require 'config.my_make'.run() end, M.opt 'run')
vim.keymap.set({ 'n', 'v', }, '<leader>bcR', function() require 'config.my_make'.run 'start' end, M.opt 'run start')
vim.keymap.set({ 'n', 'v', }, '<leader>bcg', function() require 'config.my_make'.gcc() end, M.opt 'gcc')

B.register_whichkey('config.my_make', '<leader>bc', 'c/c++ build')
B.merge_whichkeys()

return M
