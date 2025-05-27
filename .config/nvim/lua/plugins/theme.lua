return {
  {
    "catppuccin/nvim",
    opts = {
      transparent_background = true,
      custom_highlights = function(colors)
        return {
          rainbow1 = { fg = colors.sapphire },
          rainbow2 = { fg = colors.green },
          rainbow3 = { fg = colors.yellow },
          rainbow4 = { fg = colors.peach },
          rainbow5 = { fg = colors.maroon },
          rainbow6 = { fg = colors.mauve },
          RenderMarkdownH1Bg = { bold = true, bg = "" },
          RenderMarkdownH2Bg = { bold = true, bg = "" },
          RenderMarkdownH3Bg = { bold = true, bg = "" },
          RenderMarkdownH4Bg = { bold = true, bg = "" },
          RenderMarkdownH5Bg = { bold = true, bg = "" },
          RenderMarkdownH6Bg = { bold = true, bg = "" },
          ["@markup.quote.markdown"] = { bold = false, fg = colors.maroon },
        }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
