" Disable ctags
let g:loaded_gentags#ctags = 1

" Enable gtags
let g:loaded_gentags#ctags = 0

" Generate gtags in background
let g:gen_tags#gtags_auto_gen = 1

" Do not generate gtags in background
let g:gen_tags#ctags_auto_gen = 1

" Do not use cache dir, store tags in git dir
let g:gen_tags#use_cache_dir = 0
