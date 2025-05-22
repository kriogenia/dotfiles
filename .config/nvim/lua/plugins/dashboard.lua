return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
 ██╗  ██╗██████╗ ██╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
 ██║ ██╔╝██╔══██╗██║██╔═══██╗██║   ██║██║████╗ ████║
 █████╔╝ ██████╔╝██║██║   ██║██║   ██║██║██╔████╔██║
 ██╔═██╗ ██╔══██╗██║██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
 ██║  ██╗██║  ██║██║╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
 ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

                   	                [ @sotoestevez ]
      ]],
        },
        sections = {
          { section = "header" },
          {
            pane = 2,
            icon = " ",
            desc = "Browse Repo",
            padding = 1,
            key = "b",
            action = function()
              Snacks.gitbrowse()
            end,
          },
          { section = "keys", gap = 1, padding = 1 },
          { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { section = "startup" },
        },
      },
    },
  },
}
