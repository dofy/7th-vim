# The 7th Vim

```
 _____ _   _             _           
|___  | |_| |__   __   _(_)_ __ ___  
   / /| __| '_ \  \ \ / / | '_ ` _ \ 
  / / | |_| | | |  \ V /| | | | | | |
 /_/   \__|_| |_|   \_/ |_|_| |_| |_|
```

工作中使用的一套 Vim 配置方案。 安装简单、轻量、易用、高可配置性。

## Screenshot

![7thvim][screen-shot-1]

![7thvim][screen-shot-2]

## Install

```bash
curl -L https://raw.githubusercontent.com/dofy/7th-vim/master/install.sh | sh
```

## Plugins

  - [scrooloose/nerdtree][plug01] 树形目录
  - [Xuyuanp/nerdtree-git-plugin][plug02] NerdTree 显示 git 状态
  - [vim-airline/vim-airline][plug03] 美化 Vim 状态栏
  - [vim-airline/vim-airline-themes][plug04] Airline Themes
  - [junegunn/vim-easy-align][plug05] 对齐插件，强迫症福音
  - [iamcco/markdown-preview.vim][plug06] Markdown 预览
  - [junegunn/vim-slash][plug07] 优化搜索，移动清除搜索高亮
  - [gorodinskiy/vim-coloresque][plug08] 颜色预览
  - [jiangmiao/auto-pairs][plug09] 符号自动补全
  - [tpope/vim-surround][plug10] 自动增加、替换配对符
  - [dracula/vim][plug11] dracule 配色

## Key Mapping

  - `,` **Leader Key**
  - `Ctrl J` 跳转到下面的窗口
  - `Ctrl K` 跳转到上面的窗口
  - `Ctrl H` 跳转到左侧的窗口
  - `Ctrl L` 跳转到右侧的窗口
  - `Ctrl N` 打开 Buffer 列表中的下一个文件
  - `Ctrl P` 打开 Buffer 列表中的上一个文件
  - `Shift H` 跳转到前一个 Tab
  - `Shift L` 跳转到后一个 Tab
  - `<Leader>t` 开启新 Tab
  - `<Leader>w` 关闭当前 Tab
  - `<F7>` 开启 Markdown 预览
  - `<F8>` 关闭 Markdown 预览
  - `Ctrl F` 或 `<Leader>f` 开启 Nerdtree

[screen-shot-1]: https://user-images.githubusercontent.com/344197/34243545-3b92507e-e65c-11e7-8a26-2b763f4b291a.png
[screen-shot-2]: https://user-images.githubusercontent.com/344197/34243627-9fd4e600-e65c-11e7-99f2-f72a44242c62.png
[plug01]: https://github.com/scrooloose/nerdtree
[plug02]: https://github.com/Xuyuanp/nerdtree-git-plugin
[plug03]: https://github.com/vim-airline/vim-airline
[plug04]: https://github.com/vim-airline/vim-airline-themes
[plug05]: https://github.com/junegunn/vim-easy-align
[plug06]: https://github.com/iamcco/markdown-preview.vim
[plug07]: https://github.com/junegunn/vim-slash
[plug08]: https://github.com/gorodinskiy/vim-coloresque
[plug09]: https://github.com/jiangmiao/auto-pairs
[plug10]: https://github.com/tpope/vim-surround
[plug11]: https://github.com/dracula/vim
