# Antigravity Agent Guidelines for `neo-vim-lab`

This repository is a modular, high-performance, cross-platform Neovim configuration written in Lua, running identically on macOS and Windows 11.

## Key Directives for Agents
1. **Language**: Write all code, comments, docstrings, documentation, and commits in **English** only.
2. **Architecture**:
   - `init.lua`: Core entry point, OS detection, leader keys, Windows PowerShell normalization.
   - `lua/options.lua`: Editor settings (numbers, indent, clipboard, undo, splits).
   - `lua/keymaps.lua`: Keyboard shortcuts mapped with `<Space>` leader.
   - `lua/plugins.lua`: Lazy.nvim plugin specifications and package management.
3. **Cross-Platform Safety**:
   - Windows 11 uses PowerShell / pwsh. Ensure shell commands and path handling work without breaking Windows.
   - Use `_G.IS_WINDOWS` and `_G.IS_MAC`.
4. **Validation**:
   - Run `nvim --headless "+qa"` after modifying configuration files to confirm that there are no syntax or startup errors.

