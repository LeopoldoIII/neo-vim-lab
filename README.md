# neo-vim-lab 🚀

A modular, high-performance, cross-platform Neovim IDE configuration written 100% in Lua. Designed to behave identically on both **macOS** and **Windows 11**, blending the ergonomics of **IntelliJ IDEA / PyCharm** with the speed and aesthetics of **VS Code**.

---

## ✨ Features

- **Cross-Platform OS Detection**: Automatic environment tailoring for macOS (Darwin) and Windows 11 (PowerShell UTF-8 normalization).
- **Modern Package Management**: Powered by [lazy.nvim](https://github.com/folke/lazy.nvim) with automatic bootstrapping.
- **Aesthetic Theme**: [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) with statusline ([lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)) and buffer tabs ([bufferline.nvim](https://github.com/akinsho/bufferline.nvim)).
- **Rich File Exploration**: Dual setup featuring [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) (visual tree) and [oil.nvim](https://github.com/stevearc/oil.nvim) (buffer file editing).
- **Fast Fuzzy Finding**: [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) for file names, live grep search, buffers, and help tags.
- **Syntax Highlighting**: [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) with auto-install for languages.
- **Complete LSP & Completion**: [mason.nvim](https://github.com/williamboman/mason.nvim), [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig), and [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) with VS Code-like icons via [lspkind.nvim](https://github.com/onsails/lspkind.nvim).
- **Git Gutter & Terminal**: [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) for diffs and [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) for floating terminals.
- **AI-Agent Ready**: Integrated Antigravity workspace rules (`.agents/rules/`) and skills (`.agents/skills/`) for effortless automated maintenance via `agy`.

---

## 📦 Prerequisites (One-Liner Installers)

Ensure you have a modern terminal (e.g. iTerm2 / Ghostty on macOS, Windows Terminal on Windows) with a [Nerd Font](https://www.nerdfonts.com/) installed (recommended: **JetBrainsMono Nerd Font**).

### macOS (Homebrew)
```bash
brew install neovim ripgrep fd git node

# Reload shell environment & variables (if needed)
source ~/.zshrc
```
> **Apple Silicon tip**: If brew was just installed, ensure it is in your path: `eval "$(/opt/homebrew/bin/brew shellenv)"`.

### Windows 11 (Winget - Run in PowerShell)
```powershell
winget install Neovim.Neovim BurntSushi.ripgrep.MSVC sharkdp.fd Git.Git OpenJS.NodeJS zig.zig

# Reload PATH variables in your active PowerShell session without restarting terminal:
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
```
> **Note for Windows**:
> - `zig` provides a lightweight, zero-configuration C compiler for Treesitter grammar builds.
> - You can also simply close and reopen Windows Terminal (or type `pwsh`) to reload environment variables.

---

## 🛠️ Installation (Best Practice: Direct Clone)

To avoid symlinks and allow direct edits, clone this repository directly into the standard Neovim configuration directory.

### On macOS / Linux
```bash
# 1. Backup existing config if needed
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null

# 2. Clone into standard configuration path
git clone https://github.com/LeopoldoIII/neo-vim-lab.git ~/.config/nvim

# 3. Reload shell environment & variables
source ~/.zshrc 2>/dev/null || true
type brew &>/dev/null && eval "$($(which brew) shellenv)"

# 4. Launch Neovim (lazy.nvim will install plugins automatically)
nvim
```

### On Windows 11 (PowerShell)
```powershell
# 1. Backup existing config if needed
Rename-Item -Path "$env:LOCALAPPDATA\nvim" -NewName "$env:LOCALAPPDATA\nvim.backup" -ErrorAction SilentlyContinue

# 2. Clone into standard configuration path
git clone https://github.com/LeopoldoIII/neo-vim-lab.git "$env:LOCALAPPDATA\nvim"

# 3. Reload environment variables in current session
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# 4. Launch Neovim
nvim
```

---

## 📂 Repository Structure

```text
neo-vim-lab/
├── init.lua                  # Entry point: OS detection, leader key, shell setup
├── lua/
│   ├── options.lua           # Editor options (relative numbers, indent, clipboard, undo)
│   ├── keymaps.lua           # Leader (<Space>) shortcuts and navigation
│   └── plugins.lua           # lazy.nvim spec & full modern IDE stack
├── .agents/
│   ├── rules/
│   │   ├── nvim-crossplatform.md # Agent guidelines for OS neutrality
│   │   └── repository-standards.md # English-only code and doc policy
│   └── skills/
│       └── neovim-config/
│           └── SKILL.md      # Procedural skill for adding LSPs and plugins
├── .gitattributes            # Enforce Unix LF line endings across platforms
├── .gitignore                # Ignore swap, backup, and local cache
├── AGENTS.md                 # Antigravity agent context entry point
└── README.md                 # Documentation and setup guide
```

---

## ⌨️ Essential Keybindings (`<Leader>` = `Space`)

### Navigation & Splits
| Keybinding | Action |
| :--- | :--- |
| `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` | Navigate between window splits |
| `<leader>sv` / `<leader>sh` | Vertical / Horizontal split |
| `<leader>sx` | Close current split |
| `<S-l>` / `<S-h>` | Next / Previous buffer tab |
| `<leader>bd` | Close current buffer tab |
| `<Esc>` | Clear search highlight |

### File Exploration & Search (Telescope)
| Keybinding | Action |
| :--- | :--- |
| `<leader>e` | Toggle Neo-tree file explorer |
| `<leader>-` | Open current directory with Oil |
| `<leader>ff` | Find files (Quick Open / Ctrl+P) |
| `<leader>fg` | Live grep (Search text project-wide) |
| `<leader>fb` | Find open buffers |
| `<leader>fh` | Neovim help tags |

### Code Intelligence & LSP (IntelliJ / VS Code style)
| Keybinding | Action |
| :--- | :--- |
| `gd` | Go to Definition |
| `gr` | Go to References |
| `K` | Hover documentation |
| `<leader>ca` | Code Actions / Quick Fix (Alt+Enter in IntelliJ) |
| `<leader>rn` | Rename symbol (Shift+F6 in IntelliJ / F2 in VS Code) |
| `<leader>d` | Show diagnostic popup at cursor |
| `[d` / `]d` | Previous / Next diagnostic error/warning |
| `<leader>cf` | Format document |

### Integrated Terminal & Tools
| Keybinding | Action |
| :--- | :--- |
| `<leader>tt` or `<C-\>` | Toggle floating terminal (ideal for `agy` or shell commands) |
| `<leader>th` | Toggle bottom horizontal terminal |

---

## 🤖 Updating & Customizing with Antigravity (`agy`)

Because this repository includes dedicated agent definitions (`AGENTS.md`) and skills:

1. Open your terminal in the configuration directory:
   - macOS: `cd ~/.config/nvim && agy`
   - Windows: `cd $env:LOCALAPPDATA\nvim; agy`
2. Simply request any modification in plain language:
   > *"Add Python support with the Pyright LSP and auto-format on save."*
3. `agy` modifies the files in-place and runs syntax checks.
4. When you open or reload Neovim, the changes take effect instantly.
5. Push to your Git repository to sync both macOS and Windows effortlessly.

---

## 🔄 Applying Updates & Reloading

### In the Terminal (Environment Variables)
- **macOS (Zsh)**: Run `source ~/.zshrc` or restart the terminal window.
- **Windows 11 (PowerShell)**:
  - Run `$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")` to refresh PATH without closing your session.
  - Or simply relaunch your shell: type `pwsh` (or reopen Windows Terminal).

### In Neovim (Config Changes)
- **Reload core options / keymaps**: `:source $MYVIMRC`
- **Sync plugins (Lazy.nvim)**: `:Lazy sync`
- **Update / Check LSP & Tooling (Mason)**: `:Mason`
- **Full Refresh**: Simply close and reopen `nvim` (recommended when modifying LSP servers or package specs).


