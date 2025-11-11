-- Precognition - 显示可用的 Vim 动作提示
return {
  {
    "tris203/precognition.nvim",
    event = "VeryLazy",
    opts = {
      -- 启动时自动启用
      startVisible = true,
      -- 显示提示的位置：virtual_line, gutter 或 both
      showBlankVirtLine = true,
      -- 高亮组配置
      highlightColor = { link = "Comment" },
      -- 提示符号
      hints = {
        Caret = { text = "^", prio = 2 },
        Dollar = { text = "$", prio = 1 },
        MatchingPair = { text = "%", prio = 5 },
        Zero = { text = "0", prio = 1 },
        w = { text = "w", prio = 10 },
        b = { text = "b", prio = 9 },
        e = { text = "e", prio = 8 },
        W = { text = "W", prio = 7 },
        B = { text = "B", prio = 6 },
        E = { text = "E", prio = 5 },
      },
      -- 禁用的文件类型
      gutterHints = {
        G = { text = "G", prio = 10 },
        gg = { text = "gg", prio = 9 },
        PrevParagraph = { text = "{", prio = 8 },
        NextParagraph = { text = "}", prio = 8 },
      },
      -- 禁用某些文件类型
      disabled_fts = {
        "startify",
        "neo-tree",
        "TelescopePrompt",
        "lazy",
        "mason",
        "dashboard",
        "alpha",
      },
    },
    keys = {
      { "<leader>up", "<cmd>lua require('precognition').toggle()<cr>", desc = "Toggle Precognition" },
    },
  },
}
