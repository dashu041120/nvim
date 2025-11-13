# 🚀 Neovim 配置

基于 **LazyVim** 框架的现代化 Neovim 配置，支持多编程语言的 LSP、调试、补全、格式化等功能。

---

## 📋 目录

- [系统要求](#系统要求)
- [安装依赖](#安装依赖)
- [项目结构](#项目结构)
- [核心功能](#核心功能)
- [插件清单](#插件清单)
- [快捷键总览](#快捷键总览)
- [语言服务器配置](#语言服务器配置)
- [代码格式化](#代码格式化)
- [获取帮助](#获取帮助)
- [常见问题](#常见问题)

---

## 系统要求

- **Neovim**: 0.10+ （推荐最新版本）
- **Git**: 用于克隆和管理插件
- **Python**: 3.8+（用于部分 LSP 和 DAP）
- **Node.js**: 18+（用于 LSP 和格式化工具）
- **Rust**: 1.70+（用于 rust_analyzer，如需要）
- **C/C++ 工具链**: clang/gcc + cmake（用于 clangd）

### 检查依赖

```bash
# 检查 Neovim 版本
nvim --version

# 检查 Python
python3 --version

# 检查 Node.js
node --version

# 检查 Rust（可选）
rustc --version
cargo --version
```

---

## 安装依赖

### 1. **通用依赖**

```bash
# Ubuntu/Debian
sudo apt update
sudo apt install python3 python3-pip node npm git

# macOS
brew install python node git

# Arch Linux
sudo pacman -S python nodejs npm git
```

### 2. **Python 工具**

```bash
# 安装 Python LSP 和格式化工具
pip3 install python-lsp-server python-lsp-ruff ruff pyright

# 或者使用 conda（推荐）
conda install -c conda-forge python-lsp-server ruff pyright
```

### 3. **Node.js 工具**

```bash
# 全局安装常用工具
npm install -g prettier eslint @typescript-eslint/eslint-plugin @typescript-eslint/parser

# 或使用 pnpm（更快）
npm install -g pnpm
```

### 4. **Rust 工具**

```bash
# 安装 Rust（如需要）
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# 安装 rust-analyzer
rustup component add rust-analyzer
```

### 5. **C/C++ 工具**

```bash
# Ubuntu/Debian
sudo apt install clang clang-tools cmake

# macOS
brew install llvm cmake

# Arch Linux
sudo pacman -S clang cmake
```

### 6. **其他工具**

```bash
# Lua 格式化
npm install -g stylua

# Go 工具（如需要）
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
```

---

## 项目结构

```
~/.config/nvim/
├── init.lua                 # 主入口
├── lazy-lock.json           # 插件锁定版本
├── stylua.toml              # Lua 代码格式化配置
├── lua/
│   ├── config/
│   │   ├── options.lua      # 编辑器选项（缩进、搜索等）
│   │   ├── keymaps.lua      # 自定义快捷键
│   │   ├── autocmds.lua     # 自动命令
│   │   └── lazy.lua         # Lazy.nvim 配置
│   └── plugins/             # 插件配置
│       ├── lsp.lua          # LSP 语言服务器
│       ├── formatting.lua   # 代码格式化 (conform.nvim)
│       ├── completion.lua   # 代码补全 (Blink.cmp)
│       ├── debug.lua        # 调试 (nvim-dap)
│       ├── git.lua          # Git 集成
│       ├── editor.lua       # 编辑器增强
│       ├── theme.lua        # 主题配置
│       ├── ui.lua           # UI 增强
│       ├── tools.lua        # 工具插件
│       ├── testing.lua      # 测试框架
│       ├── cpp.lua          # C/C++ 相关
│       ├── python.lua       # Python 相关
│       ├── rust.lua         # Rust 相关
│       ├── copilot.lua      # GitHub Copilot
│       ├── precognition.lua # 动作预览
│       └── no-neck-pain.lua # 窗口布局优化
└── snippets/                # 代码片段
```

---

## 核心功能

### 🎯 代码补全

- **Blink.cmp**: 高性能代码补全引擎
- **LuaSnip**: 代码片段管理
- **LSP 集成**: 智能补全和符号识别

### 🔍 导航和搜索

- **Telescope**: 模糊搜索和文件管理
- **Spectre**: 全局查找和替换
- **project.nvim**: 项目快速切换
- **nvim-tree**: 文件浏览器

### 🐛 调试功能

- **nvim-dap**: Debug Adapter Protocol 支持
- **nvim-dap-ui**: 可视化调试界面
- **Language 特定调试**:
  - Python: nvim-dap-python
  - C/C++: clangd 扩展

### 📝 代码格式化

- **conform.nvim**: 统一的格式化接口
- 支持语言: Lua, Python, Rust, C/C++, Go 等
- **配置**: 禁用自动保存格式化（手动按快捷键格式化）

### 📚 语言服务器 (LSP)

- **Rust**: rust-analyzer
- **Python**: Pyright + ruff_lsp
- **C/C++**: clangd (带 clang-tidy)
- **Go**: gopls
- **汇编**: asm_lsp
- **Lua**: lua_ls

### 🎨 主题和 UI

- **Tokyo Night**: 高对比度主题
- **Lualine**: 状态栏
- **Bufferline**: 缓冲区标签
- **Treesitter**: 语法高亮和文本对象

### 📦 Git 集成

- **Gitsigns**: Git 状态指示器
- **Diffview**: Git diff 查看器
- **Fugitive**: Git 命令包装器
- **Telescope**: Git 历史搜索

### 📖 其他功能

- **Comment.nvim**: 快速注释/取消注释
- **nvim-autopairs**: 自动括号配对
- **Which-key**: 快捷键提示
- **Precognition**: 动作预览
- **Trouble**: 诊断信息窗口

---

## 插件清单

### 核心框架

| 插件      | 功能     | 版本   |
| --------- | -------- | ------ |
| LazyVim   | 配置框架 | Latest |
| lazy.nvim | 插件管理 | Latest |

### LSP 和补全

| 插件              | 功能       |
| ----------------- | ---------- |
| nvim-lspconfig    | LSP 配置   |
| blink.cmp         | 代码补全   |
| LuaSnip           | 代码片段   |
| friendly-snippets | 预设片段库 |

### 编辑器增强

| 插件           | 功能         |
| -------------- | ------------ |
| nvim-autopairs | 自动括号配对 |
| Comment.nvim   | 快速注释     |
| project.nvim   | 项目管理     |
| nvim-spectre   | 全局查找替换 |
| bim.nvim       | 缓冲区管理   |

### UI 和主题

| 插件            | 功能       |
| --------------- | ---------- |
| tokyonight.nvim | 主题       |
| lualine.nvim    | 状态栏     |
| bufferline.nvim | 缓冲区标签 |
| telescope.nvim  | 模糊搜索   |
| nvim-tree.lua   | 文件浏览器 |
| trouble.nvim    | 诊断浏览   |
| which-key.nvim  | 快捷键帮助 |

### 调试

| 插件                  | 功能         |
| --------------------- | ------------ |
| nvim-dap              | 调试协议     |
| nvim-dap-ui           | 调试 UI      |
| nvim-dap-python       | Python 调试  |
| nvim-dap-virtual-text | 变量内联显示 |
| clangd_extensions     | C/C++ 调试   |

### Git 集成

| 插件                 | 功能           |
| -------------------- | -------------- |
| gitsigns.nvim        | Git 指示器     |
| diffview.nvim        | Diff 查看器    |
| vim-fugitive         | Git 命令       |
| telescope-fzf-native | Telescope 优化 |

### 格式化

| 插件         | 功能           |
| ------------ | -------------- |
| conform.nvim | 统一格式化接口 |

### 其他

| 插件              | 功能           |
| ----------------- | -------------- |
| nvim-treesitter   | 语法解析和高亮 |
| nvim-markdown     | Markdown 预览  |
| copilot.lua       | GitHub Copilot |
| precognition.nvim | 动作预览       |
| no-neck-pain.nvim | 窗口布局优化   |

---

## 快捷键总览

### 🔑 基础快捷键

| 快捷键       | 功能                          | 模式   |
| ------------ | ----------------------------- | ------ |
| `jj`       | 返回 Normal 模式              | Insert |
| `<leader>` | Leader 键（默认 `<space>`） | -      |

### 📂 文件和缓冲区

| 快捷键         | 功能                |
| -------------- | ------------------- |
| `<leader>ff` | 查找文件            |
| `<leader>fg` | 查找内容            |
| `<leader>fb` | 查找缓冲区          |
| `<leader>fh` | 查找历史            |
| `<leader>e`  | 打开/关闭文件浏览器 |
| `<leader>o`  | 大纲（符号导航）    |
| `<leader>bc` | 关闭缓冲区          |
| `<leader>ba` | 关闭所有缓冲区      |
| `<leader>bl` | 缓冲区列表          |

### 🐛 调试

| 快捷键         | 功能             |
| -------------- | ---------------- |
| `<leader>db` | 切换/设置断点    |
| `<leader>dc` | 继续执行         |
| `<leader>di` | 单步进入         |
| `<leader>do` | 单步跳过         |
| `<leader>dO` | 单步跳出         |
| `<leader>dr` | 切换 REPL        |
| `<leader>dl` | 运行最后一个配置 |
| `<leader>du` | 切换调试 UI      |
| `<leader>dt` | 终止调试         |

### 📝 代码编辑

| 快捷键         | 功能                    |
| -------------- | ----------------------- |
| `gcc`        | 注释/取消注释当前行     |
| `gc`         | 注释/取消注释（行模式） |
| `gbc`        | 注释/取消注释当前块     |
| `gb`         | 注释/取消注释（块模式） |
| `<leader>cf` | 格式化代码              |
| `<leader>sr` | 全局查找替换（Spectre） |

### 🌳 LSP 操作

| 快捷键         | 功能         |
| -------------- | ------------ |
| `gd`         | 转到定义     |
| `gr`         | 转到引用     |
| `gi`         | 转到实现     |
| `gt`         | 转到类型定义 |
| `K`          | 显示文档     |
| `<leader>ca` | 代码操作     |
| `<leader>cr` | 重命名符号   |
| `<leader>cd` | 诊断浮窗     |
| `<leader>cl` | 行诊断       |

### 🔍 搜索和替换

| 快捷键 | 功能                 |
| ------ | -------------------- |
| `/`  | 向下搜索             |
| `?`  | 向上搜索             |
| `n`  | 下一个匹配           |
| `N`  | 上一个匹配           |
| `*`  | 搜索当前词（下一个） |
| `#`  | 搜索当前词（上一个） |

### 🎮 Git 操作

| 快捷键         | 功能          |
| -------------- | ------------- |
| `<leader>gd` | 打开 Diffview |
| `<leader>gD` | 关闭 Diffview |
| `<leader>gh` | 文件历史      |
| `<leader>gs` | Git 状态      |
| `<leader>gc` | Git 提交      |
| `<leader>gp` | Git 推送      |
| `<leader>gl` | Git 拉取      |

### 📊 窗口管理

| 快捷键         | 功能          |
| -------------- | ------------- |
| `<leader>ww` | 选择窗口      |
| `<leader>wd` | 删除窗口      |
| `<leader>w-` | 水平分割      |
| `<leader>w\|` | 垂直分割      |
| `<leader>w=` | 平衡窗口大小  |
| `<leader>wm` | 最大化/最小化 |

### 🔧 工具和设置

| 快捷键           | 功能                |
| ---------------- | ------------------- |
| `:ConformInfo` | 查看格式化信息      |
| `:LspInfo`     | 查看 LSP 信息       |
| `:Mason`       | 打开 Mason 包管理器 |
| `:Telescope`   | 打开 Telescope      |
| `:Trouble`     | 打开诊断窗口        |

---

## 语言服务器配置

### Rust

**配置文件**: `lua/plugins/lsp.lua`

```lua
rust_analyzer = {
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      checkOnSave = { command = "clippy" },
      procMacro = { enable = true },
    },
  },
}
```

**安装**:

```bash
rustup component add rust-analyzer
```

### Python

**配置文件**: `lua/plugins/lsp.lua`

```lua
pyright = {},
ruff_lsp = {},
```

**安装**:

```bash
pip3 install pyright ruff
```

### C/C++

**配置文件**: `lua/plugins/lsp.lua`

```lua
clangd = {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders=true",
  },
}
```

**安装**:

```bash
# Ubuntu/Debian
sudo apt install clangd

# macOS
brew install llvm

# 或使用 Mason
:Mason  # 然后搜索并安装 clangd
```

### Go

**配置文件**: `lua/plugins/lsp.lua`

```lua
gopls = {
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      staticcheck = true,
    },
  },
}
```

**安装**:

```bash
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
```

---

## 代码格式化

### 配置文件

**位置**: `lua/plugins/formatting.lua`

### 支持的语言和格式化工具

| 语言   | 工具         | 配置                        |
| ------ | ------------ | --------------------------- |
| Lua    | stylua       | 在 `stylua.toml` 中配置   |
| Python | ruff_format  | 使用 Tab 缩进               |
| Rust   | rustfmt      | 使用项目 rustfmt.toml       |
| C/C++  | clang-format | Google 风格 + Attach 大括号 |
| Go     | gofmt        | 使用 Tab                    |

### C++ 格式化样式

```
BasedOnStyle: Google
BreakBeforeBraces: Attach  # 大括号在同一行
IndentWidth: 4
TabWidth: 4
UseTab: ForIndentation     # 使用 Tab 缩进
ColumnLimit: 100
```

**示例**:

```cpp
int main() {     // ✓ 正确
	return 0;
}

int main()       // ✗ 不会这样格式化
{
	return 0;
}
```

### 手动格式化

```
<leader>cf  # 格式化当前缓冲区
```

### 禁用自动格式化

已在 `lua/config/options.lua` 中禁用:

```lua
vim.g.autoformat = false
```

---



## 获取帮助

### 内部帮助

```
:help <topic>
:help keymaps
:help options
```

### 查看日志

```
:messages              查看最近消息
:edit ~/.local/state/nvim/lsp.log     LSP 日志
```

---



## 常见问题

### Q: 如何安装新的 LSP 服务器？

**A**: 使用 Mason 包管理器:

```bash
nvim +Mason
```

或手动在 `lua/plugins/lsp.lua` 中添加服务器配置。

### Q: 代码补全不工作？

**A**:

1. 确保已安装相应的 LSP: `:Mason`
2. 检查 LSP 状态: `:LspInfo`
3. 查看日志: `:set verbose=1`

### Q: 如何添加自定义代码片段？

**A**:

1. 在 `snippets/` 目录创建文件
2. 使用 VSCode 或 TextMate 格式定义片段
3. 重启 Neovim

### Q: 调试器不工作？

**A**:

1. 确保已安装调试适配器: `:Mason`
2. 检查 DAP 配置: `:DapInfo`
3. 设置断点并开始调试

### Q: 如何修改快捷键？

**A**: 编辑 `lua/config/keymaps.lua`，添加自定义映射：

```lua
local map = vim.keymap.set
map("n", "<leader>x", "<cmd>YourCommand<cr>", { desc = "Your Description" })
```

### Q: 性能很慢？

**A**:

1. 检查加载的插件: `:Lazy`
2. 禁用不使用的功能
3. 使用 `:MasonLog` 和 `:LspLog` 检查错误
4. 考虑使用 `lazy.nvim` 的懒加载功能

### Q: 如何自定义主题？

**A**: 编辑 `lua/plugins/theme.lua`，修改主题或配置选项。

### Q: 与 LSP 冲突导致格式化问题？

**A**: 已在配置中使用 `lsp_format = "never"` 在 conform.nvim 中禁用 LSP 格式化。如需启用 LSP 格式化，修改：

```lua
default_format_opts = {
  lsp_format = "fallback",  -- LSP 作为备选
}
```

---

## 📚 有用的资源

- [Neovim 文档](https://neovim.io/doc/user/)
- [LazyVim](https://www.lazyvim.org/)
- [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [conform.nvim](https://github.com/stevearc/conform.nvim)
- [nvim-dap](https://github.com/mfussenegger/nvim-dap)

---

## 📝 更新日志

### v1.0 (2024-11-13)

- ✅ 初始配置完成
- ✅ 支持多语言 LSP
- ✅ 调试框架集成
- ✅ Git 集成
- ✅ 代码格式化
- ✅ 代码补全和片段

---

## 📄 许可证

MIT License

---

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

---

**最后更新**: 2024-11-13
**Neovim 版本**: 0.10+
**维护者**: dashu041120
