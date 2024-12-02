local DOTFILES = os.getenv("dotfiles")
return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = {
    linters = {
      ["markdownlint-cli2"] = {
        args = { "--config", DOTFILES .. "/lint/.markdownlint-cli2.yaml", "--" },
      },
    },
  },
}
