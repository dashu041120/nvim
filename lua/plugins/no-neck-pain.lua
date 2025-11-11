-- no-neck-pain.nvim - 自动居中显示
return {
  {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    opts = {
      -- 启用插件
      enabled = false,
      -- 宽度配置
      width = 100,
      -- 边距配置
      left = {
        enabled = true,
      },
      right = {
        enabled = true,
      },
      -- 上下居中配置
      top = {
        enabled = true,
        padding = vim.fn.winheight(0) / 4,  -- 上方填充高度
      },
      bottom = {
        enabled = true,
        padding = vim.fn.winheight(0) / 4,  -- 下方填充高度
      },
      -- 跳过某些文件类型
      buffers = {
        wo = {
          -- 窗口选项
        },
      },
      -- 集成配置
      integrations = {
        NvimTree = {
          open = false,
        },
        neo_tree = {
          open = false,
        },
        telescope = {
          open = false,
        },
      },
    },
    cmd = { "NoNeckPain" },
    keys = {
      { "<leader>uz", "<cmd>NoNeckPain<CR>", desc = "Toggle Zen Mode (No Neck Pain)" },
    },
  },
}
