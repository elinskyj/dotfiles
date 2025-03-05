return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set('n', '<C-n>', ':Neotree filesystem toggle left<CR>', {})

    -- Function to toggle NeoTree and focus on the file if one is opened
    local function open_neotree()
      vim.cmd(":Neotree filesystem toggle left")
      vim.cmd("wincmd p")
    end

    if vim.fn.argc() == 0 then
      vim.cmd(":Neotree filesystem toggle left")
    else
      vim.defer_fn(open_neotree, 50)
    end
  end
}
