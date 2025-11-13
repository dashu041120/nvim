# 📚 Neovim 配置速查手册

## 插件配置位置速查

| 功能 | 配置文件 |
|------|---------|
| LSP 服务器 | `lua/plugins/lsp.lua` |
| 代码补全 | `lua/plugins/completion.lua` |
| 代码格式化 | `lua/plugins/formatting.lua` |
| 调试框架 | `lua/plugins/debug.lua` |
| Git 集成 | `lua/plugins/git.lua` |
| 编辑器增强 | `lua/plugins/editor.lua` |
| 主题配置 | `lua/plugins/theme.lua` |
| UI 美化 | `lua/plugins/ui.lua` |
| 工具集合 | `lua/plugins/tools.lua` |
| Python 特定 | `lua/plugins/python.lua` |
| Rust 特定 | `lua/plugins/rust.lua` |
| C/C++ 特定 | `lua/plugins/cpp.lua` |
| 测试工具 | `lua/plugins/testing.lua` |
| Copilot | `lua/plugins/copilot.lua` |
| 快捷键 | `lua/config/keymaps.lua` |
| 编辑器选项 | `lua/config/options.lua` |
| 自动命令 | `lua/config/autocmds.lua` |

---

## 安装工具速查

### Python 工具
```bash
pip3 install pyright ruff python-lsp-server
```

### Node.js 工具
```bash
npm install -g prettier eslint typescript @typescript-eslint/eslint-plugin
```

### C/C++ 工具
```bash
# Ubuntu/Debian
sudo apt install clang clang-tools clangd cmake

# macOS
brew install llvm cmake

# 或使用 Mason
nvim +Mason  # 搜索 clangd
```

### Rust 工具
```bash
rustup component add rust-analyzer
```

### Go 工具
```bash
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
```

### Lua 工具
```bash
npm install -g stylua
```

---

## 快捷键速查

### 文件导航
| 快捷键 | 功能 |
|--------|------|
| `<leader>ff` | 查找文件 |
| `<leader>fg` | 搜索内容 |
| `<leader>e` | 文件浏览器 |
| `<leader>o` | 大纲符号 |
| `<leader>fb` | 查找缓冲区 |

### LSP 操作
| 快捷键 | 功能 |
|--------|------|
| `gd` | 转到定义 |
| `gr` | 转到引用 |
| `gi` | 转到实现 |
| `K` | 显示文档 |
| `<leader>ca` | 代码操作 |
| `<leader>cr` | 重命名 |

### 编辑操作
| 快捷键 | 功能 |
|--------|------|
| `gcc` | 注释行 |
| `gc` | 注释块 |
| `<leader>cf` | 格式化 |
| `<leader>sr` | 全局替换 |

### 调试操作
| 快捷键 | 功能 |
|--------|------|
| `<leader>db` | 断点 |
| `<leader>dc` | 继续 |
| `<leader>di` | 进入 |
| `<leader>do` | 跳过 |
| `<leader>du` | UI |

### Git 操作
| 快捷键 | 功能 |
|--------|------|
| `<leader>gd` | Diff |
| `<leader>gs` | 状态 |
| `<leader>gc` | 提交 |
| `<leader>gp` | 推送 |

---

## 命令速查

### Neovim 内部命令
```
:Mason              包管理器
:LspInfo            LSP 状态
:DapInfo            调试状态
:ConformInfo        格式化状态
:Lazy               插件管理
:Telescope          搜索界面
:Trouble            诊断窗口
:ToggleDiagnostics  切换诊断
```

### 编辑命令
```
:w                  保存
:q                  退出
:wq                 保存退出
:e <file>           打开文件
:%s/old/new/g       全文替换
```

### 缓冲区命令
```
:bd                 关闭缓冲区
:ba                 关闭所有
:bn                 下一个缓冲区
:bp                 上一个缓冲区
```

---

## 配置修改指南

### 添加新的 LSP 服务器

**文件**: `lua/plugins/lsp.lua`

```lua
servers = {
  -- ... 其他服务器
  
  typescript = {},          -- 简单配置
  
  pylsp = {                 -- 带选项的配置
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = { enabled = false }
        }
      }
    }
  },
}
```

### 添加新的格式化工具

**文件**: `lua/plugins/formatting.lua`

```lua
formatters_by_ft = {
  -- ... 其他类型
  
  javascript = { "prettier" },
  json = { "prettier" },
  markdown = { "prettier" },
}
```

### 添加自定义快捷键

**文件**: `lua/config/keymaps.lua`

```lua
local map = vim.keymap.set

-- 正常模式
map("n", "<leader>x", function()
  print("Hello!")
end, { desc = "Say hello" })

-- 插入模式
map("i", "<C-s>", "<Esc>:w<CR>", { desc = "Save from insert" })

-- 视觉模式
map("v", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
```

### 修改编辑器选项

**文件**: `lua/config/options.lua`

