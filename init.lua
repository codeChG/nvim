require 'core.options' -- Load general options
require 'core.keymaps' -- Load general keymaps
require 'core.snippets' -- Custom code snippets

-- Funktion, um alle Colorschemes aus dem Ordner zu laden
local function load_colorschemes()
  local colorschemes_path = vim.fn.stdpath 'config' .. '/lua/plugins/colorschemes/'
  local colorschemes = {}

  -- Alle Lua-Dateien im Colorschemes-Ordner finden
  for _, file in ipairs(vim.fn.glob(colorschemes_path .. '*.lua', 0, 1)) do
    -- Extrahiere den Dateinamen ohne .lua und Ordner
    local scheme_name = file:match '.*/(.*)%.lua$'
    if scheme_name then
      -- Farben hinzufügen
      table.insert(colorschemes, { import = 'plugins.colorschemes.' .. scheme_name })
    end
  end

  return colorschemes
end
-- Set up the Lazy plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Set up plugins
require('lazy').setup {
  require 'plugins.colorschemes.nordic',
  -- require 'plugins.neotree',
  require 'plugins.bufferline',
  require 'plugins.lualine',
  require 'plugins.treesitter',
  require 'plugins.telescope',
  require 'plugins.lsp',
  require 'plugins.autocompletion',
  require 'plugins.gitsigns',
  require 'plugins.alpha',
  require 'plugins.indent-blankline',
  require 'plugins.misc',
  require 'plugins.comment',
  require 'plugins.conform',
  require 'plugins.nvim-lint',
  require 'plugins.rainbow-delimiters',
  require 'plugins.toogleterm',
  -- Dynamisch alle Colorschemes laden
  unpack(load_colorschemes()),
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
