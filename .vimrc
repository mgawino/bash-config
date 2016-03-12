filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set nu
syntax on
au BufNewFile,BufRead .bash_aliases call SetFileTypeSH("bash")
