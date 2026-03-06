-- NeoVim Properties
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { import = "plugins" }
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "tokyonight" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
  -- Disable runtime path reset
  performance = {
    rtp = {
      reset = false,
    }
  }
})


vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
    spacing = 4,
  },
  signs = true,
  underline = true,
  update_in_insert = false, -- Only show when you leave Insert mode (cleaner)
  severity_sort = true,
})

--Override theme border colors
-- Add this to the bottom of your init.lua
vim.api.nvim_set_hl(0, "CmpNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpPmenu", { bg = "NONE" })
-- Force a visible color for the borders
vim.api.nvim_set_hl(0, "CmpPmenuBorder", { fg = "#569cd6", bg = "NONE" })
vim.api.nvim_set_hl(0, "CmpDocBorder", { fg = "#569cd6", bg = "NONE" })

