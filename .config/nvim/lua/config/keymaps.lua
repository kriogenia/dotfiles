-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Tab to cycle between, you know, tabs
vim.keymap.set("n", "<Tab>", ":bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<cr>", { desc = "Previous buffer" })

-- Don't copy overridden text
vim.keymap.set("x", "p", function()
  return 'pgv"' .. vim.v.register .. "y"
end, { remap = false, expr = true })
