-- Customize Treesitter
-- --------------------
-- Treesitter customizations are handled with AstroCore
-- as nvim-treesitter simply provides a download utility for parsers

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    treesitter = {
      highlight = true, -- enable/disable treesitter based highlighting
      indent = true, -- enable/disable treesitter based indentation
      auto_install = true, -- enable/disable automatic installation of detected languages
      ensure_installed = {
        "lua",
        "vim",
        -- add more arguments for adding more treesitter parsers
        "lua",
        "vim",
        "bash",
        "comment",
        "cpp",
        "c",
        "css",
        "csv",
        "diff",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "go",
        "graphql",
        "helm",
        "html",
        "htmldjango",
        "http",
        "ini",
        "java",
        "javascript",
        "jinja",
        "jinja_inline",
        "json",
        "json5",
        "just",
        "mermaid",
        "nginx",
        "passwd",
        "python",
        "query",
        "regex",
        "rust",
        "sql",
        "ssh_config",
        "terraform",
        "toml",
        "typescript",
        "xml",
        "yaml",
      },
    },
  },
}
