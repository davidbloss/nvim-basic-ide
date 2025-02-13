-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

keymap("n", "<F1>", "<ESC>", opts)
keymap("n", "Y", "yy", opts)
keymap("n", "-", "ddp", opts)
keymap("n", "_", "ddkP", opts)

keymap("n", "<leader>T", "<cmd>16split <bar> botright terminal<CR>", opts)
-- keymap("n", "<leader>p", "\"_dp", opts)

keymap("n", "<leader>\"", "viw<ESC>a\"<ESC>bi\"<ESC>lel", opts)
keymap("n", "<leader>'", "viw<ESC>a'<ESC>bi'<ESC>lel", opts)
keymap("n", "<leader>[", "viw<ESC>a]<ESC>bi[<ESC>lel", opts)
keymap("n", "<leader>(", "viw<ESC>a)<ESC>bi(<ESC>lel", opts)
keymap("n", "<leader>{", "viw<ESC>a}<ESC>bi{<ESC>lel", opts)
keymap("n", "<leader><", "viw<ESC>a><ESC>bi<<ESC>lel", opts)

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "\\j", ":resize -2<CR>", opts)
keymap("n", "\\k", ":resize +2<CR>", opts)
keymap("n", "\\l", ":vertical resize -2<CR>", opts)
keymap("n", "\\h", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader><enter>", "<cmd>set hlsearch!<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
-- keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts) -- <leader>f from whichkey
-- keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts) -- <leader>F from whichkey
-- keymap("n", "<leader>fp", ":Telescope projects<CR>", opts) --  <leader>P from whichkey
-- keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts) -- <leader>b from whichkey

-- Git
keymap("n", "<leader>G", "<cmd>topleft Git<CR>", opts)

-- Comment
keymap("n", "<leader>/",
       "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<leader>/",
       '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
