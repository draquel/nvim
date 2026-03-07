return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "night",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent"
      },
      on_highlights = function(hl, c)
        -- 1. General Floating Windows
        hl.FloatBorder = { fg = c.border_highlight, bg = c.bg_float }
        hl.NormalFloat = { bg = c.bg_float }

        -- 2. Specifically for nvim-cmp (Completion Window)
        hl.Pmenu = { bg = c.bg_float }          -- The window background
        hl.PmenuSel = { bg = c.bg_visual }      -- The selection highlight
        
        -- 3. The specific CMP Border groups
        hl.CmpPmenuBorder = { fg = c.border_highlight, bg = c.bg_float }
        hl.CmpDocBorder = { fg = c.border_highlight, bg = c.bg_float }
      end,
    })
    vim.cmd([[colorscheme tokyonight]])
  end,
}
