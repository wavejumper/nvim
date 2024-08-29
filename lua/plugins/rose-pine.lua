local M = { 
  "rose-pine/neovim",
  name = "rose-pine",
  config = function() 
    require("rose-pine").setup {
      styles = {
        bold = false,
        italic = false,
        transparency = false,
      },
    }
  end
}

return { M }
