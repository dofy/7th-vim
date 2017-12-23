" ===============================================================
"  _____ _   _             _           
" |___  | |_| |__   __   _(_)_ __ ___  
"    / /| __| '_ \  \ \ / / | '_ ` _ \ 
"   / / | |_| | | |  \ V /| | | | | | |
"  /_/   \__|_| |_|   \_/ |_|_| |_| |_|
"
" ===============================================================
"
" Author: Seven Yu <dofyyu@gmail.com>
" Source: https://github.com/dofy/7th-vim
" Version: 1.1.0
" Created: 2017-11-24
"
" Sections:
"   - Common Settings
"   - Extend Settings
"   - Language Supports
"   - Key Mapping
"   - Plugins
"   - Load Customize Settings
"
" ===============================================================



" -------------------------------------------------
" COMMON SETTINGS
" -------------------------------------------------
set      nocompatible
filetype plugin indent on " 开启文件类型检测
syntax   on               " 开启语法高亮

"set shell=/bin/bash

set number                " 显示行号          nu
set relativenumber        " 显示相对行号      rnu
set ruler                 " 显示标尺信息

set expandtab             " Tab 替换为空格    et
set smartindent           " 智能缩进          si

set softtabstop=2         " Tab 缩进单位      sts
set shiftwidth=2          " 自动缩进单位      sw
set encoding=utf-8        " UTF-8 编码
set t_Co=256              " 开启 256 色（若终端支持）
set background=dark
set nowrap                " 禁止折行

set ignorecase            " 搜索忽略大小写    ic
set incsearch             " 搜索时实时高亮    is
set hlsearch              " 高亮所有搜索结果  hls

set cursorcolumn          " 高亮当前列        cuc
set cursorline            " 高亮当前行        cul

set scrolloff=5           " 屏幕顶/底部保持 5 行文本
set laststatus=2          " 显示状态栏
set noshowmode            " 不显示当前状态
set showcmd               " 显示输入的命令
set wildmenu              " Vim 命令行提示
set nobackup              " 不生成临时文件
set noswapfile            " 不生成 swap 文件
set autoread              " 自动加载外部修改
set autowrite             " 自动保存
set confirm               " 弹出文件未保存确认

set timeoutlen=500        " Time to wait for a command
let mapleader=','         " Change the mapleader


" -------------------------------------------------
" EXTEND SETTINGS
" -------------------------------------------------
"  Close relative number in INSERT mode
augroup relative_numbser
  autocmd!
  autocmd InsertEnter * :set norelativenumber
  autocmd InsertLeave * :set relativenumber
augroup end


" -------------------------------------------------
" LANGUAGE SUPPORTS
" -------------------------------------------------
" Support language group
let g:language_group = ['markdown', 'html', 'css', 'js', 'php', 'python', 'c', 'go']

if filereadable(expand($HOME . '/.vimrc.language'))
  source $HOME/.vimrc.language
endif


" -------------------------------------------------
" KEY MAPPING
" -------------------------------------------------
" Shortcut for Moving in INSERT mode
imap <C-A> <Home>
imap <C-E> <End>
imap <C-B> <Left>
imap <C-F> <Right>

" Navigation Between Windows
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

" Buffer Jump
nnoremap <C-N> :bn<CR>

" Prev Tab
nnoremap <S-H> gT
" Next Tab
nnoremap <S-L> gt

" New Tab
nnoremap <Leader>t :tabnew<CR>
" Close Tab
nnoremap <Leader>w :tabclose<CR>

" Change Color Scheme
map  <F10> :NextColorScheme<CR>
imap <F10> <Esc> :NextColorScheme<CR>
map  <F9>  :PreviousColorScheme<CR>
imap <F9>  <Esc> :PreviousColorScheme<CR>

" :W to save file by sudo
command W w !sudo tee % > /dev/null

" Markdown Preview
if count(g:language_group, 'markdown')
  nmap <silent> <F7> <Plug>MarkdownPreview
  imap <silent> <F7> <Plug>MarkdownPreview
  nmap <silent> <F8> <Plug>StopMarkdownPreview
  imap <silent> <F8> <Plug>StopMarkdownPreview
endif


" -------------------------------------------------
" PLUGINS
" -------------------------------------------------
call plug#begin('~/.vim/bundle')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/vim-easy-align'                          " 对齐插件，强迫症福音
Plug 'junegunn/vim-slash'                               " 优化搜索，移动清除搜索高亮
Plug 'gorodinskiy/vim-coloresque'                       " 颜色预览
Plug 'jiangmiao/auto-pairs'                             " 符号自动补全
Plug 'tpope/vim-surround'                               " 自动增加、替换配对符
Plug 'ctrlpvim/ctrlp.vim'                               " 文件搜索
Plug 'chxuan/change-colorscheme'                        " 配色切换
Plug 'Valloric/YouCompleteMe'                           " 代码自动完成
Plug 'ryanoasis/vim-devicons'                           " Vim Dev Icons
Plug 'tpope/vim-repeat'                                 " 增强 . 命令
Plug 'dracula/vim'                                      " dracule 配色

" Plugins for language
" markdown
if count(g:language_group, 'markdown')
  Plug 'iamcco/markdown-preview.vim', {'for': 'markdown'} " Markdown 预览
endif

" html
if count(g:language_group, 'html')
  Plug 'docunext/closetag.vim' " 自动关闭 HTML 标签
endif

" css
if count(g:language_group, 'css')
endif

" js
if count(g:language_group, 'js')
endif

" php
if count(g:language_group, 'php')
endif

" python
if count(g:language_group, 'python')
endif

" c
if count(g:language_group, 'c')
endif

" go
if count(g:language_group, 'go')
endif

call plug#end()

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

let g:easy_align_delimiters = {
      \ '>': { 'pattern': '>>\|=>\|>' },
      \ '/': {
      \     'pattern':         '//\+\|/\*\|\*/',
      \     'delimiter_align': 'l',
      \     'ignore_groups':   ['!Comment'] },
      \ ']': {
      \     'pattern':       '[[\]]',
      \     'left_margin':   0,
      \     'right_margin':  0,
      \     'stick_to_left': 0
      \   },
      \ ')': {
      \     'pattern':       '[()]',
      \     'left_margin':   0,
      \     'right_margin':  0,
      \     'stick_to_left': 0
      \   },
      \ 'd': {
      \     'pattern':      ' \(\S\+\s*[;=]\)\@=',
      \     'left_margin':  0,
      \     'right_margin': 0
      \   }
      \ }

" NERDTree
nnoremap <C-F> :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeToggle<CR>
let NERDTreeChDirMode=2
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeShowLineNumbers=1

" airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

