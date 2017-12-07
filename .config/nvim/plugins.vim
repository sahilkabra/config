let s:plug_dir = g:vim_config . "plugged"
let s:plugin_settings_dir = g:vim_config . "startup/plugins"

call plug#begin(s:plug_dir)

"-------------------[ interface ]------------------------------------------------
Plug 'will133/vim-dirdiff'

" background tag generation
Plug 'https://github.com/ludovicchabant/vim-gutentags'

" fuzzy finder for vim
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}

" vim keybindings for fzf
Plug 'junegunn/fzf.vim'

" vim folding
Plug 'tmhedberg/SimpylFold'
Plug 'flazz/vim-colorschemes'

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

" file linting and formatting
Plug 'w0rp/ale'

" language client for auto completion
Plug 'autozimu/LanguageClient-neovim', { 'do' : ':UpdateRemotePlugins' }

"-------------------( javascript )------------------------------------------------
Plug 'othree/yajs.vim', {'for': 'javascript'}
Plug 'othree/es.next.syntax.vim', {'for': 'javascript'}

" syntax support for various js libraries
Plug 'othree/javascript-libraries-syntax.vim', {'for': 'javascript'}

"-------------------( typescript )------------------------------------------------
" syntax highlight
Plug 'HerringtonDarkholme/yats.vim', {'for': 'typescript'}

"-------------------( python )------------------------------------------------

"-------------------( json )------------------------------------------------

"-------------------( css )------------------------------------------------
" postcss syntax
Plug 'stephenway/postcss.vim', {'for': 'css'}

"-------------------[ elm ]------------------------------------------------
Plug 'elmcast/elm-vim', {'for': 'elm'}

"-------------------[ testing ]------------------------------------------------

"-------------------[ commented ]------------------------------------------------
" YCM type omni complete plugin
" Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
" Plug 'mhartington/nvim-typescript', {'do': ':UpdateRemotePlugins', 'for': 'typescript'}    " ide features
" Plug 'zchee/deoplete-jedi', {'for': 'python'}                  " Python Completion in VIM
" Plug 'elzr/vim-json', {'for': 'json'}
" Plug 'tpope/vim-surround'
" Plug 'fisadev/vim-isort', {'for': 'python'}                     " Python organise imports

call plug#end()            " required

" If plugin dir is empty, install
if empty(s:plug_dir)
    autocmd! VimEnter * PlugInstall
endif
