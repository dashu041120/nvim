#!/usr/bin/env markdown
# Neovim Cheatsheet (EN + 中文)

> 说明 / Notes
> - Leader key: `<leader>` = **Space** (LazyVim default). 领导键默认是空格。
> - Notation: `C` = Ctrl, `S` = Shift, `A`/`M` = Alt/Meta. 例如 `C-w` = Ctrl+w。
> - Modes: `n` Normal, `i` Insert, `v` Visual, `x` Visual-Block, `o` Operator-pending, `c` Command-line, `t` Terminal.
> - Local custom map: `jj` in Insert mode -> `Esc`.

---

## 1) Modes & Basics 模式与基础

### Mode switching 模式切换
- `i` / `a` / `o` — Insert / Append / Open line (插入/追加/新行)
- `I` / `A` / `O` — Insert/Append at line start/end / open above (行首/行尾/上方新行)
- `Esc` — back to Normal (回到普通模式)
- `v` / `V` / `C-v` — Visual (字符/行/块)
- `:` — Command-line mode (命令行)
- `R` — Replace mode (替换模式)
- `C-z` — Suspend (终端挂起)

### Help & discoverability 帮助与提示
- `:h {topic}` — Help (帮助), e.g. `:h motion`, `:h :substitute`
- `:h key-notation` — 键位表示说明
- `:map`, `:nmap`, `:imap` — 查看键位映射
- `:verbose nmap <key>` — 查找映射来源

---

## 2) Core Motions 核心移动

### Basic movement 基本移动
- `h j k l` — left/down/up/right (左/下/上/右)
- `w` / `b` / `e` — next/prev word / end of word (下一个/上一个单词/单词末尾)
- `W` / `B` / `E` — WORD motions (以空格分隔的大词)
- `0` / `^` / `$` — line start / first non-blank / line end (行首/首个非空/行尾)
- `gg` / `G` — file top / bottom (文件首/尾)
- `{` / `}` — prev/next paragraph (上/下段)
- `H` / `M` / `L` — top/middle/bottom of screen (屏幕上/中/下)
- `zz` / `zt` / `zb` — center/top/bottom current line (当前行居中/置顶/置底)

### Screen & scrolling 屏幕与滚动
- `C-f` / `C-b` — page down/up (整页下/上)
- `C-d` / `C-u` — half page down/up (半页下/上)
- `C-e` / `C-y` — scroll one line down/up (滚动一行)

### Find & till 单行内查找
- `f{char}` / `F{char}` — find char forward/back (向前/向后查找字符)
- `t{char}` / `T{char}` — till char forward/back (到字符前一位)
- `;` / `,` — repeat find forward/back (重复查找)

### Jumps & marks 跳转与标记
- `m{a-z}` — set mark (设置标记)
- `'a` — jump to line of mark (跳到标记行)
- `` `a `` — jump to exact mark position (跳到精确位置)
- `''` — jump back to previous line (回到上次位置)
- `C-o` / `C-i` — jump backward/forward (跳转历史后退/前进)
- `:jumps`, `:marks` — list jumps/marks (列出跳转/标记)

### Structure motions 结构化移动
- `%` — match pair (括号/关键字匹配)
- `[{` / `]}` — block start/end (块开始/结束)
- `[[` / `]]` — section start/end (节开始/结束)
- `(` / `)` — sentence backward/forward (句子)

---

## 3) Operators & Text Objects 操作符与文本对象

### Operators (combine with motion) 操作符 (搭配移动)
- `d{motion}` — delete (删除)
- `c{motion}` — change (删除并进入插入)
- `y{motion}` — yank (复制)
- `g~{motion}` — toggle case (切换大小写)
- `gu{motion}` / `gU{motion}` — lower/upper case (小写/大写)
- `>{motion}` / `<{motion}` — indent/outdent (缩进/反缩进)
- `={motion}` — auto-indent (自动缩进)

Examples 示例: `dw` 删除单词, `ci"` 改引号内, `yip` 复制段落。

