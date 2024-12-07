return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- Javascript // Typescript
        require("none-ls.diagnostics.eslint_d"),
        null_ls.builtins.formatting.prettier,

        -- Lua
        null_ls.builtins.formatting.stylua,

        -- Markdown
        null_ls.builtins.diagnostics.markdownlint_cli2,
        null_ls.builtins.formatting.cbfmt, -- This will format codeblocks in markdown files
        null_ls.builtins.formatting.mdformat,

        -- Ruby
        null_ls.builtins.diagnostics.rubocop,
        null_ls.builtins.formatting.rubocop,
      },
    })

    vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, {})
  end,
}
