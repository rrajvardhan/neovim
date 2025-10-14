return {
  {
    'sphamba/smear-cursor.nvim',
    opts = {
      cursor_color = '#d3cdc3',
      smear_insert_mode = false,
    },
  },
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      preset = 'modern',
      delay = 0,
      icons = {
        mappings = vim.g.have_nerd_font,
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },
      spec = {
        { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'auto',
          section_separators = { '', '' },
          component_separators = { '', '' },
          always_divide_middle = false,
        },
        sections = {
          lualine_a = {
            'mode',
            {
              function()
                local reg = vim.fn.reg_recording()
                return reg ~= '' and 'REC @' .. reg or ''
              end,
            },
          },
          lualine_b = {
            'branch',
            'diff',
            {
              'diagnostics',
              source = { 'nvim' },
              sections = { 'error' },
            },
            {
              'diagnostics',
              source = { 'nvim' },
              sections = { 'warn' },
            },
            {
              'diagnostics',
              source = { 'nvim' },
              sections = { 'hint' },
            },
          },
          lualine_c = {},
          lualine_x = {},
          lualine_y = { 'filename', 'filetype' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = { 'filename', 'filetype' },
          lualine_z = { 'location' },
        },
      }
    end,
  },
  {
    'utilyre/barbecue.nvim',
    name = 'barbecue',
    version = '*',
    dependencies = {
      'SmiteshP/nvim-navic',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {},
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',

    opts = {

      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },

      cmdline = {
        view = 'cmdline',
      },

      presets = {
        bottom_search = false,
        command_palette = false,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
    },

    dependencies = {
      'MunifTanjim/nui.nvim',
    },
  },
  {
    'andymass/vim-matchup',
    event = 'BufReadPre',
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = 'popup' }
      vim.cmd 'hi MatchParen guifg=NONE guibg=#3E4452 ctermfg=NONE ctermbg=8'
    end,
  },
}
