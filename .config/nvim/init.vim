" Disable git ssl
let $GIT_SSL_NO_VERIFY = 'true'

" NVIM true colour
"set termguicolors
set background=light

"some key mappings
let mapleader=','
map , <leader>
map <Space> :

" Use system clipboard by default
set clipboard+=unnamedplus

" Include plug
set runtimepath+=~/.config/nvim

call plug#begin('~/.config/nvim/plugged')
" Keep Plugin commands between vundle#begin/end.
"
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'     " file linting
" {{{
"   " use only tslint for typescript
    let g:ale_linters = {
    \  'typescript': [''],
    \}
    " do not run on typing
    let g:ale_lint_on_text_changed = 'never'
    " do not run on enter
    let g:ale_lint_on_enter = 0
    " show errors in location list
    let g:ale_open_list = 1
    augroup filetype_jsx
      autocmd!
      au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
      au BufNewFile,BufRead *.tsx set filetype=typescript.tsx
    augroup END
" }}}

" formatter
Plug 'sbdchd/neoformat'
" {{{
    augroup fmt
     autocmd!
     autocmd BufWritePre * Neoformat
    augroup END
    "let g:neoformat_verbose = 1
    let g:neoformat_typescript_prettier = {
      \ 'exe': './node_modules/.bin/prettier',
      \ 'args': ['--write', '--single-quote', '--parser typescript', '--print-width 80', '--trailing-comma all'],
      \ 'stdin': 1,
      \ }
    let g:neoformat_enabled_typescript = ['prettier']
    let g:neoformat_javascript_prettier = {
      \ 'exe': './node_modules/.bin/prettier',
      \ 'args': ['--single-quote', '--print-width 80', '--trailing-comma all'],
      \ 'stdin': 1,
      \ }
    let g:neoformat_enabled_javascript = ['prettier']
    let g:neoformat_json_prettier = {
      \ 'exe': './node_modules/.bin/prettier',
      \ 'args': ['--write', '--print-width 80'],
      \ 'stdin': 1,
      \ }
    let g:neoformat_enabled_json = ['prettier']
    let g:neoformat_scss_prettier = {
      \ 'exe': './node_modules/.bin/prettier',
      \ 'args': ['--write', '--single-quote', '--print-width 80', '--trailing-comma all'],
      \ 'stdin': 1,
      \ }
    let g:neoformat_enabled_scss = ['prettier']
" }}}

Plug 'will133/vim-dirdiff'
Plug 'https://github.com/ludovicchabant/vim-gutentags'          " background tag generation
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install -all'}  " fuzzy finder for vim
Plug 'junegunn/fzf.vim'                                         " vim keybindings for fzf
" {{{
    let g:fzf_nvim_statusline = 0 " disable status line overwriting
    let g:fzf_buffers_jump = 1 " use existing buffer if possible
    " Normal mode mappings
    nmap fzo :FZF<cr>
    nmap fz! :FZF!<cr>
    nmap fzgc :Commits<cr>
    nmap fzgb :BCommits<cr>
    nmap fzgf :GFiles<cr>
    nmap fzg? :GFiles?<cr>
    nmap fzbf :Buffers<cr>
    nmap fzt :Tags<cr>
    imap <c-x><c-l> <plug>(fzf-complete-line)
" }}}

" YCM type omni complete plugin
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}

" javascript plugins
Plug 'othree/yajs.vim', {'for': 'javascript'}
Plug 'othree/es.next.syntax.vim', {'for': 'javascript'}
Plug 'othree/javascript-libraries-syntax.vim', {'for': 'javascript'} " syntax for various js libraries
" {{{
    " js-lib-syntax config
    let g:used_javascript_libs = 'underscore,backbone,jquery,chai,flux'
" }}}

" Type script plugins
Plug 'leafgarland/typescript-vim',  " syntax highlight for ts
" {{{
    let g:typescript_indent_disable = 1
" }}}
Plug 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
Plug 'Quramy/tsuquyomi', {'for': 'typescript'} " use tsserver for omnicomplete and other ts features

" python plugins
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}         " PEP8 compatible indent for python
Plug 'fisadev/vim-isort', {'for': 'python'}                     " Python organise imports

" JSON
Plug 'elzr/vim-json', {'for': 'json'}

" postcss syntax
Plug 'stephenway/postcss.vim'

" --utility plugins
Plug 'scrooloose/nerdtree',
" {{{
    nmap ntt :NERDTreeToggle<cr>
    nmap ntf :NERDTreeFind<cr>
" }}}
Plug 'majutsushi/tagbar'                                        " show tags on the side
Plug 'tmhedberg/SimpylFold'                                     " vim folding
Plug 'tpope/vim-surround'
" {{{
    " no surround mappings
    let g:surround_no_mappings = 1
" }}}
Plug 'easymotion/vim-easymotion'
" {{{
    " easy motion mappings
    nmap es <Plug>(easymotion-sn)
    nmap en <Plug>(easymotion-next)
    nmap ep <Plug>(easymotion-prev)
" }}}
" tmux-vim seamless navigation
Plug 'christoomey/vim-tmux-navigator'

" colors
Plug 'NLKNguyen/papercolor-theme'

" quick searching; fzf doesn't fulfill everything
Plug 'https://github.com/mileszs/ack.vim'                       " for silversearcher
" {{{
   if executable('ag')
     let g:ackprg = 'ag --vimgrep'
   endif
" }}}

