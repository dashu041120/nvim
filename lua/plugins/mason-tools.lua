-- Mason 工具安装配置
return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- Lua
        "stylua",
        
        -- Shell
        "shellcheck",
        "shfmt",
        
        -- Python
        "flake8",
        "black",
        
        -- Rust
        "rust-analyzer",

        -- C/C++
        "clangd",
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
  },
}
