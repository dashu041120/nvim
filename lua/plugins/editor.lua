-- 编辑器功能增强插件
return {
  -- nvim-autopairs - 自动括号配对（已用 mini.pairs 替换）
  --[[
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,
        ts_config = {
          lua = { "string", "source" },
          javascript = { "string", "template_string" },
        },
        disable_filetype = { "TelescopePrompt", "vim" },
      })
    end,
  },
  ]]

  -- Comment.nvim - 快速注释（已用 mini.comment 替换）
  --[[
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n", desc = "Comment toggle current line" },
      { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n", desc = "Comment toggle current block" },
      { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
    },
    config = function()
      require("Comment").setup()
    end,
  },
  ]]

  -- auto-indent - 自动缩进（禁用，使用自定义缩进配置）
  {
    "vidocqh/auto-indent.nvim",
    enabled = false,
  },

  -- bim.nvim - 缓冲区改进
  {
    "sontungexpt/bim.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      prefix = "<leader>b",
    },
  },

  -- project.nvim - 项目管理
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        detection_methods = { "pattern", "lsp" },
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "Cargo.toml" },
      })
    end,
  },

  -- nvim-spectre - 全局查找替换
  {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
    config = function()
      require("spectre").setup()
    end,
  },
}
