let s:plug_dir = g:vim_config . "plugged"
let s:plugin_settings_dir = g:vim_config . "startup/plugins"

call plug#begin(s:plug_dir)

"-------------------[ interface ]------------------------------------------------
Plug 'will133/vim-dirdiff'

" fuzzy finder for vim
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}

" vim keybindings for fzf
Plug 'junegunn/fzf.vim'

" vim folding
Plug 'tmhedberg/SimpylFold'

" gtags support
Plug 'vim-scripts/gtags.vim'

" background tag generation
Plug 'https://github.com/ludovicchabant/vim-gutentags'

Plug 'NLKNguyen/papercolor-theme'

"-------------------[ tools ]------------------------------------------------
Plug 'scrooloose/nerdtree',

" show tags on the side
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'

" quick searching; fzf doesn't fulfill everything
" for silversearcher
Plug 'https://github.com/mileszs/ack.vim'

" align code
Plug 'godlygeek/tabular'

" plugin repeat
Plug 'tpope/vim-repeat'

"-------------------[ commands ]------------------------------------------------
" Toggle commment
Plug 'tomtom/tcomment_vim'

" surround with
Plug 'machakann/vim-sandwich'

"-------------------[ tmux ]------------------------------------------------
Plug 'christoomey/vim-tmux-navigator'

"-------------------[ language ]------------------------------------------------
" Git integration
Plug 'tpope/vim-fugitive'

" Completion
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}

if !&diff
    Plug 'w0rp/ale'
endif

"-------------------( javascript )------------------------------------------------
Plug 'othree/yajs.vim', {'for': 'javascript'}
Plug 'othree/es.next.syntax.vim', {'for': 'javascript'}

" syntax support for various js libraries
Plug 'othree/javascript-libraries-syntax.vim', {'for': 'javascript'}

"-------------------( typescript )------------------------------------------------
" syntax highlight
Plug 'leafgarland/typescript-vim', {'for': ['typescript', 'typescript.jsx']}

" ide features
"Plug 'mhartington/nvim-typescript'
", {'do': './install.sh', 'for': ['typescript', 'typescript.jsx']}

"-------------------( python )------------------------------------------------
Plug 'fisadev/vim-isort', {'for': 'python'}                     " Python organise imports

Plug 'zchee/deoplete-jedi', {'for': 'python'}

"-------------------( json )------------------------------------------------
Plug 'elzr/vim-json', {'for': 'json'}

"-------------------( css )------------------------------------------------
" postcss syntax
Plug 'stephenway/postcss.vim', {'for': 'css'}

"-------------------[ elm ]------------------------------------------------
Plug 'elmcast/elm-vim', {'for': 'elm'}

"-------------------( kotlin )------------------------------------------------
Plug 'udalov/kotlin-vim', {'for': 'kotlin'}

"-------------------( java )------------------------------------------------
Plug 'artur-shaik/vim-javacomplete2', {'for': 'java'}

"-------------------[ testing ]------------------------------------------------

"-------------------[ commented ]------------------------------------------------
" Plug 'tpope/vim-surround'
" YCM type omni complete plugin
" Plug 'roxma/nvim-completion-manager'
" Python Completion in VIM
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'flazz/vim-colorschemes'
" Plug 'plan9-for-vimspace/acme-colors'
" tsx syntax highlight
" Plug 'peitalin/vim-jsx-typescript', {'for': ['typescript.jsx']}
" Plug 'jsfaint/gen_tags.vim'

" language client for auto completion
"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do' : 'bash install.sh'
"    \}



call plug#end()            " required

" If plugin dir is empty, install
if empty(s:plug_dir)
    autocmd! VimEnter * PlugInstall
endif
