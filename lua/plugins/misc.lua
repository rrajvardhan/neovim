return {

  {
    'folke/zen-mode.nvim',
    opts = {
      window = {
        width = 0.65,
      },

      plugins = {
        options = {
          enabled = true,
          ruler = false, -- disables the ruler text in the cmd line area
          showcmd = true, -- disables the command in the last line of the screen
          -- you may turn on/off statusline in zen mode by setting 'laststatus'
          -- statusline will be shown only if 'laststatus' == 3
          laststatus = 0, -- turn off the statusline in zen mode
        },
      },
    },
  },
  {
    'ngtuonghy/live-server-nvim',
    event = 'VeryLazy',
    build = ':LiveServerInstall',
    config = function()
      require('live-server-nvim').setup {}
    end,
  },
  {
    'nvzone/typr',
    dependencies = 'nvzone/volt',
    opts = {},
    cmd = { 'Typr', 'TyprStats' },
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
  {
    'winston0410/range-highlight.nvim',
    event = { 'CmdlineEnter' },
    opts = {},
  },
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = true } },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      open_mapping = [[<C-\>]],
      direction = 'float',
      size = vim.o.columns * 0.36,
      hide_numbers = false,
      float_opts = {
        border = 'single',
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
    opts = {
      image_support = false,
    },
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
