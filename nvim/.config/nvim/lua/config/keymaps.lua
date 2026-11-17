-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Atalhos estilo VSCode
local map = vim.keymap.set
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Salvar" })
map("n", "<C-b>", "<cmd>Neotree toggle<cr>", { desc = "Explorador de arquivos" })
map("n", "<C-p>", function() LazyVim.pick("files")() end, { desc = "Buscar arquivo" })
map("n", "<C-S-f>", function() LazyVim.pick("live_grep")() end, { desc = "Buscar no projeto" })
map({ "n", "t" }, "<C-'>", function() Snacks.terminal() end, { desc = "Terminal" })
map("n", "<C-/>", "gcc", { remap = true, desc = "Comentar linha" })
map("v", "<C-/>", "gc", { remap = true, desc = "Comentar seleção" })
map("n", "<A-Up>", "<cmd>m .-2<cr>==", { desc = "Mover linha p/ cima" })
map("n", "<A-Down>", "<cmd>m .+1<cr>==", { desc = "Mover linha p/ baixo" })
map("n", "<F2>", vim.lsp.buf.rename, { desc = "Renomear símbolo" })
map("n", "<F12>", vim.lsp.buf.definition, { desc = "Ir para definição" })
map("n", "<C-.>", vim.lsp.buf.code_action, { desc = "Quick fix" })
map("n", "<F5>", function() require("dap").continue() end, { desc = "Debug: iniciar/continuar" })
map("n", "<F9>", function() require("dap").toggle_breakpoint() end, { desc = "Breakpoint" })
map("n", "<F10>", function() require("dap").step_over() end, { desc = "Debug: step over" })
map("n", "<F11>", function() require("dap").step_into() end, { desc = "Debug: step into" })
map("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Próxima aba" })
map("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Aba anterior" })
