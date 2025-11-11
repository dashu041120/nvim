-- LSP 配置
return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      -- 全局禁用 LSP 进度通知
      local original_handler = vim.lsp.handlers["$/progress"]
      vim.lsp.handlers["$/progress"] = function() end
    end,
    opts = {
      -- 禁用所有 LSP 进度通知
      diagnostics = {
        virtual_text = true,
      },
      servers = {
        -- Rust
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
              },
              checkOnSave = {
                command = "clippy",
              },
              -- 禁用加载进度通知
              procMacro = {
                enable = true,
              },
            },
          },
          -- 禁用 LSP 进度通知
          handlers = {
            ["$/progress"] = function() end,
          },
        },
        
        -- Python
        pyright = {},
        ruff_lsp = {},
        
        -- C/C++
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          },
          init_options = {
            usePlaceholders = true,
            completeUnimported = true,
            clangdFileStatus = true,
          },
        },
        
        -- Go
        gopls = {
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
              },
              staticcheck = true,
            },
          },
        },
        
        -- Assembly
        asm_lsp = {},
      },
    },
  },
}
