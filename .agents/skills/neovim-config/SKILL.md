---
name: neovim-config
description: Workflows and best practices for configuring, extending, and maintaining this modular cross-platform Neovim repository.
---

# Neovim Configuration Skill

Use this skill when extending or modifying this Neovim setup.

## 1. Adding a New LSP Server
1. Open `lua/plugins.lua`.
2. Locate the `williamboman/mason-lspconfig.nvim` specification under `ensure_installed`.
3. Add the LSP name (e.g., `pyright`, `gopls`, `rust_analyzer`, `ts_ls`).
4. Under the `neovim/nvim-lspconfig` configuration function:
   ```lua
   lspconfig["<server_name>"].setup({
       capabilities = capabilities,
   })
   ```
5. Test using `nvim --headless "+qa"`.

## 2. Adding a New Plugin
1. Open `lua/plugins.lua`.
2. Add the plugin table into `lazy.setup({ ... })`:
   ```lua
   {
       "author/plugin-name",
       event = "VeryLazy", -- or appropriate event
       config = function()
           require("plugin-name").setup({ ... })
       end,
   },
   ```
3. If new keymaps are needed, define them cleanly in `lua/keymaps.lua` or inside the plugin's `keys` table.

## 3. Adding or Updating Keymaps
1. Open `lua/keymaps.lua`.
2. Use `map("n", "<leader>...", "<cmd>...<CR>", { desc = "Meaningful description" })`.
3. Ensure no keymap conflicts with existing IDE navigation bindings.

