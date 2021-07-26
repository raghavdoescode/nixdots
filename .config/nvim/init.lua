require("keymappings")
require("plugins")
require("settings")
require("treesitter")
require("nvimtree")
require("compe-config")
require("lsp")
require("telescope-config")
require("lspkind-settings")

require('nvim-autopairs').setup()

require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  }
}

vim.cmd("source ~/.config/nvim/terminal.vim")
vim.cmd("source ~/.config/nvim/fix.vim")
vim.cmd("filetype plugin indent on")
vim.cmd("autocmd BufWritePre *.js Neoformat prettier")
vim.cmd("autocmd BufWritePre *.ts Neoformat prettier")
vim.cmd("autocmd BufWritePre *.jsx Neoformat prettier")
vim.cmd("autocmd BufWritePre *.tsx Neoformat prettier")
vim.cmd("autocmd BufWritePre *.py Neoformat autopep8")
vim.cmd("autocmd BufWritePre *.rs Neoformat rustfmt")

vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
vim.g.tokyonight_dark_sidebar = false

require("bufferline").setup{
    options = {
        diagnostics = "nvim_lsp"
    }
}
require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'nord'
    -- ... your lualine config
  }
}

-- Load the colorscheme
vim.cmd[[colorscheme nord]]
vim.cmd[[hi Normal guibg=NONE ctermbg=NONE]]
