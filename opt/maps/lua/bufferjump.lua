local M = {}

package.loaded['bufferjump'] = nil

M.winid = 0

local isallow = function(winnr)
  local bufnr = vim.fn.winbufnr(winnr)
  if vim.api.nvim_buf_is_valid(bufnr) then
    local ft = vim.api.nvim_buf_get_option(bufnr, 'filetype')
    if vim.tbl_contains({ 'NvimTree', 'fugitive', 'minimap', 'aerial', 'edgy', }, ft) == true then
      return nil
    end
  end
  return 1
end

M.max_try = function()
  if vim.g.max_en == 1 then
    vim.cmd 'wincmd _'
  end
end

M.wp = function()
  local count = vim.v.count
  local max = vim.fn.winnr '$'
  local winid = 0
  if count == 0 then
    local winnr = vim.fn.winnr() - 1
    if winnr < 1 then
      winnr = max
    end
    winid = vim.fn.win_getid(winnr)
    if vim.api.nvim_win_get_height(winid) < 2 then
      vim.api.nvim_win_set_height(winid, 2)
    end
  else
    if count > max then
      count = max
    end
    winid = vim.fn.win_getid(count)
    if vim.api.nvim_win_get_height(winid) < 2 then
      vim.api.nvim_win_set_height(winid, 2)
    end
  end
  vim.fn.win_gotoid(winid)
  M.max_try()
end

M.wn = function()
  local winid = 0
  local count = vim.v.count
  local max = vim.fn.winnr '$'
  if count == 0 then
    local winnr = vim.fn.winnr() + 1
    if winnr > max then
      winnr = 1
    end
    winid = vim.fn.win_getid(winnr)
    if vim.api.nvim_win_get_height(winid) < 2 then
      vim.api.nvim_win_set_height(winid, 2)
    end
  else
    if count > max then
      count = max
    end
    winid = vim.fn.win_getid(count)
    if vim.api.nvim_win_get_height(winid) < 2 then
      vim.api.nvim_win_set_height(winid, 2)
    end
  end
  vim.fn.win_gotoid(winid)
  M.max_try()
end

M.main = function()
  for winnr = 1, vim.fn.winnr '$' do
    local bufnr = vim.fn.winbufnr(winnr)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    if vim.fn.filereadable(fname) == 1 then
      local winid = vim.fn.win_getid(winnr)
      vim.fn.win_gotoid(winid)
      break
    end
  end
end

M.i = function()
  vim.g.max_en = 0
  vim.cmd 'wincmd ='
  if vim.opt.winfixheight:get() == true then
    vim.cmd [[
      set nowinfixheight
      wincmd =
      set winfixheight
    ]]
  end
end

M.o = function()
  vim.g.max_en = 1
  vim.cmd 'wincmd _'
end

M.z = function()
  M.o()
  vim.cmd 'wincmd |'
end

local gotoid = function(winid)
  if vim.api.nvim_win_get_height(winid) < 2 then
    vim.api.nvim_win_set_height(winid, 2)
  end
  vim.fn.win_gotoid(winid)
end

pcall(vim.api.nvim_del_autocmd, vim.g.bufferjump_au_bufenter)

M.au = function()
  vim.g.bufferjump_au_bufenter = vim.api.nvim_create_autocmd({ 'CursorHold', }, {
    callback = function(ev)
      if M.x ~= -1 and vim.api.nvim_buf_get_option(ev.buf, 'buftype') ~= 'quickfix' then
        for winnr = 1, vim.fn.winnr '$' do
          if isallow(winnr) then
            local cur_winid = vim.fn.win_getid(winnr)
            if vim.api.nvim_get_option_value('winfixheight', { win = cur_winid, scope = 'global', }) == true then
              if vim.api.nvim_win_get_height(cur_winid) ~= M.x * 7 then
                M.ix(M.x)
                vim.fn.timer_start(500, function()
                  M.ix(M.x)
                end)
                return
              end
            end
            if vim.api.nvim_get_option_value('winfixwidth', { win = cur_winid, scope = 'global', }) == true then
              if vim.api.nvim_win_get_width(cur_winid) ~= M.x * 17 then
                M.ix(M.x)
                vim.fn.timer_start(500, function()
                  M.ix(M.x)
                end)
                return
              end
            end
          end
        end
      end
    end,
  })
end

M.au()

M.x = -1

