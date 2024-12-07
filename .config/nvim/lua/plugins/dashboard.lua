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
            section = "terminal",
            cmd = "bsky tl -n 2",
            height = 5,
            padding = 1,
          },
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
          {
            pane = 2,
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function()
              return Snacks.git.get_root() ~= nil
            end,
            cmd = "hub status --short --branch --renames",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
          { section = "startup" },
        },
      },
    },
  },
}
