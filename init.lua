-- ==============================================================================
-- Modular Neovim Entry Point (Cross-Platform: macOS & Windows 11)
-- ==============================================================================

-- Define leader key before loading plugins or keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ------------------------------------------------------------------------------
-- Operating System Detection
-- ------------------------------------------------------------------------------
local uv = vim.uv or vim.loop
local sysname = uv.os_uname().sysname

_G.IS_WINDOWS = sysname:find("Windows") ~= nil
_G.IS_MAC = sysname == "Darwin"
_G.IS_LINUX = sysname == "Linux"

-- ------------------------------------------------------------------------------
-- Windows-Specific Shell & UTF-8 Configuration
-- ------------------------------------------------------------------------------
if _G.IS_WINDOWS then
  -- Prefer PowerShell Core (pwsh), fallback to Windows PowerShell
  local powershell = vim.fn.executable("pwsh") == 1 and "pwsh"
    or (vim.fn.executable("powershell") == 1 and "powershell" or nil)

  if powershell then
    vim.opt.shell = powershell
    vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';"
    vim.opt.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    vim.opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    vim.opt.shellquote = ""
    vim.opt.shellxquote = ""
  end
end

-- ------------------------------------------------------------------------------
-- Load Core Modules
-- ------------------------------------------------------------------------------
require("options")
require("keymaps")
require("plugins")
