-- Basic settings
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.clipboard = "unnamedplus" -- Share clipboard with system

-- Additional quality-of-life settings
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.tabstop = 2           -- Number of spaces tabs count for
vim.opt.shiftwidth = 2        -- Size of indent
vim.opt.smartindent = true    -- Smart autoindenting
vim.opt.wrap = false          -- Don't wrap lines
vim.opt.swapfile = false      -- Don't use swap files
vim.opt.backup = false        -- Don't create backups
vim.opt.hlsearch = true       -- Highlight search results
vim.opt.incsearch = true      -- Show search matches as you type
vim.opt.ignorecase = true     -- Ignore case when searching
vim.opt.smartcase = true      -- But case-sensitive if expression contains capitals
vim.opt.termguicolors = true  -- True color support
vim.opt.scrolloff = 8         -- Lines of context when scrolling
vim.opt.sidescrolloff = 8     -- Columns of context when scrolling
vim.opt.updatetime = 300      -- Faster completion
vim.opt.timeoutlen = 500      -- By default timeoutlen is 1000 ms
