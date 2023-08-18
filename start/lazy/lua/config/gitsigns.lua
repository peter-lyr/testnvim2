local rf = function()
  require 'config.fugitive'.open(1)
end

require 'gitsigns'.setup {
  numhl     = true,
  linehl    = false,
  word_diff = true,

  signs     = {
    add = { text = '▎', },
    change = { text = '▎', },
    delete = { text = '', },
    topdelete = { text = '', },
    changedelete = { text = '▎', },
    untracked = { text = '▎', },
  },

  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', '<leader>j', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, { expr = true, desc = 'Gitsigns next_hunk', })
    map('n', '<leader>k', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, { expr = true, desc = 'Gitsigns prev_hunk', })

    -- Actions
    map('n', '<leader>gs', function()
      gs.stage_hunk(); rf()
    end, { desc = 'Gitsigns stage_hunk', })
    map('v', '<leader>gs', function() gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v', } end, { desc = 'Gitsigns stage_hunk', })
    map('n', '<leader>gms', function()
      gs.stage_buffer(); rf()
    end, { desc = 'Gitsigns stage_buffer', })
    map('n', '<leader>gu', function()
      gs.undo_stage_hunk(); rf()
    end, { desc = 'Gitsigns undo_stage_hunk', })
    map('v', '<leader>gr', function()
      gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v', }; rf()
    end, { desc = 'Gitsigns reset_hunk', })
    map('n', '<leader>gr', function()
      gs.reset_hunk(); rf()
    end, { desc = 'Gitsigns reset_hunk', })
    map('n', '<leader>gmr', function()
      gs.reset_buffer(); rf()
    end, { desc = 'Gitsigns reset_buffer', })

    map('n', '<leader>gmp', gs.preview_hunk, { desc = 'Gitsigns preview_hunk', })
    map('n', '<leader>gmb', function() gs.blame_line { full = true, } end, { desc = 'Gitsigns blame_line', })

    map('n', '<leader>gd', gs.diffthis, { desc = 'Gitsigns diffthis', })
    map('n', '<leader>gmd', function() gs.diffthis '~' end, { desc = 'Gitsigns diffthis', })

    map('n', '<leader>gmtb', gs.toggle_current_line_blame, { desc = 'Gitsigns toggle_current_line_blame', })
    map('n', '<leader>gmtd', gs.toggle_deleted, { desc = 'Gitsigns toggle_deleted', })
    map('n', '<leader>gmtn', gs.toggle_numhl, { desc = 'Gitsigns toggle_numhl', })
    map('n', '<leader>gmtl', gs.toggle_linehl, { desc = 'Gitsigns toggle_linehl', })
    map('n', '<leader>gmts', gs.toggle_signs, { desc = 'Gitsigns toggle_signs', })
    map('n', '<leader>gmtw', gs.toggle_word_diff, { desc = 'Gitsigns toggle_word_diff', })

    -- Text object
    map({ 'o', 'x', }, 'ig', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Gitsigns select_hunk', })
    map({ 'o', 'x', }, 'ag', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Gitsigns select_hunk', })
  end,
}

local word_diff = 1
local moving = nil

pcall(vim.api.nvim_del_autocmd, vim.g.gitsigns_insertenter)

vim.g.gitsigns_insertenter = vim.api.nvim_create_autocmd({ 'InsertEnter', 'CursorMoved', }, {
  callback = function()
    moving = 1
    if word_diff then
      local gs = package.loaded.gitsigns
      word_diff = gs.toggle_word_diff(nil)
    end
  end,
})

pcall(vim.api.nvim_del_autocmd, vim.g.gitsigns_insertleave)

vim.g.gitsigns_insertleave = vim.api.nvim_create_autocmd({ 'CursorHold', }, {
  callback = function()
    moving = nil
    vim.fn.timer_start(500, function()
      vim.schedule(function()
        if not moving then
          local gs = package.loaded.gitsigns
          word_diff = gs.toggle_word_diff(1)
        end
      end)
    end)
  end,
})
