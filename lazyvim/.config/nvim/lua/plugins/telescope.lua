return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", function()
        builtin.find_files({
          hidden = true,
          follow = true,
        })
      end, {})
      vim.keymap.set("n", "<leader>fg", function()
        builtin.live_grep({
          additional_args = { "--hidden", "--follow" },
        })
      end, { desc = "Live grep" })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
