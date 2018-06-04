" Enable ctags
let g:loaded_gentags#ctags = 0

" Disable gtags
let g:loaded_gentags#gtags = 1

" Generate gtags in background no
let g:gen_tags#gtags_auto_gen = 0

" Generate ctags in background
let g:gen_tags#ctags_auto_gen = 1

" Do not use cache dir, store tags in git dir
let g:gen_tags#use_cache_dir = 0

" blacklist build and lib directories
let g:gen_tags#blacklist = ['build', 'dist']