### Text objects 文本对象 (inside/around)
- `iw` / `aw` — inner/around word (词内/词外)
- `iW` / `aW` — WORD (大词)
- `is` / `as` — sentence (句子)
- `ip` / `ap` — paragraph (段落)
- `i"` / `a"`, `i'` / `a'` — quotes (引号)
- `i(` / `a(`, `i[` / `a[`, `i{` / `a{` — brackets (括号)
- `it` / `at` — HTML/XML tag (标签)

---

## 4) Editing Essentials 编辑核心

### Insert/Replace 插入与替换
- `x` / `X` — delete char (前/后删字符)
- `r{char}` — replace single char (替换一个字符)
- `R` — replace mode (替换模式)
- `s` / `S` — substitute char/line (替换字符/整行)
- `J` / `gJ` — join lines with/without space (合并行)
- `p` / `P` — paste after/before (粘贴到后/前)
- `yy` / `dd` / `cc` — yank/delete/change line (整行复制/删除/修改)

### Insert mode edits 插入模式常用
- `C-h` — backspace (退格)
- `C-w` — delete previous word (删前一词)
- `C-u` — delete to line start (删到行首)
- `C-o` — execute one Normal command then return (临时执行普通命令)

### Undo/Redo/Repeat 撤销/重做/重复
- `u` — undo (撤销)
- `C-r` — redo (重做)
- `.` — repeat last change (重复上次修改)
- `g-` / `g+` — older/newer undo (撤销历史)

### Registers 剪贴板与寄存器
- `"+y` / `"+p` — system clipboard (系统剪贴板)
- `"0` — last yank (最近复制)
- `"1` — last delete (最近删除)
- `:reg` — list registers (寄存器列表)

### Visual mode 视觉模式
- `v` / `V` / `C-v` — char/line/block
- `o` — swap cursor/anchor (交换光标)
- `>` / `<` — indent/outdent selection (缩进)
- `y` / `d` / `c` — yank/delete/change selection (复制/删除/修改)

### Macros 宏
- `q{a-z}` — start/stop recording (录制/停止)
- `@a` — run macro (执行宏)
- `@@` — repeat last macro (重复宏)
- `:normal @a` — run macro over range (对选区/范围执行)

---

## 5) Search & Replace 搜索与替换

### Search 搜索
- `/pattern` — search forward (向下搜索)
- `?pattern` — search backward (向上搜索)
- `n` / `N` — next/prev match (下/上一个匹配)
- `*` / `#` — word under cursor forward/back (当前词向前/后)
- `g*` / `g#` — partial-word search (部分匹配)
- `:set hlsearch` / `:set nohlsearch` — highlight on/off (高亮开关)
- `:noh` — clear highlight (清除高亮)

### Substitute 替换
- `:s/old/new/` — current line (当前行)
- `:%s/old/new/g` — entire file (全文件)
- `:%s/old/new/gc` — confirm each (逐个确认)
- `:'<,'>s/old/new/g` — visual selection (选区)

### Advanced: global / vimgrep 高级
- `:g/pat/d` — delete matching lines (删匹配行)
- `:v/pat/d` — delete non-matching (删不匹配)
- `:g/pat/normal {cmd}` — run normal cmd on matches (对匹配行执行命令)
- `:vimgrep /pat/ **/*` — project search (全局搜索)
- `:copen` / `:cnext` / `:cprev` — quickfix (快速修复列表)

---

## 6) Files, Buffers, Windows, Tabs 文件/缓冲区/窗口/标签页

### Files 文件
- `:e {file}` — open file (打开文件)
- `:w` / `:q` / `:wq` / `:qa` — write/quit (保存/退出)
- `:r {file}` — read file into buffer (读入文件)
- `:r !{cmd}` — read command output (读入命令输出)
- `:w !{cmd}` — write buffer to command (写入命令)
- `:w {file}` — save as (另存为)

### Buffers 缓冲区
- `:ls` — list buffers (缓冲区列表)
- `:b {n|name}` — switch buffer (切换缓冲区)
- `:bn` / `:bp` — next/prev buffer (下/上一个)
- `:bd` / `:bdelete` — delete buffer (关闭缓冲区)
- `:bufdo {cmd}` — run cmd on all buffers (对所有缓冲区执行命令)

