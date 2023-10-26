return {
  {
    'nvim-lua/plenary.nvim',
    lazy = true,
  },
  {
    'dstein64/vim-startuptime',
    lazy = true,
  },
  {
    'nvim-tree/nvim-web-devicons',
    lazy = true,
  },
  {
    'navarasu/onedark.nvim',
    lazy = true,
  },
  {
    'dbakker/vim-projectroot',
    lazy = true,
  },
  {
    'peter-lyr/vim-bbye',
    lazy = true,
  },
  {
    name = 'options',
    dir = '',
    event = { 'VeryLazy', },
    lazy = false,
    config = function()
      require 'core.options'
    end,
  },
}
