return {
  {
    'athar-qadri/scratchpad.nvim',
    event = 'VeryLazy',

    opts = {},
    keys = {
      {
        '<Leader>es',
        function()
          local scratchpad = require 'scratchpad'
          scratchpad.ui:new_scratchpad()
        end,
        desc = 'open scratchpad',
      },
    },
  },
  {
    'nvzone/typr',
    dependencies = 'nvzone/volt',
    opts = {},
    cmd = { 'Typr', 'TyprStats' },
  },
  {
    'ThePrimeagen/vim-be-good',
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
  {
    'winston0410/cmd-parser.nvim',
    dependencies = { 'winston0410/range-highlight.nvim' },
    config = function()
      require('range-highlight').setup()
    end,
  },
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = true } },
  {
    'm4xshen/hardtime.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
    opts = {
      disable_mouse = false,
      max_count = 10,
      disabled_keys = {
        ['<Up>'] = { 'n', 'x' }, -- Disabled in normal & visual mode
        ['<Down>'] = { 'n', 'x' },
        ['<Left>'] = { 'n', 'x' },
        ['<Right>'] = { 'n', 'x' },
      },
    },
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      open_mapping = [[<C-\>]],
      direction = 'float',
      size = vim.o.columns * 0.36,
      hide_numbers = true,
      float_opts = {
        border = 'single',
        title_pos = 'right',
      },
    },
  },

  {
    '3rd/image.nvim',
    opts = {},
  },
  {
    'kawre/leetcode.nvim',
    build = ':TSUpdate html',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      -- "ibhagwan/fzf-lua",
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
    },
    opts = {},
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    opts = {
      code = {
        enabled = true,
        sign = false,
        style = 'full',
        position = 'left',
        highlight = 'RenderMarkdownCode',
        highlight_inline = 'RenderMarkdownCodeInline',
      },
    },
    config = function()
      vim.api.nvim_set_hl(0, 'RenderMarkdownCode', { bg = '#26213D', fg = 'NONE' }) -- Code blocks
      vim.api.nvim_set_hl(0, 'RenderMarkdownCodeInline', { bg = '#26213D', fg = 'NONE' }) -- Inline code
    end,
  },
}
