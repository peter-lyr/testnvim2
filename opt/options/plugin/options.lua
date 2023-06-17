-- '<,'>s/\(vim\.opt\.\w\+\) \+= \+\(.\+\)/\=printf("%-30s = %s", submatch(1), submatch(2))

vim.opt.number          = true
vim.opt.numberwidth     = 1
vim.opt.relativenumber  = true
vim.opt.title           = true
vim.opt.winminheight    = 0
vim.opt.winminwidth     = 0
vim.opt.expandtab       = true
vim.opt.cindent         = true
vim.opt.smartindent     = true
vim.opt.wrap            = false
vim.opt.smartcase       = true
vim.opt.cursorline      = true
vim.opt.termguicolors   = true
vim.opt.splitright      = true
vim.opt.splitbelow			= true
vim.opt.mousemodel      = "extend"
vim.opt.mousescroll     = "ver:5,hor:0"
vim.opt.swapfile        = false
vim.opt.fileformats     = 'dos'
vim.opt.foldmethod      = "indent"
vim.opt.foldlevel       = 99
vim.opt.signcolumn      = "auto:1"
-- vim.opt.foldcolumn      = 'auto:1'
vim.opt.updatetime      = 10
vim.opt.titlestring     = "%{ printf('%s :) %dM', substitute(getcwd(), '\\', '/', 'g'), v:lua.vim.loop.resident_set_memory() / 1024 / 1024) }"
-- vim.opt.updatetime      = 0
-- vim.opt.background      = "dark" -- 耗时高
-- vim.opt.backspace       = "indent,eol,start"
-- vim.opt.iskeyword       = '@,48-57,_,192-255'
-- vim.opt.autoindent      = true -- true
