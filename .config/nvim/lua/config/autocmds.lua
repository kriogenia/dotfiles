-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Use a different theme if it's the notes workspace

local default_theme = "catppuccin-mocha"

local function is_notes_dir(filepath)
  return filepath:match("/notes/.*.md$") ~= nil
end

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function(args)
    local filepath = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(args.buf), ":p")
    if is_notes_dir(filepath) then
      require("lazy").load({ plugins = { "tokyonight.nvim" } })
      vim.cmd("colorscheme tokyonight-night")
    end
  end,
})

vim.api.nvim_create_autocmd("BufLeave", {
  callback = function(args)
    local filepath = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(args.buf), ":p")
    if is_notes_dir(filepath) then
      vim.cmd("colorscheme " .. default_theme)
    end
  end,
})
