return {
  {
    "kepano/flexoki-neovim",
    name = "flexoki",
    priority = 1000,
    opts = function()
      local c = require("flexoki.palette").palette()
      return {
        highlight_groups = {
          SnacksNormal = { fg = c["tx-2"], bg = c["bg-2"] },
          SnacksNormalNC = { fg = c["tx-2"], bg = c["bg-2"] },
          SnacksWinBar = { fg = c["tx"], bg = c["bg-2"] },
          SnacksTitle = { fg = c["tx"], bg = c["bg-2"] },
          SnacksFooter = { fg = c["tx-2"], bg = c["bg-2"] },
          SnacksWinSeparator = { fg = c["bg-2"], bg = c["bg-2"] },
          SnacksPicker = { fg = c["tx-2"], bg = c["bg-2"] },
        },
      }
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "flexoki-dark",
    },
  },
}
