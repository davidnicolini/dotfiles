return {
  -- Tema igual ao VSCode Dark+
  {
    "Mofiqul/vscode.nvim",
    priority = 1000,
    opts = { style = "dark", italic_comments = true },
  },
  { "LazyVim/LazyVim", opts = { colorscheme = "vscode" } },

  -- HTML/CSS: LSPs e auto-fechar tags
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        html = {},
        cssls = {},
        emmet_language_server = {},
      },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    event = "LazyFile",
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "html", "css", "scss", "javascript", "typescript", "tsx", "c", "cpp", "c_sharp", "java" } },
  },
}
