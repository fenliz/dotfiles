local g = vim.g

g.mapleader = ','

require('plugins')

require('explorer')
require('files')
require('finder')
require('lsp')
require('navigation')
require('problems')
require('theme')
require('text')

require('custom_plugin')
