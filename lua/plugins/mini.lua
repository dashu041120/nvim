-- Mini.nvim 模块替换配置
return {
  {
    "nvim-mini/mini.nvim",
    version = false,
    config = function()
      require("mini.pairs").setup({
        modes = { insert = true, command = false, terminal = false },
      })

      require("mini.comment").setup({
        mappings = {
          comment = "gc",
          comment_line = "gcc",
          comment_visual = "gc",
          textobject = "gc",
        },
      })

      require("mini.indentscope").setup({
        symbol = "│",
        options = { try_as_border = true },
        draw = { delay = 50 },
      })

      require("mini.tabline").setup({
        show_icons = true,
      })

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

      local miniclue = require("mini.clue")
      miniclue.setup({
        triggers = {
          { mode = "n", keys = "<Leader>" },
          { mode = "x", keys = "<Leader>" },
          { mode = "n", keys = "g" },
          { mode = "x", keys = "g" },
          { mode = "n", keys = "'" },
          { mode = "n", keys = "`" },
          { mode = "n", keys = "\"" },
          { mode = "n", keys = "<C-w>" },
          { mode = "i", keys = "<C-x>" },
          { mode = "n", keys = "z" },
        },
        clues = {
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),
          -- Leader groups (mirror which-key groups)
          { mode = "n", keys = "<Leader><Tab>", desc = "tabs" },
          { mode = "n", keys = "<Leader>b", desc = "buffer" },
          { mode = "n", keys = "<Leader>c", desc = "code/cmake" },
          { mode = "n", keys = "<Leader>d", desc = "debug" },
          { mode = "n", keys = "<Leader>f", desc = "file/find" },
          { mode = "n", keys = "<Leader>g", desc = "git" },
          { mode = "n", keys = "<Leader>gh", desc = "hunks" },
          { mode = "n", keys = "<Leader>m", desc = "markdown" },
          { mode = "n", keys = "<Leader>n", desc = "notifications" },
          { mode = "n", keys = "<Leader>q", desc = "quit/session" },
          { mode = "n", keys = "<Leader>r", desc = "rust/replace/rayso" },
          { mode = "n", keys = "<Leader>s", desc = "search" },
          { mode = "n", keys = "<Leader>t", desc = "test/terminal" },
          { mode = "n", keys = "<Leader>u", desc = "ui" },
          { mode = "n", keys = "<Leader>v", desc = "venv" },
          { mode = "n", keys = "<Leader>w", desc = "windows" },
          { mode = "n", keys = "<Leader>x", desc = "diagnostics/quickfix" },
        },
        window = {
          delay = 200,
          config = {
            width = "auto",
          },
        },
      })
    end,
  },
}
