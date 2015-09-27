"新建.c,.h,.sh文件，自动插入文件头
autocmd BufNewFile *.cpp,*.c,*.sh exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1,"\#########################################################################")
        call append(line("."), "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Author: qinchao ")
        call append(line(".")+2, "\# mail: 1187620726@qq.com")
        call append(line(".")+3, "\# Created ".strftime("Date:%Y-%m-%d Time:%I:%M:%S."))
        call append(line(".")+4, "\#########################################################################")
        call append(line(".")+5, "\#!/bin/bash")
        call append(line(".")+6, "")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), " > File Name: ".expand("%"))
        call append(line(".")+1, " > Author: qinchao")
        call append(line(".")+2, " > Mail: 1187620726@qq.com")
        call append(line(".")+3, " > Created ".strftime("Date:%Y-%m-%d Time:%I:%M:%S."))
        call append(line(".")+4, " ************************************************************************/")
        call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on " 自动语法高亮
colorscheme default " 设定配色方案
set number " 显示行号
"set cursorline " 突出显示当前行
set ruler " 打开状态栏标尺
set shiftwidth=4 " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4 " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4 " 设定 tab 长度为 4
set nobackup " 覆盖文件时不备份
"set autochdir " 自动切换当前目录为当前文件所在的目录

set backupcopy=yes " 设置备份时的行为为覆盖
set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set nowrapscan " 禁止在搜索到文件两端时重新搜索
set incsearch " 输入搜索内容时就显示搜索结果
set hlsearch " 搜索时高亮显示被找到的文本
" set showmatch " 插入括号时，短暂地跳转到匹配的对应括号
" set matchtime=2 " 短暂跳转到匹配括号的时间
set magic " 设置魔术
set hidden " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set guioptions-=T " 隐藏工具栏
set guioptions-=m " 隐藏菜单栏
set smartindent " 开启新行时使用智能自动缩进
set backspace=indent,eol,start " 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=1 " 设定命令行的行数为 1
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
                            " 设置在状态行显示的信息
"set foldenable " 开始折叠
"set foldmethod=syntax " 设置语法折叠
"set foldcolumn=0 " 设置折叠区域的宽度
"setlocal foldlevel=1 " 设置折叠层数为
" set foldclose=all " 设置为自动关闭折叠
" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
                            " 用空格键来开关折叠

" 用户目录变量$VIMFILES
let $VIMFILES = $HOME.'/.vim'

" 设定doc文档目录
let helptags=$VIMFILES.'/doc'
" 设置字体 以及中文支持

" 配置多语言环境
if has("multi_byte")
    " UTF-8 编码
    set encoding=utf-8
    set termencoding=utf-8
    set formatoptions+=mM
    set fencs=utf-8,gbk
    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif


"关于tab的快捷键
 map tn :tabnext<cr>
 map tp :tabprevious<cr>
 map td :tabnew .<cr>
 map te :tabedit
 map tc :tabclose<cr>

"窗口分割时,进行切换的按键热键需要连接两次,比如从下方窗口移动
"光标到上方窗口,需要<c-w><c-w>k,非常麻烦,现在重映射为<c-k>,切换的
"时候会变得非常方便.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"-----------------------------------------------------------------
" plugin - NERD_tree.vim 以树状方式浏览系统中的文件和目录
" :ERDtree 打开NERD_tree :NERDtreeClose 关闭NERD_tree
" o 打开关闭文件或者目录 t 在标签页中打开
" T 在后台标签页中打开 ! 执行此文件
" p 到上层目录 P 到根目录
" K 到第一个节点 J 到最后一个节点
" u 打开上层目录 m 显示文件系统菜单（添加、删除、移动操作）
" r 递归刷新当前目录 R 递归刷新当前根目录
"-----------------------------------------------------------------
" F3 NERDTree 切换
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC>:NERDTreeToggle<CR>
let NERDTreeWinSize=30 "窗口宽度
let NERDTreeIgnore=['.o$[[file]]']
let NERDTreeAutoDeleteBuffer=1 "自动更新
"若最后一个窗口是NerdTree窗口时，自动关闭它
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif


"-----------------------------------------------------------------
" plugin - NERD_commenter.vim 注释代码用的，
" [count],cc 光标以下count行逐行添加注释(7,cc)
" [count],cu 光标以下count行逐行取消注释(7,cu)
" [count],cm 光标以下count行尝试添加块注释(7,cm)
" ,cA 在行尾插入 /* */,并且进入插入模式。 这个命令方便写注释。
" 注：count参数可选，无则默认为选中行或当前行
"-----------------------------------------------------------------
let mapleader=","
let NERDSpaceDelims=1 " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1 " 多行注释时样子更好看

