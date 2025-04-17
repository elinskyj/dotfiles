-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- copilot completion
vim.keymap.set("i", "<C-L>", "<plug>(copilot-accept-word)")
vim.keymap.set("i", "<C-N>", "<plug>(copilot-next)")
vim.keymap.set("i", "<C-P>", "<plug>(copilot-previous)")
vim.keymap.set("i", "<C-E>", "<plug>(copilot-dismiss)")
