return {
  "sylvanfranklin/omni-preview.nvim",
  opts = {},
  keys = {
    { "<leader>po", "<cmd>OmniPreview start<cr>", desc = "Omni Preview Start" },
    { "<leader>pc", "<cmd>OmniPreview close<cr>", desc = "Omni Preview Close" },
  },
  dependencies = {
    {
      "chomosuke/typst-preview.nvim",
      "iamcco/markdown-preview.nvim",
      lazy = true,
    },
  },
}
