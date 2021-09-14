local utils = require('utils')
local o = vim.o
local opt = vim.opt

-- Indent x spaces as tabs
o.smarttab = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.shiftround = true

-- Smartly indent on new line
o.smartindent = true

-- Remove hightlighting on search
o.hlsearch = false

-- Casing sensitive search only when it includes capital letters
o.smartcase = true

-- No line wrap
o.wrap = false

-- Encoding
o.encoding = 'UTF-8'

-- Auto write files
opt.autowrite = true

-- Time to wait to complete a command
o.timeoutlen = 500

-- Normal mode
utils.map('i', 'jk', '<ESC>')
utils.map('i', 'kj', '<ESC>')

-- Indenting
utils.map('v', '<', '<gv')
utils.map('v', '>', '>gv')

-- Delete without saving to register
utils.map('n', '<leader>d', '"_d')
utils.map('v', '<leader>d', '"_d')

-- Copy to system clipboard
utils.map('n', '<leader>y', '"*y')
utils.map('v', '<leader>y', '"*y')

-- Copy file to system clipboard
utils.map('n', '<leader>Y', 'gg"+yG')

-- Paste from system clipboard
utils.map('n', '<leader>p', '"*p')

-- Replace-paste keeping content in the paste-buffer
utils.map('v', '<leader>p', '"_dP')
