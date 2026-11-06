-- ==============================================================================
-- Core Editor Options (Cross-Platform)
-- ==============================================================================

local opt = vim.opt

-- ------------------------------------------------------------------------------
-- Line Numbers & Appearance
-- ------------------------------------------------------------------------------
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.termguicolors = true
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8

-- ------------------------------------------------------------------------------
-- Indentation & Tabs
-- ------------------------------------------------------------------------------
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- ------------------------------------------------------------------------------
-- Clipboard & Mouse
-- ------------------------------------------------------------------------------
-- Synchronize with system clipboard across macOS & Windows
opt.clipboard = "unnamedplus"
opt.mouse = "a"

-- ------------------------------------------------------------------------------
-- Search Behavior
-- ------------------------------------------------------------------------------
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- ------------------------------------------------------------------------------
-- Window Splits
-- ------------------------------------------------------------------------------
opt.splitbelow = true
opt.splitright = true

-- ------------------------------------------------------------------------------
-- Persistent Undo History
-- ------------------------------------------------------------------------------
local undo_dir = vim.fn.stdpath("state") .. "/undo"
if vim.fn.isdirectory(undo_dir) == 0 then
  vim.fn.mkdir(undo_dir, "p")
end
opt.undofile = true
opt.undodir = undo_dir

-- ------------------------------------------------------------------------------
-- Responsiveness & Timing
-- ------------------------------------------------------------------------------
opt.updatetime = 250
opt.timeoutlen = 300

-- Preserve swap and backup cleanliness
opt.swapfile = false
opt.backup = false
opt.writebackup = false

-- Encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
