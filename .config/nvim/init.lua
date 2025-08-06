-- neovim init config file
-- keymaps are in lua/config/mappings.lua
-- install a patched font & ensure your terminal supports glyphs

-- auto install vim-plug and plugins, if not found
local data_dir = vim.fn.stdpath('data')
if vim.fn.empty(vim.fn.glob(data_dir .. '/site/autoload/plug.vim')) == 1 then
	vim.cmd('silent !curl -fLo ' .. data_dir .. '/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
	vim.o.runtimepath = vim.o.runtimepath
	vim.cmd('autocmd VimEnter * PlugInstall --sync | source $MYVIMRC')
end

local vim = vim
local Plug = vim.fn['plug#']

vim.g.start_time = vim.fn.reltime()
vim.loader.enable() --  SPEED 

vim.call('plug#begin')

-- themes
Plug('catppuccin/nvim', { ['as'] = 'catppuccin' }) --colorscheme
Plug('ellisonleao/gruvbox.nvim', { ['as'] = 'gruvbox' }) --colorscheme
Plug('uZer/pywal16.nvim', { [ 'as' ] = 'pywal16' }) --or, pywal colorscheme

-- status bar
Plug('nvim-tree/nvim-web-devicons') --Optional: statusline pretty icons
Plug('nvim-lualine/lualine.nvim') --statusline

-- tab bar
Plug 'lewis6991/gitsigns.nvim' --Optional: git status
Plug 'romgrk/barbar.nvim'

-- file explorer
Plug('ibhagwan/fzf-lua') --fuzzy finder and grep
Plug('stevearc/oil.nvim') --file explorer

-- syntax tools
Plug('nvim-treesitter/nvim-treesitter') --improved syntax
Plug('HiPhish/rainbow-delimiters.nvim') --rainbow delimiters
Plug('windwp/nvim-autopairs') --autopairs

-- TODO: native lsp, git, review keymappings

vim.call('plug#end')

-- move config and plugin config to alternate files
require("theme")
require("options")
require("lsp")
require("mappings")


load_theme()
