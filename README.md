# The 7th Vim

```
 _____ _   _             _           
|___  | |_| |__   __   _(_)_ __ ___  
   / /| __| '_ \  \ \ / / | '_ ` _ \ 
  / / | |_| | | |  \ V /| | | | | | |
 /_/   \__|_| |_|   \_/ |_|_| |_| |_|
```

安装简单，轻量、易用、高可配置性。

**Telegram Group:** [`https://t.me/The7thVim`](https://t.me/The7thVim)

## Index

- [Screenshot](#screenshot)
- [Install](#install)
- [Update](#update)
- [Customize](#customize)
- [Plugins](#plugins)
- [Key Mapping](#key-mapping)
- [Q&A](#qa)

## Screenshot

![7thvim][screen-shot-1]

![7thvim][screen-shot-2]

![7thvim][screen-shot-3]

![7thvim][screen-shot-4]

![7thvim][screen-shot-5]

## Install

```bash
bash <(curl -L https://raw.githubusercontent.com/dofy/7th-vim/master/install.sh) -i
# or
bash <(wget --no-check-certificate https://raw.githubusercontent.com/dofy/7th-vim/master/install.sh -O -) -i
```
### Check Dependent

```bash
bash <(curl -L https://raw.githubusercontent.com/dofy/7th-vim/master/install.sh) -c
# or
bash <(wget --no-check-certificate https://raw.githubusercontent.com/dofy/7th-vim/master/install.sh -O -) -c
```

### Show Language Supported List

```bash
bash <(curl -L https://raw.githubusercontent.com/dofy/7th-vim/master/install.sh) -l
# or
bash <(wget --no-check-certificate https://raw.githubusercontent.com/dofy/7th-vim/master/install.sh -O -) -l
```

### Help

```bash
bash <(curl -L https://raw.githubusercontent.com/dofy/7th-vim/master/install.sh) -h
# or
bash <(wget --no-check-certificate https://raw.githubusercontent.com/dofy/7th-vim/master/install.sh -O -) -h
```

## Update

```bash
bash <(curl -L https://raw.githubusercontent.com/dofy/7th-vim/master/install.sh) -u
# or
bash <(wget --no-check-certificate https://raw.githubusercontent.com/dofy/7th-vim/master/install.sh -O -) -u
```

## Customize

```bash
# Edit the following file to enable/disable language support you need
vim ~/.vimrc.language

# Edit your customize config file
vim ~/.vimrc.local

# Reload .vimrc (IN VIM!!!)
:source ~/.vimrc
```

## Plugins

| 插件                                                   | 说明                       |
| :---                                                   | ----                       |
| [scrooloose / **nerdtree**][plug1]                     | 以树形目录窗格方式浏览文件 |
| [Xuyuanp / **nerdtree-git-plugin**][plug2]             | NerdTree 显示 git 状态     |
| [tiagofumo / **vim-nerdtree-syntax-highlight**][plug3] | NerdTree 文件类型高亮      |
| [vim-airline / **vim-airline**][plug4]                 | 美化 Vim 状态栏            |
| [vim-airline / **vim-airline-themes**][plug5]          | Airline Themes             |
| [junegunn / **vim-easy-align**][plug6]                 | 对齐插件，强迫症福音       |
| [iamcco / **markdown-preview.nvim**][plug7]             | Markdown 预览              |
| [junegunn / **vim-slash**][plug8]                      | 优化搜索，移动清除搜索高亮 |
| [gorodinskiy / **vim-coloresque**][plug9]              | 颜色值预览                 |
| [jiangmiao / **auto-pairs**][plug10]                   | 符号自动补全               |
| [tpope / **vim-surround**][plug11]                     | 自动增加、替换配对符       |
| [junegunn / **fzf.vim**][plug12]                       | 强大、高效的搜索引擎       |
| [chxuan / **change-colorscheme**][plug13]              | 配色方案切换               |
| [docunext / **closetag.vim**][plug14]                  | 自动关闭 HTML 标签         |
| [Valloric / **YouCompleteMe**][plug15]                 | 代码自动完成               |
| [ryanoasis / **vim-devicons**][plug16]                 | Vim Dev Icons              |
| [tpope / **vim-repeat**][plug17]                       | 增强 . 命令                |
| [mhinz / **vim-startify**][plug18]                     | 启动页                     |
| [roman / **golden-ratio**][plug19]                     | 自动控制窗口大小           |
| [tomtom / **tcomment_vim**][plug20]                    | 添加/清除 注释             |
| [dracula / **vim**][color]                             | dracule 配色               |

> **补充说明：** 插件相关功能及用法请参考对应网站

## Key Mapping

| 快捷键/命令               | 说明                           |
| :--:                      | ----                           |
| `,`                       | **Leader Key**                 |
| `<Ctrl> A`                | INSERT 模式下移动光标到行首    |
| `<Ctrl> E`                | INSERT 模式下移动光标到行尾    |
| `<Ctrl> B`                | INSERT 模式下光标左移一位      |
| `<Ctrl> F`                | INSERT 模式下光标右移一位      |
| `<Ctrl> J`                | 跳转到下面的窗口               |
| `<Ctrl> K`                | 跳转到上面的窗口               |
| `<Ctrl> H`                | 跳转到左侧的窗口               |
| `<Ctrl> L`                | 跳转到右侧的窗口               |
| `<Ctrl> N`                | 打开 Buffer 列表中的下一个文件 |
| `<Ctrl> P`                | 打开 Buffer 列表中的上一个文件 |
| `<Ctrl> F` / `<Leader>ff` | 在当前工作目录中搜索文件       |
| `<Leader>fb`              | 在 Buffer 中搜索文件           |
| `<Leader>fh`              | 在历史文件中搜索               |
| `<Leader>fc`              | 搜索可用配色方案               |
| `<Leader>fl`              | 在 Buffer 文件中进行文本搜索   |
| `<Leader>fm`              | 搜索 Vim 中可用的命令          |
| `<Shift>-H`               | 跳转到前一个 Tab               |
| `<Shift>-L`               | 跳转到后一个 Tab               |
| `<Leader>t`               | 开启新 Tab                     |
| `<Leader>w`               | 关闭当前 Tab                   |
| `<Ctrl> E` / `<Leader>e`  | 开启 Nerdtree                  |
| `<F7>`                    | 开启 Markdown 预览             |
| `<F8>`                    | 关闭 Markdown 预览             |
| `<F9>`                    | 上一个配色方案                 |
| `<F10>`                   | 下一个配色方案                 |
| `gcc`                     | 注释/取消注释 当前行           |
| `g>`                      | 注释选中文本（VISUAL 模式）    |
| `:W`                      | 用 `sudo` 命令保存文件         |

## Q&A

- 安装依赖：
  - 由于自动补全插件采用了 `YouCompleteMe`，该插件需要 `Python` 和 `cmake` 所以最好先装好
  - 安装过程（包括安装 `YouCompleteMe`），以及一些插件需要 `Git`
  - 安装前会先对依赖的软件包进行检测，并提供安装提示作为参考（不排除以后写成自动安装的可能）
- 字体的问题：
  - 参考 [issues/2][issues2] 和 [issues/3][issues3]

[screen-shot-1]: https://user-images.githubusercontent.com/344197/34345993-42b0397c-ea2e-11e7-9003-e8c7f6453cba.png
[screen-shot-2]: https://user-images.githubusercontent.com/344197/34291098-a32023d6-e735-11e7-9fd5-285b4939c1c8.png
[screen-shot-3]: https://user-images.githubusercontent.com/344197/34345994-444dac1a-ea2e-11e7-98a1-3a21c4d000a9.png
[screen-shot-4]: https://user-images.githubusercontent.com/344197/34291099-a37b0102-e735-11e7-9ee4-e03b7f180af0.png
[screen-shot-5]: https://user-images.githubusercontent.com/344197/34291095-a2399ca4-e735-11e7-9883-6b1a27364fe4.png
[plug1]: https://github.com/scrooloose/nerdtree
[plug2]: https://github.com/Xuyuanp/nerdtree-git-plugin
[plug3]: https://github.com/tiagofumo/vim-nerdtree-syntax-highlight
[plug4]: https://github.com/vim-airline/vim-airline
[plug5]: https://github.com/vim-airline/vim-airline-themes
[plug6]: https://github.com/junegunn/vim-easy-align
[plug7]: https://github.com/iamcco/markdown-preview.nvim
[plug8]: https://github.com/junegunn/vim-slash
[plug9]: https://github.com/gorodinskiy/vim-coloresque
[plug10]: https://github.com/jiangmiao/auto-pairs
[plug11]: https://github.com/tpope/vim-surround
[plug12]: https://github.com/junegunn/fzf.vim
[plug13]: https://github.com/chxuan/change-colorscheme
[plug14]: https://github.com/docunext/closetag.vim
[plug15]: https://github.com/Valloric/YouCompleteMe
[plug16]: https://github.com/ryanoasis/vim-devicons
[plug17]: https://github.com/tpope/vim-repeat
[plug18]: https://github.com/mhinz/vim-startify
[plug19]: https://github.com/roman/golden-ratio
[plug20]: https://github.com/tomtom/tcomment_vim
[color]: https://github.com/dracula/vim
[issues2]: https://github.com/dofy/7th-vim/issues/2
[issues3]: https://github.com/dofy/7th-vim/issues/3
