local colors = require("catppuccin.palettes").get_palette("mocha")

local custom_theme = {
  normal = {
    a = { fg = colors.mantle, bg = colors.blue, gui = "bold" },
    b = { fg = colors.blue, bg = colors.mantle },
    c = { fg = colors.text },
  },

  insert = { a = { fg = colors.mantle, bg = colors.green, gui = "bold" } },
  visual = { a = { fg = colors.mantle, bg = colors.mauve, gui = "bold" } },
  replace = { a = { fg = colors.mantle, bg = colors.maroon, gui = "bold" } },

  inactive = {
    a = { fg = colors.text },
    b = { fg = colors.text },
    c = { fg = colors.text },
  },
}

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.theme = custom_theme
      opts.options.component_separators = "|"
      opts.options.section_separators = { left = "", right = "" }
      opts.sections.lualine_z = {}
    end,
  },
}
