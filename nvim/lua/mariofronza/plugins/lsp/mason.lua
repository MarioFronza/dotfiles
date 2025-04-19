return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "kotlin_language_server",
        "gopls",
        "pyright",
        "html",
        "cssls",
        "sqlls",
        "clangd",
        "lua_ls",
        "rust_analyzer",
        "elixirls",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        -- Formatters & Linters
        "prettier",      -- JS/TS/HTML/CSS
        "eslint_d",      -- JS/TS
        "black",         -- Python
        "flake8",        -- Python
        "stylua",        -- Lua
        "gofumpt",       -- Go
        "goimports",     -- Go
        "clang-format",  -- C/C++
        "sql-formatter", -- SQL
        "ktlint",        -- Kotlin
        "elixir-ls",     -- Elixir LSP also used for tools
      },
    })
  end,
}
