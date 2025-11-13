-- 格式化配置 - 使用 Tab 字符
return {
  {
    "stevearc/conform.nvim",
    opts = {
      -- 禁用自动保存时格式化
      -- format_on_save = false,
      
      formatters_by_ft = {
        -- Lua: 使用 stylua，已在 stylua.toml 中配置为 Tabs
        lua = { "stylua" },
        -- Python: 使用 ruff，配置为 Tab
        python = { "ruff_format" },
        -- Rust: rustfmt 默认使用项目的 rustfmt.toml
        rust = { "rustfmt" },
        -- C/C++: clang-format
        c = { "clang_format" },
        cpp = { "clang_format" },
        -- Go: gofmt 默认使用 Tab
        go = { "gofmt" },
      },
      formatters = {
        -- 配置 ruff 使用 Tab
        ruff_format = {
          prepend_args = { "--indent-style", "tab" },
        },
        -- 配置 clang-format: 内嵌样式配置，大括号在同一行
        clang_format = {
          prepend_args = {
            "--style={BasedOnStyle: Google, BreakBeforeBraces: Attach, IndentWidth: 4, TabWidth: 4, UseTab: ForIndentation, ColumnLimit: 100, PointerAlignment: Left, ReferenceAlignment: Left}"
          },
        },
      },
    },
  },
}
