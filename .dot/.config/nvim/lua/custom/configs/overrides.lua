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
    "svelte",
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
    "rust-analyzer",
    "codelldb",

    -- web dev
    "css-lsp",
    "html-lsp",
    "eslint",
    "typescript-language-server",
    "prettier",
    "svelte-language-server",
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