M.ix = function(x)
  local winid = vim.fn.win_getid()
  if x == 9 then
    pcall(vim.api.nvim_del_autocmd, vim.g.bufferjump_au_bufenter)
    for winnr = 1, vim.fn.winnr '$' do
      gotoid(vim.fn.win_getid(winnr))
      if vim.opt.winfixheight:get() == true then
        vim.cmd [[
          set nowinfixheight
          wincmd =
          set winfixheight
          ]]
      elseif vim.opt.winfixwidth:get() == true then
        vim.cmd [[
          set nowinfixwidth
          wincmd =
          set winfixwidth
          ]]
      end
    end
    vim.fn.timer_start(800, function()
      M.au()
    end)
  elseif x == 10 then
    M.x = -1
    for winnr = 1, vim.fn.winnr '$' do
      gotoid(vim.fn.win_getid(winnr))
      vim.cmd [[
        set nowinfixheight
        set nowinfixwidth
        ]]
    end
    vim.cmd 'wincmd ='
  elseif x == 11 then
    for winnr = vim.fn.winnr() - 1, 1, -1 do
      if isallow(winnr) then
        local cur_winid = vim.fn.win_getid(winnr)
        if vim.api.nvim_get_option_value('winfixheight', { win = cur_winid, scope = 'global', }) == true
            or vim.api.nvim_get_option_value('winfixwidth', { win = cur_winid, scope = 'global', }) == true then
          gotoid(vim.fn.win_getid(winnr))
          return
        end
      end
    end
    return
  elseif x == 12 then
    for winnr = vim.fn.winnr() + 1, vim.fn.winnr '$' do
      if isallow(winnr) then
        local cur_winid = vim.fn.win_getid(winnr)
        if vim.api.nvim_get_option_value('winfixheight', { win = cur_winid, scope = 'global', }) == true
            or vim.api.nvim_get_option_value('winfixwidth', { win = cur_winid, scope = 'global', }) == true then
          gotoid(cur_winid)
          return
        end
      end
    end
    return
  else
    if x > 0 then
      M.x = x
    else
      M.x = -1
    end
    if x == 1 then
      x = 4
    elseif x == 2 then
      x = 8
    else
      if x >= 6 then
        x = x - 1
      elseif x >= 3 then
        x = x - 2
      end
    end
    local cnt = 1
    for winnr = 1, vim.fn.winnr '$' do
      if isallow(winnr) then
        local cur_winid = vim.fn.win_getid(winnr)
        if vim.api.nvim_get_option_value('winfixheight', { win = cur_winid, scope = 'global', }) == true then
          vim.api.nvim_win_set_height(cur_winid, x * 7)
        end
        if vim.api.nvim_get_option_value('winfixwidth', { win = cur_winid, scope = 'global', }) == true then
          cnt = cnt + 1
        end
      end
    end
    for _ = 1, cnt do
      for winnr = 1, vim.fn.winnr '$' do
        if isallow(winnr) then
          local cur_winid = vim.fn.win_getid(winnr)
          if vim.api.nvim_get_option_value('winfixwidth', { win = cur_winid, scope = 'global', }) == true then
            local temp = vim.api.nvim_win_get_width(cur_winid)
            if temp ~= x * 17 then
              gotoid(cur_winid)
              vim.cmd 'e!'
              vim.cmd 'wincmd h'
              vim.api.nvim_win_set_width(0, vim.api.nvim_win_get_width(0) - x * 17 + vim.api.nvim_win_get_width(cur_winid))
              vim.cmd 'e!'
            end
          end
        end
      end
    end
  end
  gotoid(winid)
end

M.hh = function()
  vim.cmd 'set nowinfixwidth'
  print 'set nowinfixwidth'
end

M.ll = function()
  vim.cmd 'set winfixwidth'
  print 'set winfixwidth'
end

M.kk = function()
  vim.cmd 'set winfixheight'
  print 'set winfixheight'
end

M.jj = function()
  vim.cmd 'set nowinfixheight'
  print 'set nowinfixheight'
end

local hjkl_en = 0

M.hjkl_toggle = function()
  if hjkl_en == 0 then
    vim.keymap.set({ 'n', 'v', }, '1', 'h', { desc = 'h', })
    vim.keymap.set({ 'n', 'v', }, '2', 'j', { desc = 'j', })
    vim.keymap.set({ 'n', 'v', }, '3', 'k', { desc = 'k', })
    vim.keymap.set({ 'n', 'v', }, '4', 'l', { desc = 'l', })
    hjkl_en = 1
  else
    vim.keymap.del({ 'n', 'v', }, '1')
    vim.keymap.del({ 'n', 'v', }, '2')
    vim.keymap.del({ 'n', 'v', }, '3')
    vim.keymap.del({ 'n', 'v', }, '4')
    hjkl_en = 0
  end
  print('hjkl_en: ' .. hjkl_en)
end

M.last_readable_winids = {}

pcall(vim.api.nvim_del_autocmd, vim.g.bufferjump_au_bufleave)

vim.g.bufferjump_au_bufleave = vim.api.nvim_create_autocmd({ 'BufLeave', }, {
  callback = function(ev)
    if vim.fn.filereadable(ev.file) == 1 then
      local winid = vim.fn.win_getid(vim.fn.bufwinnr(ev.buf))
      if vim.tbl_contains(M.last_readable_winids, winid) == false then
        if #M.last_readable_winids < 2 then
          M.last_readable_winids[#M.last_readable_winids + 1] = winid
        else
          M.last_readable_winids[1] = M.last_readable_winids[2]
          M.last_readable_winids[2] = winid
        end
      end
    end
  end,
})

M.p = function()
  if #M.last_readable_winids == 0 then
    return
  elseif #M.last_readable_winids == 1 then
    pcall(vim.fn.win_gotoid, M.last_readable_winids[1])
  else
    if M.last_readable_winids[2] == vim.fn.win_getid(vim.fn.bufwinnr(vim.fn.bufnr())) then
      pcall(vim.fn.win_gotoid, M.last_readable_winids[1])
    else
      pcall(vim.fn.win_gotoid, M.last_readable_winids[2])
    end
  end
end

return M
