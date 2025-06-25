local dbAnim = require 'dashboardAnimation'

-- Play animation only on the snacks dashboard
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'snacks_dashboard',

  callback = function()
    dbAnim.shouldPlayAnimation = true
    dbAnim.asciiImg = dbAnim.frames[1]

    vim.defer_fn(function()
      dbAnim.theAnimation(dbAnim.theAnimation)
    end, 50)
  end,
})

-- Disable animation on directory change
vim.api.nvim_create_autocmd('DirChanged', {
  callback = function()
    dbAnim.shouldPlayAnimation = false
  end,
})

return {
  {
    'folke/snacks.nvim',
    init = function()
      vim.defer_fn(function()
        dbAnim.theAnimation(dbAnim.theAnimation)
      end, 100)
    end,

    opts = {
      image = { enabled = true },

      dashboard = {
        on_close = function()
          dbAnim.shouldPlayAnimation = false
        end,

        preset = {
          header = false,
          keys = {
            { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
            { icon = ' ', key = 'n', desc = 'New File', action = ':ene' },
            { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
            {
              icon = ' ',
              key = 'p',
              desc = 'Projects',
              action = function()
                Snacks.picker.projects {
                  sort = { fields = { 'time:asc', 'idx' } },
                  on_close = function()
                    dbAnim.shouldPlayAnimation = true
                  end,
                }
              end,
            },
            {
              icon = ' ',
              key = 'c',
              desc = 'Config',
              action = function()
                Snacks.dashboard.pick('files', {
                  cwd = vim.fn.stdpath 'config',
                  on_close = function()
                    dbAnim.shouldPlayAnimation = true
                  end,
                })
              end,
            },
            { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
            { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
          },
        },

        sections = {
          {
            section = 'header',
            padding = 1,
            function()
              return { header = dbAnim.asciiImg }
            end,
          },
          { icon = ' ', title = 'Keymaps', section = 'keys', indent = 2, padding = 1 },
          { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
        },
      },
    },
  },
}
