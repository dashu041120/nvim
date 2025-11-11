-- Blink completion setup with LuaSnip
return {
  -- LuaSnip - 代码片段引擎
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  -- Blink.cmp 补全引擎
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "L3MON4D3/LuaSnip",
    },
    version = "*",
    opts = {
      -- Tab 补全、Enter 换行
      keymap = {
        preset = "default",
        ["<Tab>"] = { "accept", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<CR>"] = { "fallback" },
      },
      -- 补全源配置
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      -- 补全窗口配置
      completion = {
        menu = {
          border = "rounded",
          draw = {
            treesitter = { "lsp" },
            columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
          },
        },
        documentation = {
          auto_show = true,
          border = "rounded",
        },
      },
      -- 签名帮助
      signature = { enabled = true },
    },
  },

  -- 禁用 nvim-cmp（如果已安装）
  { "hrsh7th/nvim-cmp", enabled = false },
}
