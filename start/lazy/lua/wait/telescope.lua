return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.1',
  lazy = true,
  cmd = {
    'Telescope',
  },
  keys = {
    { '<leader>s<leader>', '<cmd>Telescope find_files<cr>',                                                                                   mode = { 'n', 'v', }, silent = true, desc = 'Telescope find_files', },
    { '<leader>sh',        '<cmd>Telescope search_history<cr>',                                                                               mode = { 'n', 'v', }, silent = true, desc = 'Telescope search_history', },
    { '<leader>sc',        '<cmd>Telescope command_history<cr>',                                                                              mode = { 'n', 'v', }, silent = true, desc = 'Telescope command_history', },
    { '<leader>svc',       '<cmd>Telescope commands<cr>',                                                                                     mode = { 'n', 'v', }, silent = true, desc = 'Telescope commands', },
    { '<leader>so',        '<cmd>Telescope frecency<cr>',                                                                                     mode = { 'n', 'v', }, silent = true, desc = 'Telescope oldfiles', },
    { '<leader>sb',        '<cmd>Telescope buffers<cr>',                                                                                      mode = { 'n', 'v', }, silent = true, desc = 'Telescope buffers', },
    { '<leader>svb',       '<cmd>Telescope buffers cwd_only=true sort_mru=true ignore_current_buffer=true<cr>',                               mode = { 'n', 'v', }, silent = true, desc = 'Telescope buffers cwd_only', },
    { '<leader>sj',        '<cmd>Telescope jumplist<cr>',                                                                                     mode = { 'n', 'v', }, silent = true, desc = 'Telescope jumplist', },
    { '<leader>sm',        '<cmd>Telescope keymaps<cr>',                                                                                      mode = { 'n', 'v', }, silent = true, desc = 'Telescope keymaps', },
    { '<leader>sd',        '<cmd>Telescope diagnostics<cr>',                                                                                  mode = { 'n', 'v', }, silent = true, desc = 'Telescope diagnostics', },
    { '<leader>sf',        '<cmd>Telescope filetypes<cr>',                                                                                    mode = { 'n', 'v', }, silent = true, desc = 'Telescope filetypes', },
    { '<leader>sl',        '<cmd>Telescope live_grep<cr>',                                                                                    mode = { 'n', 'v', }, silent = true, desc = 'Telescope live_grep', },
    { '<leader>ss',        '<cmd>Telescope grep_string shorten_path=true word_match=-w only_sort_text=true search= grep_open_files=true<cr>', mode = { 'n', 'v', }, silent = true, desc = 'Telescope grep_string', },
    { '<leader>sz',        '<cmd>Telescope current_buffer_fuzzy_find<cr>',                                                                    mode = { 'n', 'v', }, silent = true, desc = 'Telescope current_buffer_fuzzy_find', },
    { '<leader>sq',        '<cmd>Telescope quickfix<cr>',                                                                                     mode = { 'n', 'v', }, silent = true, desc = 'Telescope quickfix', },
    { '<leader>svq',       '<cmd>Telescope quickfixhistory<cr>',                                                                              mode = { 'n', 'v', }, silent = true, desc = 'Telescope quickfixhistory', },
    { '<leader>sva',       '<cmd>Telescope builtin<cr>',                                                                                      mode = { 'n', 'v', }, silent = true, desc = 'Telescope builtin', },
    { '<leader>svc',       '<cmd>Telescope colorscheme<cr>',                                                                                  mode = { 'n', 'v', }, silent = true, desc = 'Telescope colorscheme', },
    { '<leader>svh',       '<cmd>Telescope help_tags<cr>',                                                                                    mode = { 'n', 'v', }, silent = true, desc = 'Telescope help_tags', },
    { '<leader>svvo',      '<cmd>Telescope vim_options<cr>',                                                                                  mode = { 'n', 'v', }, silent = true, desc = 'Telescope vim_options', },
    { '<leader>svvp',      '<cmd>Telescope planets<cr>',                                                                                      mode = { 'n', 'v', }, silent = true, desc = 'Telescope planets', },

    -- { '<leader>gf',         ':<c-u>Telescope git_files<cr>',                                                                                   mode = { 'n', 'v', }, silent = true, desc = 'Telescope git_files', },
    { '<leader>gc',        ':<c-u>Telescope git_commits<cr>',                                                                                 mode = { 'n', 'v', }, silent = true, desc = 'Telescope git_commits', },
    { '<leader>gb',        ':<c-u>Telescope git_bcommits<cr>',                                                                                mode = { 'n', 'v', }, silent = true, desc = 'Telescope git_bcommits', },
    { '<leader>gh',        ':<c-u>Telescope git_branches<cr>',                                                                                mode = { 'n', 'v', }, silent = true, desc = 'Telescope git_branches', },
    { '<leader>gj',        ':<c-u>Telescope git_status<cr>',                                                                                  mode = { 'n', 'v', }, silent = true, desc = 'Telescope git_status', },

    -- lsp

    { '<leader>fl',        ':<c-u>Telescope lsp_document_symbols<cr>',                                                                        mode = { 'n', 'v', }, silent = true, desc = 'Telescope lsp_document_symbols', },
    { '<leader>fr',        ':<c-u>Telescope lsp_references<cr>',                                                                              mode = { 'n', 'v', }, silent = true, desc = 'Telescope lsp_references', },

    -- file browser

    { '<leader>sa',        '<cmd>Telescope my_file_browser<cr>',                                                                              mode = { 'n', 'v', }, silent = true, desc = 'Telescope file_browser', },
    {
      '<leader>sva',
      function()
        vim.cmd(string.format('Telescope my_file_browser path=%s cwd_to_path=true', vim.fn.expand '%:h'))
      end,
      mode = { 'n', 'v', },
      silent = true,
      desc = 'Telescope file_browser',
    },

    -- config

    { '<leader>sO', function() require 'config.telescope'.open() end, mode = { 'n', 'v', }, silent = true, desc = 'Telescope config', },


  },
  dependencies = {
    require 'wait.plenary',
    require 'plugins.bqf',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
      build = 'mingw32-make',
    },
    {
      'nvim-telescope/telescope-frecency.nvim',
      dependencies = { 'kkharji/sqlite.lua', },
    },
    'nvim-telescope/telescope-file-browser.nvim',
  },
  config = function()
    require 'config.telescope'
  end,
}
