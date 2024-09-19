return {
  {
    'shaunsingh/nord.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- Example config in lua
      vim.g.nord_contrast = true
      vim.g.nord_borders = false
      vim.g.nord_disable_background = true
      vim.g.nord_italic = false
      vim.g.nord_uniform_diff_background = true
      vim.g.nord_bold = false

      -- Load the colorscheme
      -- require('nord').set()

      -- Toggle background transparency
      local bg_transparent = true

      local toggle_transparency = function()
        bg_transparent = not bg_transparent
        vim.g.nord_disable_background = bg_transparent
        vim.cmd [[colorscheme nord]]
      end

      vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
    end,
  },
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    -- priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      --   -- Load the colorscheme here.
      --   -- Like many other themes, this one has different styles, and you could load
      --   -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      --   vim.cmd.colorscheme 'tokyonight-night'
      --
      --   -- You can configure highlights by doing something like:
      --   vim.cmd.hi 'Comment gui=none'
    end,
  },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
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
        override = {},
        -- Cursorline options.  Also includes visual/selection.
        cursorline = {
          -- Bold font in cursorline.
          bold = true,
          -- Bold cursorline number.
          bold_number = true,
          -- Available styles: 'dark', 'light'.
          theme = 'dark',
          -- Blending the cursorline bg with the buffer bg.
          blend = 0.20,
        },
        noice = {
          -- Available styles: `classic`, `flat`.
          style = 'classic',
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
  },
}