" commented out, previously used, enable if missed
" Plug 'davidhalter/jedi-vim', {'for': 'python'}                  " Python Completion in VIM
" Plug 'mhartington/nvim-typescript', {'for': 'typescript'}
" Plug 'vim-syntastic/syntastic'                                   " file linting
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'jsbeautify'
" Plug 'SuperTab' " use tab completion
" Plug 'ctrlp.vim' " search files and tags
" Plug 'Solarized'
" Plug 'vim-airline/vim-airline'
" Plug 'javascript.vim'
" Plug 'Valloric/YouCompleteMe'
" Plug 'mxw/vim-jsx', {'for': 'javascript'}
" Plug 'https://github.com/ternjs/tern_for_vim', {'do': 'npm install'} " def, type, rename js variable etc
" Plug 'jlesquembre/peaksea'
"

" Replace by ale
" Plug 'neomake/neomake'                                          " file linting
" {{{
    " neomake use eslint for js
"    let g:neomake_javascript_enabled_makers = ["eslint"]
"    let g:neomake_jsx_enabled_makers = ['eslint']
"    let g:neomake_typescript_enabled_makers = ["tslint"]
"    let g:neomake_python_enabled_makers = ["frosted"]
    " run neomake on write
"    autocmd! BufWritePost * Neomake
"    let g:neomake_open_list = 2
" }}}

call plug#end()            " required

autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

set encoding=utf-8
set scrolloff=5
set sidescrolloff=5
set listchars=eol:$,tab:¦·,trail:·,extends:>,precedes:<
set backspace=indent,eol,start
set list
set tabstop=4 "One tab equal to 4 spaces
set shiftwidth=4 "Indent key will shift 4 spaces
set softtabstop=4 "Tab in insert mode will insert 4 spaces
set noautochdir
set incsearch
set smartcase
set ignorecase
set nocursorline
set autoread
set nobackup noswapfile
set expandtab
set nomodeline
set confirm "Do not fail a command. Ask the user
set smartindent
set hidden
set smarttab
set number
" set relativenumber
set showmatch
set cursorline
set wildignore=*.o,*~,*.bak,*.c,*.class,*.out,.git\*,bin\*
set nowrap
set title
set showcmd
set foldmethod=syntax
set foldlevel=99

"Highlight 120 columns
set textwidth=120
set colorcolumn=+1
highlight ColorColumn ctermbg=6

"Delete all spaces at the end of line
autocmd! bufwritepre * :%s/\s\+$//e

" let g:syntastic_python_checkers = ["python", "flake8"]

" Fast Saving
nmap fs :w!<cr>

" toggle folds
noremap zt za

" toggle relative number
nmap rnu :set rnu!<CR>

" shift enter to esc
noremap <S-CR> <Esc>

" Moving between splits
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" Close split window
nmap <C-F4> <C-w>q

" Search for char under cursor
nmap <F3> *

" Resize splits
nmap <leader><Right> :vertical resize +5<cr>
nmap <leader><Left> :vertical resize -5<cr>
nmap <leader><Up> :resize +5<cr>
nmap <leader><Down> :resize -5<cr>

" Split line at cursor
nnoremap cr i<CR><Esc>
nnoremap ncr J

" split and surround with parenthesis
nnoremap csp <Plug>VSurround

set cc=120

colorscheme PaperColor

set statusline= "clear status line
"set statusline=[%n]\ %10F%m\ %y\ [%{&ff}]\ \ %=\ %l/%L\ [%c]\ %p%%

"Display Filename and modifier
"set statusline=%#identifier#
set statusline+=%c "cursor column
set statusline+=\ [%p%%]    "percentage of file
set statusline+=%*

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=\ %h      "help file flag
set statusline+=\ %y      "filetype

"read only flag
set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*

"modified flag
set statusline+=%#warningmsg#
set statusline+=%m
set statusline+=%*

"display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

set statusline+=%#warningmsg#
set statusline+=%*

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%=      "left/right separator
set statusline+=<<\ %{fugitive#head()}
set statusline+=%<\ <<\ %f "relative filename
"set statusline+=\ %L   "cursor line/total lines

set laststatus=2

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let b:statusline_tab_warning = ''

        if !&modifiable
            return b:statusline_tab_warning
        endif

        let tabs = search('^\t', 'nw') != 0

        "find spaces that arent used as alignment in the first indent column
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        endif
    endif
    return b:statusline_tab_warning
endfunction

"recalculate the long line warning when idle and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

"return a warning for "long lines" where "long" is either &textwidth or 120 (if
"no &textwidth is set)
"
"return '' if no long lines
"return '[#x,my,$z] if long lines are found, were x is the number of long
"lines, y is the median length of the long lines and z is the length of the
"longest line
function! StatuslineLongLineWarning()
    if !exists("b:statusline_long_line_warning")

        if !&modifiable
            let b:statusline_long_line_warning = ''
            return b:statusline_long_line_warning
        endif

        let long_line_lens = s:LongLines()

        if len(long_line_lens) > 0
            let b:statusline_long_line_warning = "[" .
                        \ '#' . len(long_line_lens) . "," .
                        \ 'm' . s:Median(long_line_lens) . "," .
                        \ '$' . max(long_line_lens) . "]"
        else
            let b:statusline_long_line_warning = ""
        endif
    endif
    return b:statusline_long_line_warning
endfunction

"return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
    let threshold = (&tw ? &tw : 120)
    let spaces = repeat(" ", &ts)
    let line_lens = map(getline(1,'$'), 'len(substitute(v:val, "\\t", spaces, "g"))')
    return filter(line_lens, 'v:val > threshold')
endfunction

"find the median of the given array of numbers
function! s:Median(nums)
    let nums = sort(a:nums)
    let l = len(nums)

    if l % 2 == 1
        let i = (l-1) / 2
        return nums[i]
    else
        return (nums[l/2] + nums[(l/2)-1]) / 2
    endif
endfunction
