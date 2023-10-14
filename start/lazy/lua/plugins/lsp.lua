return {
  'neovim/nvim-lspconfig',
  lazy = true,
  ft = {
    'c', 'cpp',
    'python',
    'md',
    'lua',
    'vim',
  },
  cmd = {
    'LspInfo', 'LspInstall', 'LspLog', 'LspRestart', 'LspStart', 'LspStop',
    'Mason',
  },
  dependencies = {
    require 'plugins.plenary',
    {
      'williamboman/mason.nvim',
      opts = {
        install_root_dir = vim.fn.expand '$VIMRUNTIME' .. '\\pack\\data\\mason',
      },
    },
    {
      'jay-babu/mason-null-ls.nvim',
      config = function()
        require 'mason-null-ls'.setup {
          ensure_installed = {
            'black', 'isort',        -- python
            'markdownlint',
            'prettier', 'prettierd', -- html
            'clang_format',          -- clang_format
          },
          automatic_installation = false,
        }
      end,
    },
    {
      'jose-elias-alvarez/null-ls.nvim',
      config = function()
        local nls = require 'null-ls'
        nls.setup {
          sources = {
            nls.builtins.formatting.black.with { extra_args = { '--fast', }, filetypes = { 'python', }, },
            nls.builtins.formatting.isort.with { extra_args = { '--profile', 'black', }, filetypes = { 'python', }, },
            nls.builtins.diagnostics.markdownlint.with { extra_args = { '-r', '~MD013', }, filetypes = { 'markdown', }, },
            nls.builtins.formatting.prettier.with {
              filetypes = { 'solidity', },
              timeout = 10000,
            },
            nls.builtins.formatting.prettierd.with {
              -- condition = function(utils)
              --   return not utils.root_has_file { ".eslintrc", ".eslintrc.js" }
              -- end,
              prefer_local = 'node_modules/.bin',
            },
            nls.builtins.formatting.clang_format.with {
              filetypes = {
                'c',
                'cpp',
                '*.h',
              },
              extra_args = {
                '--style',
                '{BasedOnStyle: llvm, IndentWidth: 4, SortIncludes: false, ColumnLimit: 200}',
              },
            },
          },
        }
      end,
    },
    {
      'williamboman/mason-lspconfig.nvim',
      opts = {
        ensure_installed = {
          'clangd',
          'pyright',
          'lua_ls',
          'marksman',
          'vimls',
        },
      },
    },
    require 'plugins.cmp',
    {
      'folke/neodev.nvim',
      config = function()
        require 'neodev'.setup()
      end,
    },
    {
      'smjonas/inc-rename.nvim',
      config = function()
        require 'inc_rename'.setup()
      end,
    },
  },
  keys = {
    { '<leader>fUl', function() require 'config.lsp'.update_lua_libraries() end,  mode = { 'n', 'v', }, silent = true, desc = 'lsp update_lua_libraries', },
    { '<leader>fUm', function() require 'config.lsp'.update_mason_cmd_path() end, mode = { 'n', 'v', }, silent = true, desc = 'lsp update_mason_cmd_path', },
    { '<leader>fW',  function() require 'config.lsp'.stop_all() end,              mode = { 'n', 'v', }, silent = true, desc = 'stop all lsp clients', },
    { '<leader>fp',  function() require 'config.lsp'.format_paragraph() end,      mode = { 'n', 'v', }, silent = true, desc = '=ap', },
    { '<leader>fn',  function() require 'config.lsp'.rename() end,                mode = { 'n', 'v', }, silent = true, desc = 'lsp rename IncRename', },
    { '<leader>ff',  function() require 'config.lsp'.format() end,                mode = { 'n', 'v', }, silent = true, desc = 'vim.lsp.buf.format', },
    { '<leader>fC',  function() require 'config.lsp'.format_input() end,          mode = { 'n', 'v', }, silent = true, desc = 'clang-format ...', },
    { '[f',          vim.diagnostic.open_float,                                   mode = { 'n', 'v', }, silent = true, desc = 'vim.diagnostic.open_float', },
    { ']f',          vim.diagnostic.setloclist,                                   mode = { 'n', 'v', }, silent = true, desc = 'vim.diagnostic.setloclist', },
    { '[d',          vim.diagnostic.goto_prev,                                    mode = { 'n', 'v', }, silent = true, desc = 'vim.diagnostic.goto_prev', },
    { ']d',          vim.diagnostic.goto_next,                                    mode = { 'n', 'v', }, silent = true, desc = 'vim.diagnostic.goto_next', },
    { '<leader>fq',  vim.diagnostic.enable,                                       mode = { 'n', 'v', }, silent = true, desc = 'vim.diagnostic.enable', },
    { '<leader>fvq', vim.diagnostic.disable,                                      mode = { 'n', 'v', }, silent = true, desc = 'vim.diagnostic.disable', },
    { 'K',           vim.lsp.buf.definition,                                      mode = { 'n', 'v', }, silent = true, desc = 'vim.lsp.buf.definition', },
    { '<leader>fo',  vim.lsp.buf.definition,                                      mode = { 'n', 'v', }, silent = true, desc = 'vim.lsp.buf.definition', },
    { '<F12>',       vim.lsp.buf.definition,                                      mode = { 'n', 'v', }, silent = true, desc = 'vim.lsp.buf.definition', },
    { '<leader>fd',  vim.lsp.buf.declaration,                                     mode = { 'n', 'v', }, silent = true, desc = 'vim.lsp.buf.declaration', },
    { '<C-F12>',     vim.lsp.buf.declaration,                                     mode = { 'n', 'v', }, silent = true, desc = 'vim.lsp.buf.declaration', },
    { '<leader>fh',  vim.lsp.buf.hover,                                           mode = { 'n', 'v', }, silent = true, desc = 'vim.lsp.buf.hover', },
    { '<A-F12>',     vim.lsp.buf.hover,                                           mode = { 'n', 'v', }, silent = true, desc = 'vim.lsp.buf.hover', },
    { '<leader>fi',  vim.lsp.buf.implementation,                                  mode = { 'n', 'v', }, silent = true, desc = 'vim.lsp.buf.implementation', },
    { '<leader>fs',  vim.lsp.buf.signature_help,                                  mode = { 'n', 'v', }, silent = true, desc = 'vim.lsp.buf.signature_help', },
    { '<leader>fe',  vim.lsp.buf.references,                                      mode = { 'n', 'v', }, silent = true, desc = 'vim.lsp.buf.references', },
    { '<S-F12>',     vim.lsp.buf.references,                                      mode = { 'n', 'v', }, silent = true, desc = 'vim.lsp.buf.references', },
    { '<leader>fvd', vim.lsp.buf.type_definition,                                 mode = { 'n', 'v', }, silent = true, desc = 'vim.lsp.buf.type_definition', },
    { '<leader>fc',  vim.lsp.buf.code_action,                                     mode = { 'n', 'v', }, silent = true, desc = 'vim.lsp.buf.code_action', },
    { '<leader>fS',  ':<c-u>LspStart<cr>',                                        mode = { 'n', 'v', }, silent = true, desc = 'LspStart', },
    { '<leader>fR',  ':<c-u>LspRestart<cr>',                                      mode = { 'n', 'v', }, silent = true, desc = 'LspRestart', },
    { '<leader>fD',  ':<c-u>call feedkeys(":LspStop ")<cr>',                      mode = { 'n', 'v', }, silent = true, desc = 'stop one lsp client of', },
    { '<leader>fF',  ':<c-u>LspInfo<cr>',                                         mode = { 'n', 'v', }, silent = true, desc = 'LspInfo', },
    { '<leader>fw',  ':<c-u>ClangdSwitchSourceHeader<cr>',                        mode = { 'n', 'v', }, silent = true, desc = 'ClangdSwitchSourceHeader', },
    { '<F11>',       ':<c-u>ClangdSwitchSourceHeader<cr>',                        mode = { 'n', 'v', }, silent = true, desc = 'ClangdSwitchSourceHeader', },
    { '<leader>fve', [[<cmd>%s/\s\+$//<cr>]],                                     mode = { 'n', 'v', }, silent = true, desc = 'erase bad white space', },


  },
  init = function()
    require 'config.whichkey'.add { ['<leader>f'] = { name = 'Lsp', }, }
    require 'config.whichkey'.add { ['<leader>fv'] = { name = 'Lsp more', }, }
    require 'config.whichkey'.add { ['<leader>fU'] = { name = 'Lsp Update', }, }
  end,
  config = function()
    require 'config.lsp'
  end,
}
