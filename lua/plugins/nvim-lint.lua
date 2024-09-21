return {
  'mfussenegger/nvim-lint',
  event = {
    'BufReadPre',
    'BufNewFile',
  },

  config = function()
    local lint = require 'lint'
    -- Konfiguriere Linter für verschiedene Dateitypen
    lint.linters_by_ft = {
      shell = { 'shellcheck' },
      python = { 'ruff' },
      javascript = { 'eslint' },
      c = { 'cpplint' },
      -- lua = { 'selene' },
      -- füge hier weitere Linter-Konfigurationen hinzu
    }
    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
    vim.keymap.set('n', '<leader>ll', function()
      lint.try_lint()
    end, { desc = 'Trigger linting for current file' })

    vim.api.nvim_create_user_command('LintToggle', function()
      local is_linting_enabled = vim.diagnostic.is_enabled()
      vim.diagnostic.enable(not is_linting_enabled)
    end, {})

    vim.keymap.set('n', '<leader>lt', function()
      vim.cmd 'LintToggle'
      print 'toggled linting.'
    end, { desc = 'Toggle linting for current file' })
  end,
}
