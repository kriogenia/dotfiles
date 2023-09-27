local M = {}

M.treesitter = {
  ensure_installed = {
    -- sys
    "vim",
    "lua",
    "bash",
    "c",
    "markdown",
    "markdown_inline",
    -- rust
    "rust",
    "toml",
    -- web
    "html",
    "css",
    "javascript",
    "typescript",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua
    "lua-language-server",
    "stylua",

    -- rust
    "rust_analyzer",
    "codelldb",

    -- web dev
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "prettier",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
