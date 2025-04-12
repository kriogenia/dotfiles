return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
  keys = {
    { "<M-Left>", "<cmd>TmuxNavigateLeft<cr>", desc = "Move to left nvim/tmux pane" },
    { "<M-Down>", "<cmd>TmuxNavigateDown<cr>", desc = "Move to down nvim/tmux pane" },
    { "<M-Up>", "<cmd>TmuxNavigateUp<cr>", desc = "Move to up nvim/tmux pane" },
    { "<M-Right>", "<cmd>TmuxNavigateRight<cr>", desc = "Move to right nvim/tmux pane" },
    { "<M-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Move to previous nvim/tmux pane" },
  },
}
