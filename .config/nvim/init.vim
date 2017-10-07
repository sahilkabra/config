" Disable git ssl
let $GIT_SSL_NO_VERIFY = 'true'

" NVIM true colour
"set termguicolors
set background=light

"some key mappings
let mapleader=','
map , <leader>
map <Space> :
map <leader>r :source $MYVIMRC<cr>
map <leader>e :e $MYVIMRC<cr>

" Use system clipboard by default
" set clipboard+=unnamedplus

" Include plug
set runtimepath+=~/.config/nvim

call plug#begin('~/.config/nvim/plugged')
" Keep Plugin commands between vundle#begin/end.
"
" Git integration
Plug 'tpope/vim-fugitive'
" {{{
    nnoremap gd :Gdiff<cr>
    nnoremap ga :Gblame<cr>
" }}}
" Toggle commment
Plug 'tomtom/tcomment_vim'
Plug 'w0rp/ale'     " file linting and formatting
" {{{
    " do not run on typing
    let g:ale_lint_on_text_changed = 'never'
    " error and warn signs
    let g:ale_sign_error = 'E'
    let g:ale_sign_warning = 'W'
    " do not run on enter
    let g:ale_lint_on_enter = 0
    " run ale on save
    let g:ale_lint_on_save = 1
    " keep error list open
    let g:ale_open_list = 1
    " use location list
    let g:ale_set_loclist = 1
    " fixers
    let g:ale_javascript_prettier_use_local_config = 1
    let g:ale_fix_on_save = 1
    let g:ale_fixers = {}
    let g:ale_fixers['javascript'] = [
                \ 'prettier', 'eslint'
                \]
    let g:ale_javascript_prettier_options = '--single-quote'
    let g:ale_fixers['typescript'] = [
                \ 'prettier'
                \]
    let g:ale_fixers['json'] = []
    let g:ale_fixers['python'] = ['autopep8', 'isort']
    " custom tslint fixer till ale supports it
    nmap <leader>fx :!node_modules/.bin/tslint --fix %<cr>
" }}}
Plug 'will133/vim-dirdiff'
Plug 'https://github.com/ludovicchabant/vim-gutentags'          " background tag generation
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}  " fuzzy finder for vim
Plug 'junegunn/fzf.vim'                                         " vim keybindings for fzf
" {{{
    let g:fzf_nvim_statusline = 0 " disable status line overwriting
    let g:fzf_buffers_jump = 1 " use existing buffer if possible
    " Normal mode mappings
    nmap <leader>ls :FZF<cr>
    nmap <leader>lc :Commits<cr>
    nmap <leader>lc! :Commits!<cr>
    nmap <leader>lbc :BCommits<cr>
    nmap <leader>lbc! :BCommits!<cr>
    nmap <leader>lg :GFiles<cr>
    nmap <leader>lg! :GFiles!<cr>
    nmap <leader>lbf :Buffers<cr>
    nmap <leader>lbf! :Buffers!<cr>
    nmap <leader>ltg :Tags<cr>
    nmap <leader>ltg! :Tags!<cr>
    imap <c-x><c-l> <plug>(fzf-complete-line)
" }}}
" YCM type omni complete plugin
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
" {{{
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#complete_method = 'complete'
" }}}
" javascript plugins
Plug 'othree/yajs.vim', {'for': 'javascript'}
Plug 'othree/es.next.syntax.vim', {'for': 'javascript'}
Plug 'othree/javascript-libraries-syntax.vim', {'for': 'javascript'} " syntax for various js libraries
" {{{
    " js-lib-syntax config
    let g:used_javascript_libs = 'underscore,backbone,jquery,chai,flux'
" }}}
" Type script plugins
Plug 'HerringtonDarkholme/yats.vim', {'for': 'typescript'}          " syntax highlight
Plug 'mhartington/nvim-typescript', {'do': ':UpdateRemotePlugins', 'for': 'typescript'}    " ide features
" {{{
" let g:deoplete#enable_at_startup = 1
"  let g:deoplete#enable_debug = 1
"  let g:deoplete#enable_profile = 1
"  call deoplete#enable_logging('DEBUG', '/PATH_TO/deoplete.log')
" }}}
" python plugins
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}         " PEP8 compatible indent for python
Plug 'fisadev/vim-isort', {'for': 'python'}                     " Python organise imports
" JSON
Plug 'elzr/vim-json', {'for': 'json'}
" postcss syntax
Plug 'stephenway/postcss.vim', {'for': 'css'}
" elm
Plug 'elmcast/elm-vim', {'for': 'elm'}
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
    " let g:surround_no_mappings = 1
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
Plug 'flazz/vim-colorschemes'
" quick searching; fzf doesn't fulfill everything
Plug 'https://github.com/mileszs/ack.vim'                       " for silversearcher
" {{{
   if executable('ag')
     let g:ackprg = 'ag --vimgrep'
   endif
" }}}

" commented out, previously used, enable if missed
" Plug 'davidhalter/jedi-vim', {'for': 'python'}                  " Python Completion in VIM
" Plug 'vim-syntastic/syntastic'                                   " file linting
" {{{
"    let g:syntastic_python_checkers = ["python", "flake8"]
" }}}
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

" Plug 'leafgarland/typescript-vim',  " syntax highlight for ts
" {{{
"     let g:typescript_indent_disable = 1
" }}}

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

" replace by nvim/typescript
"Plug 'Shougo/vimproc.vim', {
"\ 'build' : {
"\     'linux' : 'make'
"\    },
"\ }
"Plug 'Quramy/tsuquyomi', {'for': 'typescript'} " use tsserver for omnicomplete and other ts features

" Ale can do the job
" formatter
"Plug 'sbdchd/neoformat'
" {{{
"    augroup fmt
"     autocmd!
"     autocmd BufWritePre * Neoformat
"    augroup END
    "let g:neoformat_verbose = 1
"    let g:neoformat_typescript_prettier = {
"      \ 'exe': './node_modules/.bin/prettier',
"      \ 'args': ['--write', '--parser typescript'],
"      \ 'stdin': 1,
"      \ }
"    let g:neoformat_enabled_typescript = ['prettier']
"
"    let g:neoformat_javascript_prettier = {
"      \ 'exe': './node_modules/.bin/prettier',
"      \ 'args': ['--single-quote', '--write'],
"      \ 'stdin': 1,
"      \ }
"    let g:neoformat_enabled_javascript = ['prettier']
"
"    let g:neoformat_json_prettier = {
"      \ 'exe': './node_modules/.bin/prettier',
"      \ 'args': ['--write', '--parser json'],
"      \ 'stdin': 1,
"      \ }
"    let g:neoformat_enabled_json = ['prettier']
"
"    let g:neoformat_scss_prettier = {
"      \ 'exe': './node_modules/.bin/prettier',
"      \ 'args': ['--write'],
"      \ 'stdin': 1,
"      \ }
"    let g:neoformat_enabled_scss = ['prettier']
" }}}


call plug#end()            " required

autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

set encoding=utf-8
set scrolloff=999
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
nnoremap <leader>cr i<CR><Esc>
nnoremap <leader>ncr J

" easier to type
noremap H ^
noremap L $

" toggle search highlighting
nmap <leader>hls :set hlsearch!<CR>

" enable matching for if/else/html/xml etc
runtime plugin/matchit.vim

set cc=120

colorscheme PaperColor

" netrw as nerdtree
let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_winsize = 25

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
