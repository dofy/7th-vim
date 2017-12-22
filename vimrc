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
"   - Key Mapping
"   - Plugins
"   - Load Customize Settings
"
" ===============================================================



" -------------------------------------------------
" COMMON SETTINGS
" -------------------------------------------------
set number                " 显示行号          nu
set relativenumber        " 显示相对行号      rnu
set ruler                 " 显示标尺信息

set expandtab             " Tab 替换为空格    et
set smartindent           " 智能缩进          si

set softtabstop=2         " Tab 缩进单位      sts
set shiftwidth=2          " 自动缩进单位      sw
set encoding=utf-8        " UTF-8 编码
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

"set shell=/bin/bash

set timeoutlen=500        " Time to wait for a command
let mapleader=','         " Change the mapleader

filetype plugin indent on " 开启文件类型检测
syntax   on               " 开启语法高亮


" -------------------------------------------------
" KEY MAPPING
" -------------------------------------------------
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

" Markdown Preview
nmap <silent> <F7> <Plug>MarkdownPreview
imap <silent> <F7> <Plug>MarkdownPreview
nmap <silent> <F8> <Plug>StopMarkdownPreview
imap <silent> <F8> <Plug>StopMarkdownPreview

" Change Color Scheme
map  <F10> :NextColorScheme<CR>
imap <F10> <ESC> :NextColorScheme<CR>
map  <F9>  :PreviousColorScheme<CR>
imap <F9>  <ESC> :PreviousColorScheme<CR>

" :W to save file by sudo
command W w !sudo tee % > /dev/null


" -------------------------------------------------
" PLUGINS
" -------------------------------------------------
call plug#begin('~/.vim/bundle')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'iamcco/markdown-preview.vim', {'for': 'markdown'} " Markdown 预览
Plug 'junegunn/vim-easy-align'                          " 对齐插件，强迫症福音
Plug 'junegunn/vim-slash'                               " 优化搜索，移动清除搜索高亮
Plug 'gorodinskiy/vim-coloresque'                       " 颜色预览
Plug 'jiangmiao/auto-pairs'                             " 符号自动补全
Plug 'tpope/vim-surround'                               " 自动增加、替换配对符
Plug 'ctrlpvim/ctrlp.vim'                               " 文件搜索
Plug 'chxuan/change-colorscheme'                        " 配色切换
Plug 'docunext/closetag.vim'                            " 自动关闭 HTML 标签
Plug 'Valloric/YouCompleteMe'                           " 代码自动完成
Plug 'ryanoasis/vim-devicons'                           " Vim Dev Icons
Plug 'tpope/vim-repeat'                                 " 增强 . 命令
Plug 'dracula/vim'                                      " dracule 配色

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
nnoremap <C-f> :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeToggle<CR>
let NERDTreeChDirMode=2
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1

" airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

