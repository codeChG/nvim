return {
  'AlexvZyl/nordic.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    local palette = require 'nordic.colors'
    require('nordic').setup {
      -- This callback can be used to override the colors used in the palette.
      on_palette = function(palette)
        return palette
      end,
      -- Enable bold keywords.
      bold_keywords = false,
      -- Enable italic comments.
      italic_comments = false,
      -- Enable general editor background transparency.
      transparent_bg = false,
      -- Enable brighter float border.
      bright_border = false,
      -- Reduce the overall amount of blue in the theme (diverges from base Nord).
      reduced_blue = true,
      -- Swap the dark background with the normal one.
      swap_backgrounds = false,
      -- Override the styling of any highlight group.
      override = {
        NvimTreeNormal = { bg = 'none' },
        -- NvimTreeFileName = { link = 'NvimTreeFolderIcon' },
      },
      -- Cursorline options.  Also includes visual/selection.
      cursorline = {
        -- Bold font in cursorline.
        bold = true,
        -- Bold cursorline number.
        bold_number = true,
        -- Available styles: 'dark', 'light'.
        theme = 'dark',
        -- Blending the cursorline bg with the buffer bg.
        blend = 0.22,
      },
      noice = {
        -- Available styles: `classic`, `flat`.
        style = 'flat',
      },
      telescope = {
        -- Available styles: `classic`, `flat`.
        style = 'flat',
      },
      leap = {
        -- Dims the backdrop when using leap.
        dim_backdrop = false,
      },
      ts_context = {
        -- Enables dark background for treesitter-context window
        dark_background = true,
      },
    }
    require('nordic').load()
  end,
}
