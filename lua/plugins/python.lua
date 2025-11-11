-- Python 相关插件
return {
  -- venv-selector - Python 虚拟环境选择器
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
    ft = "python",
    keys = {
      { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" },
      { "<leader>vc", "<cmd>VenvSelectCached<cr>", desc = "Select Cached VirtualEnv" },
    },
    config = function()
      require("venv-selector").setup()
    end,
  },

  -- Ruff - Python linter/formatter (通过 LSP)
  -- LazyVim 默认支持 ruff，这里只需要确保安装
}
