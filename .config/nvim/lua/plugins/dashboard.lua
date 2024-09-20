return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
 ██╗  ██╗██████╗ ██╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
 ██║ ██╔╝██╔══██╗██║██╔═══██╗██║   ██║██║████╗ ████║
 █████╔╝ ██████╔╝██║██║   ██║██║   ██║██║██╔████╔██║
 ██╔═██╗ ██╔══██╗██║██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
 ██║  ██╗██║  ██║██║╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
 ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

                   	                [ @sotoestevez ]
      ]]
      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
      opts.theme = "doom"
    end,
  },
}
