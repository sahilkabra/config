let g:ale_linters = {
            \   'python': ['flake8']
            \}
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
" use global tsserver
let g:ale_typescript_tsserver_use_global = 0
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
nnoremap <leader>fx :!node_modules/.bin/tslint --fix %<cr>
