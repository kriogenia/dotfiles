-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

vim.keymap.set("n", "<Tab>", ":bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<cr>", { desc = "Previous buffer" })

vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume" }
)
