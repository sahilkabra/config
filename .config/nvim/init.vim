"===================[ config ]===================================================
let g:vim_config = $HOME . "/.config/nvim/"

let mapleader=','
map , <leader>

let s:modules = [
    \"settings",
    \"mappings",
    \"plugins",
    \]

for s:module in s:modules
    execute "source" g:vim_config . s:module . ".vim"
endfor
