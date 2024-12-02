local HOME = os.getenv("HOME")
return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = {
    linters = {
      ["markdownlint-cli2"] = {
        args = { "--config", HOME .. "/dotfiles/lint/.markdownlint-cli2.yaml", "--" },
      },
    },
  },
}