"------------------------------------------------------------------
"plugin - auto-save
"-----------------------------------------------------------------
"let g:auto_save = 1  " enable AutoSave on Vim startup"

"------------------------------------------------------------------
"plugin - Gundo
"-----------------------------------------------------------------
"nnoremap <silent><F2> :GundoToggle <CR>
nnoremap <c-u> :GundoToggle<CR>


"------------------------------------------------------------------
"plugin - TaskList
"-----------------------------------------------------------------
map <c-t> <Plug>TaskList

"------------------------------------------------------------------
"plugin - Tagbar
"-----------------------------------------------------------------
nmap <silent><F4> :TagbarToggle<CR>
"1:则是按字母序,0:"按出现顺序排序
let g:tagbar_sort = 0
let g:tagbar_left=0 " 使其出现在右边
set updatetime=100 " 根据光标位置自动更新高亮tag的间隔时间，单位为毫秒
let g:tagbar_width=30 " 设置窗口宽度
let g:tagbar_compact=1 " 不显示顶部帮助信息，节省空间
let g:tagbar_show_linenumbers = 1 " 显示绝对行号
let g:tagbar_expand = 1 " 自动扩展gui窗口
autocmd VimEnter * nested :TagbarOpen  " 启动vim时自动打开tagbar
autocmd VimEnter * nested :call tagbar#autoopen(1)  "若文件类型支持，则自动打开tagbar
autocmd BufEnter * nested :call tagbar#autoopen(0) "打开新标签时，自动打开tagbar

"------------------------------------------------------------------
"plugin - CtrlP
"-----------------------------------------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0 "disable work path mode
let g:ctrlp_match_window_bottom=1 
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0 
let g:ctrlp_mruf_max=500 
let g:ctrlp_follow_symlinks=1 "显示链接文件


"------------------------------------------------------------------
"plugin - Sessionman 
"-----------------------------------------------------------------
set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
nmap <leader>sl :SessionList<CR>
nmap <leader>ss :SessionSave<CR>
nmap <leader>sc :SessionClose<CR>

"------------------------------------------------------------------
"plugin - YCM
"-----------------------------------------------------------------
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py' 
"每次重新生成匹配项，禁止缓存匹配项  
let g:ycm_cache_omnifunc = 0
" 语法关键字补全 
let g:ycm_seed_identifiers_with_syntax = 1  
"在注释中也可以补全  
let g:ycm_complete_in_comments = 1  
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
""注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1
"输入第一个字符就开始补全  
let g:ycm_min_num_of_chars_for_completion = 1
"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	
" 0: 关闭ycm的syntastic
let g:ycm_show_diagnostics_ui = 1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F2> :YcmDiags<CR>

"------------------------------------------------------------------
"plugin - ClangFormat
"-----------------------------------------------------------------
nnoremap <c-f> :ClangFormat<cr>
"format on buffer saving
let g:clang_format#auto_format = 0
let g:clang_format#auto_format_on_insert_leave = 0
"format command
 let g:clang_format#command = 'clang-format-3.6'

"------------------------------------------------------------------
"plugin - clighter 
"-----------------------------------------------------------------
let g:clighter_libclang_file = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/libclang.so.3.7'
let g:clighter_autostart = 1
"let g:clighter_window_size = -1 " whole buffer
let g:clighter_window_size = 0 " highlight current screen of window
"let g:clighter_window_size = 1
let g:clighter_realtime = 0
let g:clighter_rename_prompt_level = 1
let g:clighter_syntax_groups = ['clighterNamespaceRef', 'clighterFunctionDecl', 'clighterFieldDecl', 'clighterDeclRefExprCall', 'clighterMemberRefExprCall', 'clighterMemberRefExprVar', 'clighterNamespace', 'clighterNamespaceRef', 'cligherInclusionDirective', 'clighterVarDecl']
let g:ClighterOccurrences = 0

set nocompatible 
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'a.vim'
Bundle 'Tagbar'
Bundle 'Syntastic'
Bundle 'Auto-Pairs'
"Bundle 'vim-auto-save'
Bundle 'payneseu/nerdtree'
Bundle 'The-NERD-Commenter'
"Bundle 'bbchung/clighter'
Bundle 'TaskList.vim'
Bundle 'Gundo'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'tpope/vim-surround'
Bundle 'sessionman.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'rhysd/vim-clang-format'
"Bundle 'SirVer/ultisnips'

"主题 solarized
Bundle 'altercation/vim-colors-solarized'
"let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast='normal'
let g:solarized_visibility='normal'
"主题 molokai
Bundle 'tomasr/molokai'
let g:molokai_original = 1
"配色方案
set background=dark
set t_Co=256
"colorscheme solarized
colorscheme molokai
"colorscheme phd

filetype plugin indent on     " required!