### Windows 分屏
- `C-w s` / `C-w v` — split horizontally/vertically (横/竖分屏)
- `C-w h/j/k/l` — move between splits (在分屏间移动)
- `C-w =` — equalize (均衡大小)
- `C-w +` / `C-w -` — height +/- (高度调整)
- `C-w >` / `C-w <` — width +/- (宽度调整)
- `C-w o` — close other windows (只保留当前)
- `C-w q` — close current window (关闭当前窗)

### Tabs 标签页
- `:tabnew` — new tab (新标签)
- `gt` / `gT` — next/prev tab (下/上一个标签)
- `:tabc` / `:tabo` — close tab / keep only current (关闭/只保留当前)
- `:tabm {n}` — move tab (移动标签)

---

## 7) Folding & Diff 折叠与 Diff

### Folding 折叠
- `zf{motion}` — create fold (创建折叠)
- `za` / `zo` / `zc` — toggle/open/close (切换/打开/关闭)
- `zR` / `zM` — open/close all folds (全部展开/折叠)
- `:set foldmethod=indent|syntax|expr` — fold method (折叠方式)

### Diff 基础
- `:diffthis` / `:diffoff` — start/stop diff (开始/停止 diff)
- `]c` / `[c` — next/prev diff hunk (下/上一个差异)
- `:diffupdate` — refresh (刷新)

---

## 8) Command-line & Ex Commands 命令行与 Ex

### Essentials 基础
- `:set {option}` / `:set no{option}` — toggle options (开关设置)
- `:setlocal` / `:setglobal` — local/global (局部/全局)
- `:!{cmd}` — run shell command (执行命令)
- `:cd {dir}` / `:pwd` — change/print dir (切换/显示目录)
- `:write ++ff=unix` — change fileformat (换行格式)

### Command-line editing 命令行编辑
- `C-r {register}` — insert register (插入寄存器)
- `C-f` — open command-line window (命令行窗口)
- `C-p` / `C-n` — previous/next command (历史命令)

### Advanced 专业常用
- `:argdo {cmd}` — run command over arglist (参数列表)
- `:bufdo {cmd}` — run command over buffers (缓冲区)
- `:windo {cmd}` / `:tabdo {cmd}` — run over windows/tabs (窗口/标签)
- `:helpgrep {pattern}` — search help (帮助搜索)

---

## 9) LazyVim Defaults (Common) LazyVim 默认常用

> 以下为 LazyVim 常见默认键位（如果你未覆盖默认值）。

### File & Search 文件与搜索
- `<leader>ff` — Find Files (查找文件)
- `<leader>fg` — Live Grep (内容搜索)
- `<leader>fb` — Buffers (缓冲区)
- `<leader>fr` — Recent files (最近文件)
- `<leader>fc` — Commands (命令)

### LSP (default) LSP 默认
- `gd` — Go to definition (定义)
- `gD` — Go to declaration (声明)
- `gi` — Go to implementation (实现)
- `gr` — References (引用)
- `K` — Hover docs (悬浮文档)
- `<leader>ca` — Code actions (代码操作)
- `<leader>cr` — Rename (重命名)
- `<leader>cf` — Format (格式化)

### Diagnostics 诊断
- `[d` / `]d` — Prev/Next diagnostic (上/下一个诊断)
- `<leader>xx` — Diagnostics list (Trouble)

---

## 10) Custom Plugin Keymaps (From This Config)

### Terminal: betterTerm.nvim
- `<C-/>` (n,t) — Toggle terminal (终端开关)
- `<C-PageUp>` (n,t) — Cycle terminal right (切换到右侧终端)
- `<C-PageDown>` (n,t) — Cycle terminal left (切换到左侧终端)
- `<leader>tt` — Select terminal (选择终端)
- `<leader>tr` — Rename terminal (重命名终端)
- `<leader>tb` — Toggle terminal tabs (切换终端标签)

### Telescope extras
- `<leader>fp` — Telescope Projects (`:Telescope projects`) (项目列表)
- `<leader>fP` — Find plugin file (Lazy root) (插件目录查找)
- Insert mode: `<C-j>` / `<C-k>` — move selection (上下移动)

### Global replace: nvim-spectre
- `<leader>sr` — Open Spectre (打开替换面板)
- `:Spectre` — Open Spectre (命令)

