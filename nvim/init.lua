local g = vim.g
local o = vim.o
local opt = vim.opt

-- General
opt.mouse = 'a'                       -- Enable mouse support
-- opt.clipboard = 'unnamedplus'         -- Copy/paste to system clipboard
opt.swapfile = false                  -- Don't use swapfile
opt.completeopt = 'menuone,noinsert,noselect'  -- Autocomplete options

-- Neovim UI
opt.number = true           -- Show line number
opt.showmatch = true        -- Highlight matching parenthesis
opt.foldmethod = 'marker'   -- Enable folding (default 'foldmarker')
opt.colorcolumn = '80'      -- Line lenght marker at 80 columns
opt.splitright = true       -- Vertical split to the right
opt.splitbelow = true       -- Horizontal split to the bottom
opt.ignorecase = true       -- Ignore case letters when search
opt.smartcase = true        -- Ignore lowercase for the whole pattern
opt.linebreak = true        -- Wrap on word boundary
opt.termguicolors = true    -- Enable 24-bit RGB colors
opt.laststatus=3            -- Set global statusline

-- Tabs, indent
opt.expandtab = true        -- Use spaces instead of tabs
opt.shiftwidth = 4          -- Shift 4 spaces when tab
opt.tabstop = 4             -- 1 tab == 4 spaces
opt.smartindent = true      -- Autoindent new lines

-- Memory, CPU
opt.hidden = true           -- Enable background buffers
opt.history = 100           -- Remember N lines in history
opt.lazyredraw = true       -- Faster scrolling
opt.synmaxcol = 240         -- Max column for syntax highlight
opt.updatetime = 250        -- ms to wait for trigger an event
opt.showmode = false

opt.keymap='russian-jcukenwin'
opt.iminsert=0
opt.imsearch=0

g.mapleader = " "

map = vim.keymap.set
map('n', '<leader>c', ':nohl<CR>', { noremap=true, silent=true })
map('n', '<leader>p<CR>', ':PackerSync', { noremap=true, silent=false })

require('lualine').setup {
    options = { theme = 'catppuccin' },
}

vim.cmd.colorscheme 'catppuccin'

vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'ellisonleao/gruvbox.nvim' 

    use { 
        "catppuccin/nvim", 
        as = "catppuccin" 
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use {
        "kylechui/nvim-surround",
        tag = "*",
        config = function()
            require("nvim-surround").setup()
        end
    }
    use {
        "iamcco/markdown-preview.nvim",
        run = function() 
            vim.fn["mkdp#util#install"]() 
        end
    }
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
end)
