-- =======================================================================
-- 1. LAZY.NVIM BOOTSTRAP
-- =======================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- FIX: Used vim.uv instead of vim.loop (0.10+ standard)
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- =======================================================================
-- 2. CORE SETTINGS
-- =======================================================================
vim.g.mapleader = " "

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 300
vim.opt.termguicolors = true
-- FIX: Removed manual swap directory setting to prevent E303 errors

-- =======================================================================
-- 3. PLUGIN DEFINITION
-- =======================================================================
require("lazy").setup({
    -- 1. COLOR SCHEME
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        config = function()
            vim.cmd.colorscheme('catppuccin-mocha')
        end
    },

    -- 2. FILE TREE
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('nvim-tree').setup {
                renderer = {
                    icons = { git_placement = 'after' },
                },
                view = { width = 30 },
            }
            vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { desc = 'Toggle file tree' })
        end
    },

    -- 3. STATUS LINE
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'catppuccin', -- FIX: Matched theme to colorscheme
                    section_separators = '',
                    component_separators = '',
                },
            }
        end
    },
})
