" codefocus.vim is a colorscheme that let you focus on the code, not on the
" syntax highlightning.
"
" http://alexanderlobov.ru/posts/2018-01-25-codefocus-colorscheme/
"
" * Comments are a bit darker that the main font
" * Strings use italics
" * Plain diffs supported

highlight clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "codefocus"

hi Normal      ctermfg=0 ctermbg=254
hi Comment     cterm=italic ctermfg=245
hi String      cterm=italic ctermfg=240 ctermbg=254
hi Constant    cterm=NONE ctermbg=254 ctermfg=235
hi Identifier  cterm=bold ctermbg=254 ctermfg=240
hi Function    cterm=bold ctermbg=254 ctermfg=240
hi Statement   cterm=bold ctermbg=254 ctermfg=235
hi PreProc     cterm=NONE ctermbg=254 ctermfg=235
hi Type        cterm=NONE ctermbg=254 ctermfg=235
hi Special     cterm=bold ctermbg=254 ctermfg=235
hi Delimiter   cterm=NONE ctermbg=254 ctermfg=235
hi Visual      ctermfg=Gray
hi ColorColumn ctermbg=253
hi Search      cterm=italic,bold ctermbg=253 ctermfg=232
hi MatchParen  cterm=none ctermbg=226 ctermfg=0
hi NonText     cterm=none ctermbg=254 ctermfg=252

hi diffAdded   ctermfg=DarkGreen
hi diffRemoved ctermfg=DarkRed
