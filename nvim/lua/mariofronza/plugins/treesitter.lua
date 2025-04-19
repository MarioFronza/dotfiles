return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
    "nvim-treesitter/nvim-treesitter-context",
    "nvim-treesitter/playground",
    "HiPhish/rainbow-delimiters.nvim",
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    local config = {
      modules = {},
      sync_install = false,
      auto_install = true,
      ignore_install = {},
      parser_install_dir = nil,
      ensure_installed = {
        "json", "yaml", "html", "css", "markdown", "markdown_inline",
        "graphql", "bash", "lua", "vim", "dockerfile", "gitignore",
        "vimdoc", "java", "go", "kotlin", "javascript", "typescript",
        "python", "sql", "c", "cpp", "rust", "elixir",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      autotag = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    }

    treesitter.setup(config)
  end,
}
