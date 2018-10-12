set signcolumn=yes

let g:LanguageClient_autoStart = 1
" let g:LanguageClient_changeThrottle = 0.5
let g:LanguageClient_serverCommands = {}

if executable('javascript-typescript-langserver')
    let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
    let g:LanguageClient_serverCommands['javascript.jsx'] = ['javascript-typescript-stdio']
    let g:LanguageClient_serverCommands.typescript = ['javascript-typescript-stdio']
    let g:LanguageClient_serverCommands['typescript.jsx'] = ['javascript-typescript-stdio']
endif

if executable('pyls')
    let g:LanguageClient_serverCommands.python = ['pyls']
endif

if executable('rustup')
    let g:LanguageClient_serverCommands.rust = ['rustup', 'run', 'beta', 'rls']
endif
