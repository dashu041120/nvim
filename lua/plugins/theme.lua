-- Ayu Mirage Theme
return {
  {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    config = function()
      -- 设置 ayu 主题为 mirage
      vim.g.ayucolor = "mirage"
      -- 应用主题
      vim.cmd.colorscheme("ayu-mirage")
    end,
  },
}