### Git: Diffview
- `<leader>gd` — `:DiffviewOpen` (打开 Diff 视图)
- `<leader>gD` — `:DiffviewClose` (关闭 Diff 视图)
- `<leader>gh` — `:DiffviewFileHistory` (文件历史)
- Commands: `:DiffviewOpen`, `:DiffviewClose`, `:DiffviewToggleFiles`, `:DiffviewFocusFiles` (命令)

### Git: vim-fugitive
- `<leader>gs` — `:Git` (status / 状态)
- `<leader>gc` — `:Git commit` (提交)
- `<leader>gp` — `:Git push` (推送)
- `<leader>gl` — `:Git pull` (拉取)
- Commands: `:Git`, `:G`, `:Gdiffsplit`, `:Gread`, `:Gwrite`, `:Ggrep`, `:GMove`, `:GDelete`, `:GBrowse`, `:GRemove` (命令)

### Debug: nvim-dap
- `<leader>db` — Toggle breakpoint (断点开关)
- `<leader>dc` — Continue (继续)
- `<leader>di` — Step into (步入)
- `<leader>do` — Step over (步过)
- `<leader>dO` — Step out (步出)
- `<leader>dr` — Toggle REPL (REPL 开关)
- `<leader>dl` — Run last (运行上次)
- `<leader>du` — Toggle DAP UI (调试 UI)
- `<leader>dt` — Terminate (终止)

### Tests: neotest
- `<leader>tt` — Run nearest test (运行最近测试)
- `<leader>tf` — Run file tests (运行文件测试)
- `<leader>ts` — Toggle summary (测试总览)
- `<leader>to` — Show output (enter) (查看输出)
- `<leader>tO` — Toggle output panel (输出面板)
- `<leader>tS` — Stop test (停止测试)
> Note: `<leader>tt` conflicts with betterTerm select. Choose one or remap. (键位冲突需二选一)

### Flash.nvim (jump/search)
- `s` (n/x/o) — Flash jump (快速跳转)
- `S` (n/x/o) — Flash Treesitter (语法树跳转)
- `r` (o) — Remote flash (远程跳转)
- `R` (o/x) — Treesitter search (语法树搜索)
- `<C-s>` (c) — Toggle Flash search (搜索开关)

### Yazi.nvim
- `<leader>-` — `:Yazi` (open at current file / 当前文件位置)
- `<leader>cw` — `:Yazi cwd` (open at cwd / 当前目录)
- `<leader>fy` — `:Yazi toggle` (resume last session / 恢复会话)
- Yazi inside: `<F1>` help, `<C-v>` split, `<C-x>` split, `<C-t>` tab, `<C-s>` grep, `<C-g>` replace (Yazi 内快捷键)
- Commands: `:Yazi`, `:Yazi cwd`, `:Yazi toggle` (命令)

### Copilot
- Insert suggestion (插入模式建议):
   - `<M-l>` accept (接受), `<M-w>` accept word (接受词), `<M-j>` accept line (接受行)
   - `<M-]>` / `<M-[>` next/prev suggestion (下/上一个建议)
   - `<C-]>` dismiss (关闭)
- Panel (面板):
   - `[[` / `]]` prev/next (上/下)
   - `<CR>` accept (接受), `gr` refresh (刷新), `<M-CR>` open (打开)
- Command: `:Copilot` (命令)

### Precognition
- `<leader>up` — Toggle Precognition (提示开关)

### No-Neck-Pain (Zen)
- `<leader>uz` — `:NoNeckPain` (专注模式)

### Todo-comments
- `]t` / `[t` — Next/Prev todo (下/上一个 TODO)
- `<leader>xt` — `:TodoTrouble` (Todo 列表)
- `<leader>xT` — `:TodoTrouble keywords=TODO,FIX,FIXME` (筛选)
- `<leader>st` — `:TodoTelescope` (Todo 搜索)
- `<leader>sT` — `:TodoTelescope keywords=TODO,FIX,FIXME` (筛选搜索)

### Rayso (code screenshot)
- `<leader>rs` — `:Rayso` (normal/visual, 代码截图)

