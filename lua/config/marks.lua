local M = {}

require 'marks'.setup {
  default_mappings = false,
  builtin_marks = { '.', '<', '>', '^', },
  cyclic = false,
  force_write_shada = false,
  refresh_interval = 250,
  sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20, },
  excluded_filetypes = {
    'NvimTree',
    'fugitive',
    'help',
  },
  mappings = {
    toggle = 'mm',
    set_next = 'mn',
    delete_line = 'md',
    delete_buf = 'mx',
    next = 'ms',
    prev = 'mw',
    annotate = 'ma',
  },
}

return M
