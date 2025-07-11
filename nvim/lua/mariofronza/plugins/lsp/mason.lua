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
    local lsp_config = require("lspconfig")

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
      automatic_installation = true,
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

    lsp_config.lua_ls.setup({
      settings = {
        Lua = {
          workspace = {
            userThirdParty = { os.getenv("HOME") .. ".local/share/LuaAddons" },
            checkThirdParty = "Apply"
          }
        }
      }
    })

    lsp_config.html.setup({})
  end,
}
