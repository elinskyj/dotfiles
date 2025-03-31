return {
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      local gitsigns = require('gitsigns')
      gitsigns.setup({
        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
        current_line_blame = true,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 300,
          ignore_whitespace = false,
          virt_text_priority = 100,
          use_focus = true,
        },
      })
      vim.keymap.set('n', '<leader>gp', gitsigns.preview_hunk)
      vim.keymap.set('n', '<leader>gi', gitsigns.preview_hunk_inline)
      vim.keymap.set('n', '<leader>gb', gitsigns.toggle_current_line_blame)
      vim.keymap.set('n', '<leader>gd', gitsigns.toggle_deleted)
      vim.keymap.set('n', '<leader>gw', gitsigns.toggle_word_diff)
      vim.keymap.set('n', '<leader>gq', gitsigns.setqflist)
      vim.keymap.set('n', '<leader>gr', gitsigns.reset_hunk)
    end
  }
} 
