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
" Version: 2.1.0
" Created: 2017-11-24
"
" Sections:
"   - Common Settings
"   - Extend Settings
"   - Language Supports
"   - Plugins
"   - Key Mapping
"   - Plugin Settings
"   - Load Customize Settings
"
" ===============================================================


" -------------------------------------------------
" COMMON SETTINGS
" -------------------------------------------------
set      nocompatible
filetype plugin indent on " 开启文件类型检测
syntax   on               " 开启语法高亮

set nofoldenable          " 默认关闭代码折叠

" 可以修改 .vimrc.local 开启代码折叠
" set foldenable
" set foldmethod=syntax

" set shell=/bin/bash

set backspace=indent,eol,start  " 智能回删
set whichwrap+=h,l,<,>,[,]      " 光标循环
set virtualedit=block,onemore   " 允许光标出现在最后一个字符的后面

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

set history=1024
set undofile
set undodir=~/.vim/.undodir

set timeoutlen=700        " Time to wait for a command
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
if filereadable(expand($HOME . '/.vimrc.language'))
  source $HOME/.vimrc.language
endif


" -------------------------------------------------
" PLUGINS
" -------------------------------------------------
call plug#begin('~/.vim/bundle')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'         " 启动页
Plug 'roman/golden-ratio'         " 自动控制窗口大小
Plug 'junegunn/vim-easy-align'    " 对齐插件，强迫症福音
Plug 'junegunn/vim-slash'         " 优化搜索，移动清除搜索高亮
Plug 'gorodinskiy/vim-coloresque' " 颜色预览
Plug 'jiangmiao/auto-pairs'       " 符号自动补全
Plug 'tpope/vim-surround'         " 自动增加、替换配对符
Plug 'chxuan/change-colorscheme'  " 配色切换
Plug 'zxqfl/tabnine-vim'          " 代码自动完成
Plug 'tomtom/tcomment_vim'        " 添加注释
Plug 'ryanoasis/vim-devicons'     " Vim Dev Icons
Plug 'tpope/vim-repeat'           " 增强 . 命令
Plug 'dracula/vim'                " dracule 配色

" Plugins for language
" markdown
if count(g:language_group, 'markdown')
  Plug 'plasticboy/vim-markdown'                                            " Markdown 代码高亮，自动格式化
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } } " Markdown 预览
endif

" html
if count(g:language_group, 'html')
  Plug 'docunext/closetag.vim' " 自动关闭 HTML 标签
endif

" css
if count(g:language_group, 'css')
  Plug 'hail2u/vim-css3-syntax', {'for': 'css'}
endif

" js
if count(g:language_group, 'js')
  Plug 'pangloss/vim-javascript'
endif

" json
if count(g:language_group, 'json')
  Plug 'elzr/vim-json' " json 语法检查
endif

" php
if count(g:language_group, 'php')
  Plug 'mageekguy/php.vim', {'for': 'php'}
  Plug 'shawncplus/phpcomplete.vim', {'for': 'php'}
  Plug 'vim-scripts/phpfolding.vim', {'for': 'php'}
  Plug '2072/PHP-Indenting-for-VIm', {'for': 'php'}
endif

" python
if count(g:language_group, 'python')
  Plug 'hdima/python-syntax'
endif

" c
if count(g:language_group, 'c')
endif

" go
if count(g:language_group, 'go')
  Plug 'fatih/vim-go', { 'for': 'go' } " Golang
endif

" -------------------------------------------------
" LOAD CUSTOMIZE PLUGINS
" -------------------------------------------------
if filereadable(expand($HOME . '/.vimrc.plugins'))
  source $HOME/.vimrc.plugins
endif

call plug#end()


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
nnoremap <C-P> :bp<CR>

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
  nmap <silent> <F8> <Plug>MarkdownPreviewStop
  imap <silent> <F8> <Plug>MarkdownPreviewStop
endif

" FZF
nnoremap <C-F>      :Files<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fc :Colors<CR>
nnoremap <Leader>fh :History<CR>
nnoremap <Leader>fl :Lines<CR>
nnoremap <Leader>fm :Commands<CR>

" NERDTree
nnoremap <C-E>     :NERDTreeToggle<CR>
nnoremap <Leader>e :NERDTreeToggle<CR>

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


" -------------------------------------------------
" PLUGIN SETTINGS
" -------------------------------------------------
" Language plugin settings
if count(g:language_group, 'markdown')
  let g:vim_markdown_new_list_item_indent = 2
endif

if count(g:language_group, 'css')
  augroup VimCSS3Syntax
    autocmd!
    autocmd FileType css setlocal iskeyword+=-
  augroup END
endif

if count(g:language_group, 'js')
  let g:javascript_plugin_jsdoc = 1
endif

" Startify Header
let g:startify_custom_header=[
      \'   _____ _   _             _           ',
      \'  |___  | |_| |__   __   _(_)_ __ ___  ',
      \'     / /| __| `_ \  \ \ / / | `_ ` _ \ ',
      \'    / / | |_| | | |  \ V /| | | | | | |',
      \'   /_/   \__|_| |_|   \_/ |_|_| |_| |_|',
      \'',
      \'    The answer exists only in the Tao. ']

" FZF
let g:fzf_layout = { 'down': '~35%' }

" EasyAlign
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
let NERDTreeChDirMode=2
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeShowLineNumbers=1
let g:NERDTreeWinSize=35
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1         " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

