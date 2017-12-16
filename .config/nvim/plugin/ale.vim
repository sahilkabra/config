let g:ale_linters = {
            \   'python': ['flake8']
            \}
" do not run on typing
let g:ale_lint_on_text_changed = 'never'
" do not run on enter
let g:ale_lint_on_enter = 0
" run ale on save
let g:ale_lint_on_save = 0
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
            \ 'prettier', 'tslint'
            \]
let g:ale_fixers['json'] = []
let g:ale_fixers['python'] = ['autopep8', 'isort']

" disable ale completion
let g:ale_completion_enabled = 0

" error and warn signs
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'

" ale error message format
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%severity%] %s [ALE %linter%]'
