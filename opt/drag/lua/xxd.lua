local M = {}

M.temp = require('plenary.path'):new(vim.fn.expand('$TEMP')):joinpath('temp_xxd.txt')

-- M.xxd_opt = 'xxd -c16 -g2' -- default
M.xxd_opt = 'xxd'

M.dict = {}

local function rep(content)
  content = vim.fn.tolower(content)
  content = string.gsub(content, '\\', '/')
  return content
end

M.check = function(ev)
  vim.schedule(function()
    local info = vim.fn.system(string.format('file -b --mime-type --mime-encoding "%s"', ev.file))
    info = string.gsub(info, '%s', '')
    info = vim.fn.split(info, ';')
    if string.match(info[2], 'binary') and not string.match(info[1], 'empty') then
      local ext = string.match(ev.file, '.+%.(%w+)$')
      local txt = rep(string.format('%s.txt', ev.file))
      local char = rep(string.format('%s.c', ev.file))
      local ori = ev.file
      local bak = string.format('%s.%s.bak.%s', ev.file, vim.fn.strftime('%Y%m%d%H%M%S'), ext)
      vim.fn.system(string.format('%s "%s" "%s"', M.xxd_opt, ori, txt))
      vim.fn.system(string.format('cd %s && %s -i "%s" "%s"', vim.fn.fnamemodify(ori, ':h'), M.xxd_opt,
        vim.fn.fnamemodify(ori, ':t'), char))
      vim.fn.system(string.format('copy /y "%s" "%s"', ev.file, bak))
      vim.cmd('e ' .. txt)
      vim.cmd('setlocal ft=xxd')
      vim.loop.new_timer():start(1000, 0, function()
        vim.schedule(function()
          vim.cmd(ev.buf .. 'bw!')
        end)
      end)
      M.dict[txt] = {
        ori,
        char,
        bak,
      }
    end
  end)
end

return M
