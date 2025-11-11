-- 终端和工具插件
return {
  -- toggleterm - 终端管理器
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
      { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float Terminal" },
      { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Horizontal Terminal" },
      { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Vertical Terminal" },
    },
    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<c-\>]],
      direction = "float",
      float_opts = {
        border = "curved",
      },
    },
  },

  -- telescope - 模糊查找器（LazyVim 默认包含，这里是增强配置）
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    keys = {
      { "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Projects" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
            },
          },
        },
      })
      telescope.load_extension("fzf")
      telescope.load_extension("projects")
    end,
  },

  -- markdown-preview - Markdown 预览
--   {
--     "iamcco/markdown-preview.nvim",
--     cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
--     ft = { "markdown" },
--     build = "cd app && npm install",
--     init = function()
--       vim.g.mkdp_filetypes = { "markdown" }
--     end,
--     keys = {
--       { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" },
--     },
--   },

  -- rayso - 代码截图
  {
    "TobinPalmer/rayso.nvim",
    cmd = { "Rayso" },
    keys = {
      { "<leader>rs", "<cmd>Rayso<cr>", mode = { "n", "v" }, desc = "Create code screenshot" },
    },
    config = function()
      require("rayso").setup({
        open_cmd = "firefox",
        options = {
          theme = "candy",
        },
      })
    end,
  },
}
