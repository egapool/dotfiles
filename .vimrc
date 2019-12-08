if filereadable(expand('~/.vimrc.keymap'))
  source ~/.vimrc.keymap
endif

""""""""""""""""""""""""""""""
" プラグインのセットアップ
" プラグインを新規追加したあとは :PlugInstall
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" ファイルオープンを便利に
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler'
Plug 'Shougo/vimproc'

" Unite.vimで最近使ったファイルを表示できるようにする
Plug 'Shougo/neomru.vim'

" vim-go
Plug 'fatih/vim-go'

" ファイル名検索
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()
""""""""""""""""""""""""""""""


"" NERDTree
" map <C-n> :NERDTreeToggle<CR>


" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

set nocursorline
set norelativenumber
set nolazyredraw

" TABキーを押した際にタブ文字の代わりにスペースを入れる
set expandtab
set tabstop=4
set shiftwidth=4

" クリップボードとヤンクを同期
set clipboard+=unnamed

" vim-go
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_variable_declarations = 1

let g:go_fmt_command = "goimports"

autocmd FileType go setlocal noexpandtab
autocmd FileType go setlocal tabstop=4
autocmd FileType go setlocal shiftwidth=4

let g:go_metalinter_autosave = 1
" lintはやめてvetだけ
let g:go_metalinter_autosave_enabled = ['vet', 'errcheck']