```lua
local opt = vim.opt

opt.tabstop = 8        -- 改变 Tab 宽度
opt.number = false     -- 隐藏行号
opt.wrap = true        -- 启用换行
opt.colorcolumn = "80" -- 显示 80 字符线
```

---

## 常见问题快速查询

### 问题 1: "LSP 无法启动"

**症状**: `:LspInfo` 显示 server: "X" not initialized  
**解决**:
1. 检查工具是否安装: `:Mason`
2. 检查日志: `:tail ~/.local/state/nvim/lsp.log`
3. 尝试重启: `:LspRestart`

### 问题 2: "代码补全很慢"

**症状**: 输入代码时 UI 卡顿  
**解决**:
1. 检查 LSP: `:LspInfo`
2. 禁用不需要的补全源
3. 编辑 `lua/plugins/completion.lua` 的 sources

### 问题 3: "格式化改变了我不想要的代码"

**症状**: `:w` 后代码被意外修改  
**解决**:
1. 检查配置: `:ConformInfo`
2. 在 `lua/config/options.lua` 中验证 `vim.g.autoformat = false`
3. 手动格式化而不是自动: `<leader>cf`

### 问题 4: "Telescope 找不到文件"

**症状**: `<leader>ff` 没有显示文件  
**解决**:
1. 确保在项目目录中
2. 检查 `.gitignore` 是否过滤了文件
3. 使用 `<leader>fg` 搜索内容而不是文件

### 问题 5: "调试器无法启动"

**症状**: `<leader>dc` 没有启动调试  
**解决**:
1. 安装调试适配器: `:Mason` → 搜索 debugpy 或 lldb
2. 检查断点: `<leader>db` 设置断点
3. 查看日志: 检查 DAP 输出

---

## 性能调优

### 检查启动时间
```bash
nvim --startuptime profile.log
tail -20 profile.log
```

### 禁用插件

在 `lua/plugins/*.lua` 中添加:
```lua
return {
  {
    "plugin/name",
    enabled = false,  -- 禁用此插件
  }
}
```

### 启用懒加载

```lua
{
  "plugin/name",
  event = "VeryLazy",           -- 延迟加载
  ft = "python",               -- 仅为 Python 文件加载
  cmd = { "Command" },         -- 仅当执行命令时加载
  keys = { "<leader>x" },      -- 仅当按下快捷键时加载
}
```

---

## 系统剪贴板快捷键

### 复制到系统剪贴板
```
"+y         复制选中内容
"+p         粘贴系统剪贴板内容
```

### 在 Neovim 中启用系统剪贴板
已在 `lua/config/options.lua` 中配置:
```lua
opt.clipboard = 'unnamedplus'
```

---

## 标签页和缓冲区管理

### 标签页操作
```
gt          下一个标签页
gT          上一个标签页
:tabnew     新建标签页
:tabc       关闭标签页
:tabo       只保留当前标签页
```

### 缓冲区操作
```
:bnext      下一个缓冲区
:bprev      上一个缓冲区
:bfirst     第一个缓冲区
:blast      最后一个缓冲区
:bdelete    删除缓冲区
```

---

## 搜索和替换

### 基础搜索
```
/pattern        向下搜索
?pattern        向上搜索
n               下一个匹配
N               上一个匹配
```

### 高级替换
```
:%s/old/new/g           全文替换
:%s/old/new/gc          全文替换（确认每个）
:1,10s/old/new/g        替换 1-10 行
```

### 使用 Spectre 全局替换
```
<leader>sr              打开 Spectre
:Spectre                手动打开
```

---

## 窗口和分割管理

### 分割操作
```
<C-w>s                  水平分割
<C-w>v                  垂直分割
<C-w>w                  切换窗口
<C-w>h/j/k/l            移动到相邻窗口
<C-w>=                  平衡窗口大小
```

### 窗口大小
```
<C-w>+                  增加高度
<C-w>-                  减少高度
<C-w>>                  增加宽度
<C-w><                  减少宽度
```

---

## Markdown 和文档

### Markdown 快捷键
```
gc                      插入代码块
gb                      插入粗体
gi                      插入斜体
```

### 代码块操作
```
]m                      下一个代码块
[m                      上一个代码块
```

---

## 有用的提示

1. **使用 `:source %` 重新加载配置**
   - 修改配置文件后，使用此命令立即应用更改

2. **使用 `:edit ~/.config/nvim/init.lua` 打开主配置**
   - 快速访问主配置文件

3. **使用 `:set verbose=1` 查看详细信息**
   - 调试时显示详细的 Neovim 操作

4. **使用 `:highlight` 查看所有高亮组**
   - 用于自定义主题

5. **使用 `:runtime! lua/plugins/*.lua` 重新加载插件**
   - 在开发插件时很有用

---

## 完整配置文件位置

- 主配置: `~/.config/nvim/init.lua`
- 所有配置: `~/.config/nvim/lua/`
- 插件缓存: `~/.local/state/nvim/`
- 日志文件: `~/.local/state/nvim/lsp.log`

---

**最后更新**: 2024-11-13  
**版本**: 1.0
