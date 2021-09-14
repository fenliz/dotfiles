local o = vim.o
local bo = vim.bo

-- No swap/backup-files
o.swapfile = false
bo.swapfile = false
o.backup = false
o.writebackup = false

-- Persist undo's
o.undodir = '/home/charlie/.vim/undodir'
o.undofile = true
