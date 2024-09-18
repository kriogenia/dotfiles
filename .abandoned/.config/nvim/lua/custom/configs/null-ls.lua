local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

  b.diagnostics.todo_comments,
  b.diagnostics.trail_space,

  -- webdev stuff
  b.formatting.prettier.with {
    filetypes = {
      "javascript",
      "typescript",
      "css",
      "html",
      "json",
      "markdown",
      "yaml",
    },
  }, -- so prettier works only on these filetypes
  b.diagnostics.eslint,
  b.diagnostics.jsonlint,

  -- Sys
  b.formatting.stylua,
  b.diagnostics.shellcheck,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
