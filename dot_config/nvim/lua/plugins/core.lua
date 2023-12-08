return {
  "f-person/auto-dark-mode.nvim",
  config = {
    update_interval = 1000,
    set_dark_mode = function()
      vim.api.nvim_set_option("background", "dark")
      vim.cmd("colorscheme catppuccin-frappe")
    end,
    set_light_mode = function()
      vim.api.nvim_set_option("background", "light")
      vim.cmd("colorscheme catppuccin-latte")
    end,
  },
  {
    'alker0/chezmoi.vim',
    lazy = false,
    init = function()
      -- This option is required.
      vim.g['chezmoi#use_tmp_buffer'] = true
      -- add other options here if needed.
    end,
  },
}
