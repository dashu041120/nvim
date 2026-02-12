-- Git 相关插件
-- mini.diff 已在 mini.lua 中配置，负责 hunk 操作

return {
  -- Gitsigns - Git 状态指示器（已用 mini.diff 替换）

  {
    "lewis6991/gitsigns.nvim",
    enabled = false,
  },


  -- Diffview - Git diff 查看器（已用 mini.diff 替换）
  -- mini.diff 提供：
  -- - 可视化 diff hunks（sign 或 number 样式）
  -- - Hunk 操作：gh/gH（apply/reset，可用于 visual 和 operator）
  -- - Hunk 导航：[H/[h/]h/]H（第一个/上一个/下一个/最后一个）
  -- - Overlay 视图：MiniDiff.toggle_overlay() 查看详细 diff

  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
      { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
      { "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "File History" },
    },
  },


  -- Fugitive - Git 命令包装器
  -- 与 mini.diff 配合：
  -- - miniImpact.diff: 可视化和应用 hunks
  -- - Fugitive: 完整的 git 命令（status/commit/push/pull/log 等）
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse", "GRemove" },
    keys = {
      { "<leader>gs", "<cmd>Git<cr>", desc = "Git Status" },
      { "<leader>gc", "<cmd>Git commit<cr>", desc = "Git Commit" },
      { "<leader>gp", "<cmd>Git push<cr>", desc = "Git Push" },
      { "<leader>gl", "<cmd>Git pull<cr>", desc = "Git Pull" },
    },
  },
}
