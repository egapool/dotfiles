syntax enable


if filereadable(expand('~/.vimrc.keymap'))
  source ~/.vimrc.keymap
endif
if filereadable(expand('~/.vimrc.vim-go'))
  source ~/.vimrc.vim-go
endif

""""""""""""""""""""""""""""""
" プラグインのセットアップ
" プラグインを新規追加したあとは :PlugInstall
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'

" カラーテーマ
Plug 'morhetz/gruvbox'

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

" 独自のサブモードが使える
"Plug 'kana/vim-submode'

" Language Server
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-goimports'
Plug 'mattn/vim-lsp-icons'

Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

call plug#end()
""""""""""""""""""""""""""""""
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set background=dark    " Setting dark mode

nmap <silent> gd :LspDefinition<CR>
nmap <silent> K :LspHover<CR>
nmap <silent> <f2> :LspRename<CR>
nmap <silent> <Leader>d :LspTypeDefinition<CR>
nmap <silent> <Leader>r :LspReferences<CR>
nmap <silent> <Leader>i :LspImplementation<CR>
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_popup_delay = 1500
let g:lsp_text_edit_enabled = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 1


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
" 指定行数前からスクロールする
set scrolloff=3

" クリップボードとヤンクを同期
set clipboard+=unnamed

""""""""""""""""""""""""""""
"Airline
""""""""""""""""""""""""""""
" Smarter tab line有効化
set laststatus=2
" powerline font入れないと若干ダサい
let g:airline_powerline_fonts = 1

" for bling/vim-airline {{{
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_section_a = airline#section#create(['mode','','branch'])
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:Powerline_symbols = 'fancy'
set t_Co=256
let g:airline_theme='gruvbox'
"let g:airline_theme='papercolor'
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
