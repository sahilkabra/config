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
" Do not fail a command. Ask the user
set confirm
set smartindent
set hidden
set smarttab
set number
" set relativenumber
set showmatch
set wildignore=*.o,*~,*.bak,*.c,*.class,*.out,.git\*,bin\*
set nowrap
set title
set showcmd
set foldmethod=syntax
set foldlevel=99

" Highlight 120 columns
set textwidth=120
set cc=120
set colorcolumn=+1
highlight ColorColumn ctermbg=6

" use rg if available
if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading
endif
set grepformat=%f:%l:%c:%m:%m,%f:%l:%m

set lazyredraw
set laststatus=2

" Delete all spaces at the end of line
autocmd! bufwritepre * :%s/\s\+$//e

execute "source" g:vim_config . "statusline.vim"
" enable matching for if/else/html/xml etc
runtime plugin/matchit.vim

