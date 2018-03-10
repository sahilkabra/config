" Fast Saving
nnoremap <leader>fs :w!<cr>

nnoremap <Space> :
vnoremap <Space> :
nnoremap <leader>r :source $MYVIMRC<cr>
nnoremap <leader>e :e $MYVIMRC<cr>

inoremap <C-c> <Esc>
" toggle folds
nnoremap zt za

" toggle relative number
nnoremap rnu :set rnu!<CR>

" Moving between splits
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Resize splits
nnoremap <leader>vrp :vertical resize +5<cr>
nnoremap <leader>vrm :vertical resize -5<cr>
nnoremap <leader>vru :resize +5<cr>
nnoremap <leader>vrd :resize -5<cr>

" Split line at cursor
nnoremap <leader>cr i<CR><Esc>
nnoremap <leader>ncr J

" easier to type
noremap H ^
noremap L $

" Better movement
nnoremap <tab> %
vnoremap <tab> %

" toggle search highlighting
nnoremap <leader>hls :set hlsearch!<CR>

" nerd tree
nnoremap ntt :NERDTreeToggle<cr>
nnoremap ntf :NERDTreeFind<cr>

" fzf mappings
nnoremap <leader>ls :FZF<cr>
nnoremap <leader>lc :Commits<cr>
nnoremap <leader>lbc :BCommits<cr>
nnoremap <leader>lg :GFiles<cr>
nnoremap <leader>lbf :Buffers<cr>
nnoremap <leader>ltg :Tags<cr>
" nnoremap <leader>!lbc :BCommits!<cr>
" nnoremap <leader>!lg :GFiles!<cr>
" nnoremap <leader>!lbf :Buffers!<cr>
" nnoremap <leader>!lc :Commits!<cr>
" nnoremap <leader>!ltg :Tags!<cr>
" inoremap <c-x><c-l> <plug>(fzf-complete-line)

" ale mapping
nnoremap <leader>lnt :ALELint<cr>

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
