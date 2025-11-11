-- GitHub Copilot 插件 (使用原生建议模式，不依赖补全引擎)
return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<M-l>",      -- Alt+l 接受建议
            accept_word = "<M-w>", -- Alt+w 接受一个词
            accept_line = "<M-j>", -- Alt+j 接受一行
            next = "<M-]>",        -- Alt+] 下一个建议
            prev = "<M-[>",        -- Alt+[ 上一个建议
            dismiss = "<C-]>",     -- Ctrl+] 关闭建议
          },
        },
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>",
          },
          layout = {
            position = "bottom",
            ratio = 0.4,
          },
        },
        filetypes = {
          yaml = true,
          markdown = true,
          help = false,
          gitcommit = true,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = "node",
        server_opts_overrides = {},
      })
    end,
  },
}