### C/C++: cmake-tools.nvim
- `<leader>cg` — `:CMakeGenerate` (生成)
- `<leader>cb` — `:CMakeBuild` (构建)
- `<leader>cr` — `:CMakeRun` (运行)
- `<leader>cd` — `:CMakeDebug` (调试)
- `<leader>cs` — `:CMakeSelectBuildType` (构建类型)
- `<leader>ct` — `:CMakeSelectBuildTarget` (构建目标)

### Python: venv-selector
- `<leader>vs` — `:VenvSelect` (选择虚拟环境)
- `<leader>vc` — `:VenvSelectCached` (选择缓存环境)

### Rust: rustaceanvim
- `<leader>rr` — `:RustLsp runnables` (运行目标)
- `<leader>rd` — `:RustLsp debuggables` (调试目标)

### mini.nvim modules (enabled)
- mini.comment: `gc` (comment / 注释), `gcc` (comment line / 注释行)
- mini.ai: `a` / `i` textobjects with `an/in/al/il` variants (文本对象扩展)
- mini.pairs: auto pairs (自动补全括号)
- mini.indentscope: visual indent guide (缩进引导)
- mini.tabline: tabline (标签栏)

### Completion (blink.cmp)
- `<Tab>` — accept completion (接受补全)
- `<C-n>` / `<C-p>` — next/prev completion (下/上)
- `<CR>` — fallback (newline / 回车)

---

## 11) Core Commands (Useful) 常用命令

### Built-in 内置
- `:Lazy` — plugin manager (插件管理)
- `:Mason` — tooling manager (工具管理)
- `:LspInfo` — LSP status (LSP 状态)
- `:ConformInfo` — formatter status (格式化状态)
- `:DapInfo` — DAP status (调试状态)
- `:Telescope` — Telescope picker (搜索面板)

### Git & Diff
- `:DiffviewOpen` / `:DiffviewClose` / `:DiffviewFileHistory` (Diff)
- `:Git` / `:Gdiffsplit` / `:Gread` / `:Gwrite` (Git)

---

## 12) Config Locations 配置位置

| Area | File |
|------|------|
| Keymaps | `lua/config/keymaps.lua` |
| Options | `lua/config/options.lua` |
| LSP | `lua/plugins/lsp.lua` |
| Completion | `lua/plugins/completion.lua` |
| Formatting | `lua/plugins/formatting.lua` |
| Debug | `lua/plugins/debug.lua` |
| Git | `lua/plugins/git.lua` |
| UI | `lua/plugins/ui.lua` |
| Tools | `lua/plugins/tools.lua` |
| Python | `lua/plugins/python.lua` |
| Rust | `lua/plugins/rust.lua` |
| C/C++ | `lua/plugins/cpp.lua` |
| Testing | `lua/plugins/testing.lua` |
| Copilot | `lua/plugins/copilot.lua` |

---

## 13) Tips & Pro Workflows 专业技巧

- Use `.` to repeat edits (重复上次修改，效率神器).
- Combine text objects with operators: `ci"`, `da(`, `yip` (文本对象 + 操作符).
- Use `:copen` for search results (`vimgrep`) and diagnostics (快速修复列表).
- Use `:w !sudo tee %` for root-only files (sudo 写入).
- Use `:set paste` when pasting large blocks to avoid auto indent (防止粘贴错位).

---

## 14) Troubleshooting 排错速查

- LSP not working: `:LspInfo`, check Mason, then `:LspRestart` (LSP 排错).
- Formatting unexpected: `:ConformInfo`, check `vim.g.autoformat` (格式化排错).
- Telescope no results: ensure cwd, check `.gitignore`, try live grep (搜索排错).
- `:source %` — reload current config file (重载当前配置文件).
- `:edit ~/.config/nvim/init.lua` — open main config (打开主配置).
- `:set verbose=1` — verbose log (详细日志).
- `:highlight` — list highlight groups (查看高亮组).
- `:runtime! lua/plugins/*.lua` — reload plugins (重载插件).

---

## 完整配置文件位置

- 主配置: `~/.config/nvim/init.lua`
- 所有配置: `~/.config/nvim/lua/`
- 插件缓存: `~/.local/state/nvim/`
- 日志文件: `~/.local/state/nvim/lsp.log`

---

**最后更新**: 2024-11-13  
**版本**: 1.0
