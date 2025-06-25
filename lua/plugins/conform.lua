return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = {}
        local lsp_format_opt
        if disable_filetypes[vim.bo[bufnr].filetype] then
          lsp_format_opt = 'never'
        else
          lsp_format_opt = 'fallback'
        end
        return {
          timeout_ms = 500,
          lsp_format = lsp_format_opt,
        }
      end,
      formatters = {
        rustfmt = {
          command = 'rustfmt',
        },
        my_formatter = {
          command = 'clang-format',
          args = { '--style=file' },
          stdin = true,
        },
        stylua = {
          prepend_args = { '--indent-width', '2' },
        },
        prettier = {
          prepend_args = {
            '--semi',
            'false', -- Disable semicolons
            '--use-tabs',
            'false', -- Use spaces instead of tabs
            '--tab-width',
            '2', -- Set indentation to 2 spaces
          },
        },

        asmfmt = {
          command = vim.fn.stdpath 'data' .. '/mason/bin/asmfmt',
          args = { '-w' }, -- Remove `-w`, let Conform.nvim handle file writing
          stdin = false, -- Ensure it operates on a file instead of stdin
        },
      },

      formatters_by_ft = {
        lua = { 'stylua' },
        cpp = { 'my_formatter' },
        c = { 'my_formatter' },
        html = { 'prettier' },
        xml = { 'prettier' },
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        css = { 'prettier' },
        json = { 'prettier' },
        python = { 'black' },
        asm = { 'asmfmt' },
      },
    },
  },
}
