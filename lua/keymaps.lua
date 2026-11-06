-- ==============================================================================
-- Keyboard Mappings (Leader: <Space>)
-- Clean, modern keymaps inspired by IntelliJ & VS Code ergonomics
-- ==============================================================================

local map = vim.keymap.set
local default_opts = { noremap = true, silent = true }

-- Clear search highlight on pressing Escape
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- ------------------------------------------------------------------------------
-- Window Navigation (Split navigation like IntelliJ / VS Code)
-- ------------------------------------------------------------------------------
map("n", "<C-h>", "<C-w>h", { desc = "Navigate to left split" })
map("n", "<C-j>", "<C-w>j", { desc = "Navigate to lower split" })
map("n", "<C-k>", "<C-w>k", { desc = "Navigate to upper split" })
map("n", "<C-l>", "<C-w>l", { desc = "Navigate to right split" })

-- Split creation
map("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Split window vertically" })
map("n", "<leader>sh", "<cmd>split<CR>", { desc = "Split window horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Window resizing
map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- ------------------------------------------------------------------------------
-- Buffer Navigation (Tabs / Open Files)
-- ------------------------------------------------------------------------------
map("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer tab" })
map("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer tab" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Close current buffer" })
map("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer" })

-- ------------------------------------------------------------------------------
-- Editing & Line Ergonomics
-- ------------------------------------------------------------------------------
-- Move lines up and down in visual mode (like Alt+Up/Down in VS Code)
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line(s) down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line(s) up" })

-- Better visual indenting (preserves selection)
map("v", "<", "<gv", { desc = "Indent left and keep selection" })
map("v", ">", ">gv", { desc = "Indent right and keep selection" })

-- Keep cursor centered during scrolling and search jumps
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
map("n", "n", "nzzzv", { desc = "Next search match and center" })
map("n", "N", "Nzzzv", { desc = "Previous search match and center" })

-- Quick Save
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR><Esc>", { desc = "Save file" })

-- ------------------------------------------------------------------------------
-- File Explorer Shortcuts
-- ------------------------------------------------------------------------------
map("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree file explorer" })
map("n", "<leader>-", "<cmd>Oil<CR>", { desc = "Open parent directory with Oil" })

-- ------------------------------------------------------------------------------
-- Telescope Fuzzy Finder
-- ------------------------------------------------------------------------------
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files (Search Files)" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep (Search text in project)" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find open buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Find help tags" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })

-- ------------------------------------------------------------------------------
-- Terminal Shortcuts (Run agy, powershell, or zsh)
-- ------------------------------------------------------------------------------
map("n", "<leader>tt", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle floating terminal" })
map("n", "<leader>th", "<cmd>ToggleTerm size=15 direction=horizontal<CR>", { desc = "Toggle horizontal terminal" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

