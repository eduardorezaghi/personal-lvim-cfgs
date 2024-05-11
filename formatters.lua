-- Extracted from:
-- https://www.lunarvim.org/docs/configuration/language-features/linting-and-formatting/

local formatters = require "lvim.lsp.null-ls.formatters"
local linters = require "lvim.lsp.null-ls.linters"

local code_actions = require "lvim.lsp.null-ls.code_actions"
-- Formatters
formatters.setup {
  { name = "black" },
  {
    name = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespace
    -- options such as `--line-width 80` become either `{"--line-width", "80"}` or `{"--line-width=80"}`
    args = { "--print-width", "100" },
    ---@usage only start in these filetypes, by default it will attach to all filetypes it supports
    filetypes = { "typescript", "typescriptreact" },
  },
  -- lua
  {
    name = "stylua",
    args = { "--indent-type", "Spaces", "--indent-width", 2, "--columns", 120 },
    filetypes = { "lua" },
  },
}

-- Linters
linters.setup {
  { name = "flake8" },
  { name = "shellcheck", args = { "--severity", "warning" }, },
  { name = "selene",     filetypes = { "lua" } },
}

code_actions.setup {
  {
    name = "proselint",
  },
}
