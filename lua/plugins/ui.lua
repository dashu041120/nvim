-- UI 增强插件
return {
  -- indent-blankline - 彩虹色缩进参考线（已用 mini.indentscope 替换）
  --[[
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = function()
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }

      local hooks = require("ibl.hooks")
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      end)

      vim.g.rainbow_delimiters = { highlight = highlight }
      require("ibl").setup { scope = { highlight = highlight } }

      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
  },
  ]]

  -- cokeline - 缓冲区/标签栏（已用 mini.tabline 替换）
  --[[
  {
    "willothy/nvim-cokeline",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("cokeline").setup({
        default_hl = {
          fg = function(buffer)
            return buffer.is_focused and "#b8bb26" or "#928374"
          end,
          bg = function(buffer)
            return buffer.is_focused and "#3c3836" or "#282828"
          end,
        },
      })
    end,
  },
  ]]

  -- neoscroll - 平滑滚动（已用 mini.animate 替换）
  --[[
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
        hide_cursor = true,
        stop_eof = true,
        respect_scrolloff = false,
        cursor_scrolls_alone = true,
      })
    end,
  },
  ]]

  -- smear-cursor - 光标拖尾效果（已禁用，使用 mini.animate）
  --[[
  {
    "sphamba/smear-cursor.nvim",
    opts = {
      cursor_color = "#d3869b",
      normal_bg = "#282828",
      smear_between_buffers = true,
      smear_between_neighbor_lines = true,
      legacy_computing_symbols_support = false,
    },
  },
  ]]

  -- which-key - 快捷键提示（已用 mini.clue 替换）
  --[[
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
      spec = {
        -- 只定义 leader 键组，避免与内置键位冲突
        { "<leader><tab>", group = "tabs" },
        { "<leader>b", group = "buffer" },
        { "<leader>c", group = "code/cmake" },
        { "<leader>d", group = "debug" },
        { "<leader>f", group = "file/find" },
        { "<leader>g", group = "git" },
        { "<leader>gh", group = "hunks" },
        { "<leader>m", group = "markdown" },
        { "<leader>n", group = "notifications" },
        { "<leader>q", group = "quit/session" },
        { "<leader>r", group = "rust/replace/rayso" },
        { "<leader>s", group = "search" },
        { "<leader>t", group = "test/terminal" },
        { "<leader>u", group = "ui" },
        { "<leader>v", group = "venv" },
        { "<leader>w", group = "windows" },
        { "<leader>x", group = "diagnostics/quickfix" },
      },
    },
  },
  ]]

  -- todo-comments - TODO 注释高亮
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
      { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
      { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
    },
    opts = {},
  },

  -- nvim-lightbulb - LSP 代码提示灯泡
  {
    "kosayoda/nvim-lightbulb",
    opts = {
      autocmd = { enabled = true },
      sign = { enabled = true, text = "💡", hl = "LspDiagnosticsSignHint" },
      virtual_text = { enabled = true, text = "💡" },
    },
  },

  -- rainbow-delimiters - 给成对括号、花括号等添加不同的颜色
  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      -- 为 rainbow-delimiters 定义专用的高亮组（必须使用 RainbowDelimiter 前缀）
      vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#E06C75" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#D19A66" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#98C379" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#C678DD" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#56B6C2" })

      -- 配置 rainbow-delimiters
      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = "rainbow-delimiters.strategy.global",
          vim = "rainbow-delimiters.strategy.local",
        },
        query = {
          [""] = "rainbow-delimiters",
          c = "rainbow-delimiters",
          cpp = "rainbow-delimiters",
        },
      }
    end,
  },
}
