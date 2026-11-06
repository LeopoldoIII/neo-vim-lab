# Cross-Platform Neovim Guidelines

## OS Compatibility Guidelines
1. **Never Hardcode System Paths**:
   - Always use `vim.fn.stdpath("config")`, `vim.fn.stdpath("data")`, or `vim.fs.normalize()`.
   - Never use hardcoded paths like `/Users/...` or `C:\...`.
2. **Path Separators**:
   - Prefer Lua standard forward slashes `/` which Neovim internally normalizes on both Windows and macOS, or use `vim.fs.normalize()` when handing paths to external tools.
3. **Use Modern Neovim APIs**:
   - Use `vim.uv` instead of deprecated `vim.loop`.
   - Use `vim.keymap.set` instead of `vim.api.nvim_set_keymap`.
4. **Platform Flags**:
   - Rely on `_G.IS_WINDOWS` and `_G.IS_MAC` global flags set in `init.lua`.
5. **Headless Verification**:
   - Always test configuration changes using `nvim --headless "+qa"` to verify that syntax errors do not break startup.

