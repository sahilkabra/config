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

Plug 'jsfaint/gen_tags.vim'

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
Plug 'roxma/nvim-completion-manager'

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
Plug 'mhartington/nvim-typescript', {'do': ':UpdateRemotePlugins', 'for': 'typescript'}

"-------------------( python )------------------------------------------------

"-------------------( json )------------------------------------------------
Plug 'elzr/vim-json', {'for': 'json'}

"-------------------( css )------------------------------------------------
" postcss syntax
Plug 'stephenway/postcss.vim', {'for': 'css'}

"-------------------[ elm ]------------------------------------------------
" Plug 'elmcast/elm-vim', {'for': 'elm'}

"-------------------[ testing ]------------------------------------------------

"-------------------[ commented ]------------------------------------------------
" Plug 'tpope/vim-surround'
" Plug 'fisadev/vim-isort', {'for': 'python'}                     " Python organise imports
" language client for auto completion
" Plug 'autozimu/LanguageClient-neovim', { 'do' : ':UpdateRemotePlugins' }
" background tag generation
" Plug 'https://github.com/ludovicchabant/vim-gutentags'
" YCM type omni complete plugin
" Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
" Python Completion in VIM
" Plug 'zchee/deoplete-jedi', {'for': 'python'}
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'flazz/vim-colorschemes'
" Plug 'plan9-for-vimspace/acme-colors'
" tsx syntax highlight
" Plug 'peitalin/vim-jsx-typescript', {'for': ['typescript.jsx']}



call plug#end()            " required

" If plugin dir is empty, install
if empty(s:plug_dir)
    autocmd! VimEnter * PlugInstall
endif
