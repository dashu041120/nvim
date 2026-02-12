-- === mini.nvim: 轻量级插件集合 ===
-- 模块化配置各个 mini 子模块

return {
  {
    "nvim-mini/mini.nvim",
    version = false,
    config = function()
      -- ==================== 编辑操作 ====================
      -- mini.pairs - 自动括号配对
      require("mini.pairs").setup({
        modes = { insert = true, command = false, terminal = false },
      })

      -- mini.comment - 快速注释
      require("mini.comment").setup({
        mappings = {
          comment = "gc",
          comment_line = "gcc",
          comment_visual = "gc",
          textobject = "gc",
        },
      })

      -- ==================== UI 增强 ====================
      -- mini.indentscope - 缩进引导线与作用域指示
      require("mini.indentscope").setup({
        symbol = "│",
        options = { try_as_border = true },
        draw = { delay = 50 },
      })

      -- mini.tabline - 标签栏
      require("mini.tabline").setup({
        show_icons = true,
      })

      -- ==================== 文本对象扩展 ====================
      -- mini.ai - 创建和扩展 a/i 文本对象
      require("mini.ai").setup({
        custom_textobjects = nil,
        mappings = {
          around = "a",
          inside = "i",
          around_next = "an",
          inside_next = "in",
          around_last = "al",
          inside_last = "il",
          goto_left = "g[",
          goto_right = "g]",
        },
        n_lines = 50,
        search_method = "cover_or_next",
        silent = false,
      })

      -- ==================== Git 集成 ====================
      -- mini.git - Git 命令执行和历史查看
    --   require("mini.git").setup();

    --   -- mini.diff - Git diff 可视化和 hunk 操作
    --   require("mini.diff").setup();
    --   -- ==================== 选择器和交互工具 ====================
    --   -- mini.pick - 通用选择器（文件、缓冲区、帮助等）
    --   require("mini.pick").setup();
    --   require("mini.extra").setup()

      -- ==================== 平滑动画（带大文件保护） ====================
      --[[
      local function is_large_buffer()
        local buf = vim.api.nvim_get_current_buf()
        local line_count = vim.api.nvim_buf_line_count(buf)
        if line_count > 4000 then
          return true
        end

        local name = vim.api.nvim_buf_get_name(buf)
        if name == "" then
          return false
        end

        local ok, stat = pcall(vim.loop.fs_stat, name)
        return ok and stat and stat.size and stat.size > 1024 * 1024
      end

      local animate_group = vim.api.nvim_create_augroup("MiniAnimateLargeBuffer", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
        group = animate_group,
        callback = function()
          vim.b.minianimate_disable = is_large_buffer()
        end,
      })

      require("mini.animate").setup({
        cursor = { enable = true },
        open = { enable = true },
        close = { enable = true },
        resize = { enable = true },
        scroll = { enable = true },
      })
      ]]
    end,
  },
}
