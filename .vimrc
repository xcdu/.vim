" VIM CONFIGURATION FILE
" Before (modeline and leader key mapping){{{
  " Modeline (do not change) {{{
    set modeline
  " IMPORTANT: Value 'modelines' must be the line number of modeline
    set modelines=7
    " vim: foldenable:foldmethod=marker:foldlevel=0:foldcolumn=0 :
  " }}} Modeline
  " Define <leader> {{{ 
  let mapleader=","
  " }}}
  " Operating System Detection {{{
      if !exists("g:os")
        if has("win64") || has("win32") || has("win16")
            let g:os = "Windows"
        else
            let g:os = substitute(system('uname'), '\n', '', '')
        endif
      endif
  " }}}
" }}} Before
" Vundle{{{
set nocompatible                " be improved, required
filetype off                    " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" Edit {{{
  " Undo {{{
    Plugin 'sjl/gundo.vim'
  " }}}
  " Search and Replace {{{
      " Search
        Plugin 'haya14busa/incsearch.vim'
        Plugin 'haya14busa/incsearch-fuzzy.vim'
        Plugin 'dyng/ctrlsf.vim'
      " Repalce
        Plugin 'terryma/vim-multiple-cursors'
  " }}} Search and Replace
  " Select {{{
    Plugin 'terryma/vim-expand-region'
  " }}} Select
  " Repeat {{{
    Plugin 'tpope/vim-repeat'
  " }}} Repeat
" }}} Edit
" View and Appearence{{{
  " Status Bar and Tab Bar {{{
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
  " }}} Status Bar and Tab Bar
  " Color Schemes {{{
    Plugin 'flazz/vim-colorschemes'
  " }}} Color Schemes
  " Indent Guide {{{
    Plugin 'nathanaelkane/vim-indent-guides'
  " }}} Indent Guide
" }}} View and Appearance
" Coding {{{
" Tag {{{
    Plugin 'vim-scripts/vimprj'
    Plugin 'vim-scripts/DfrankUtil'
    Plugin 'vim-scripts/indexer.tar.gz' 
" }}} Tag
  " Auto-complete {{{
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'tpope/vim-surround'
    Plugin 'raimondi/delimitmate'
  " }}} Auto-complete
  " Format {{{
    " Google Formartter
      Plugin 'google/vim-codefmt'
      Plugin 'google/vim-glaive'
      Plugin 'google/vim-maktaba'
  " }}} Format
  " Template {{{
    Plugin 'vim-scripts/ultisnips'
    Plugin 'honza/vim-snippets'
  " }}}
  " Comment {{{
    Plugin 'scrooloose/nerdcommenter'
  " }}}
  " Syntax {{{
    Plugin 'vim-syntastic/syntastic'
  " }}} Syntax
  " C and C++ plugins {{{
    Plugin 'derekwyatt/vim-fswitch'
    Plugin 'octol/vim-cpp-enhanced-highlight'
  " }}} C and C++ plugins
  " latex {{{
    Plugin 'vim-latex/vim-latex'
  " }}}
" }}} Coding
" Navigation {{{
  Plugin 'easymotion/vim-easymotion'
  Plugin 'kien/ctrlp.vim'
  Plugin 'tacahiroy/ctrlp-funky'
  Plugin 'majutsushi/tagbar'
  Plugin 'scrooloose/nerdtree'
" }}} Navigation
" Marker {{{
  Plugin 'kshenoy/vim-signature'
" }}} Marker
" Session {{{
  Plugin 'xolox/vim-misc'
  Plugin 'xolox/vim-session'
" }}}
" Shortcut {{{
  Plugin 'kana/vim-arpeggio'
" }}}
call vundle#end()               " required
filetype plugin indent on       " required
" }}} Vundle
" General Settings {{{
" Basic {{{
" 关闭兼容模式
set nocompatible
" 开启文件类型侦测
filetype on
filetype plugin on

" 开启实时搜索功能
set incsearch

" 搜索时大小写不敏感
set ignorecase

" vim 自身命令行模式智能补全
set wildmode=longest,full
set wildmenu

" enable backspace
set backspace=2

" 禁止折行
" set nowrap
" 允许折行
set wrap

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
" 自适应不同语言的智能缩进
filetype indent on

" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=2
" 设置格式化时制表符占用空格数
set shiftwidth=2
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=2
" }}}
" Filetype Indent {{{
" Python
autocmd Filetype python setlocal ts=4 sw=4 sts=4 tw=79 et
" }}}
" Instant Saving {{{
" autocmd BufWritePost $MYVIMRC source $MYVIMRC
" }}}
" Tags {{{
  " Please locate tags file into ~/.vim/tags
  " set tags+=~/.vim/tags/stdcxx.tags
  " set tags+=~/.vim/tags/stdc.tags
  " set tags+=~/.vim/tags/sys.tags
" }}}
" Built-in Auto Complete {{{
  " C and C++ {{{
    " please use with ctags
    let OmniCpp_DefaultNamespaces = ["_GLIBCXX_STD"]
  " }}}
" }}}
" }}} General Setting
" Plugin Settings {{{
" gundo.vim {{{
  " 调用 gundo 树
  nnoremap <Leader>ud :GundoToggle<CR>
" }}} gundo.vim
" incsearch.vim {{{
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
" }}}
" incsearch-fuzzy.vim {{{
function! s:config_fuzzyall(...) abort
  return extend(copy({
  \   'converters': [
  \     incsearch#config#fuzzy#converter(),
  \     incsearch#config#fuzzyspell#converter()
  \   ],
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> z/ incsearch#go(<SID>config_fuzzyall())
noremap <silent><expr> z? incsearch#go(<SID>config_fuzzyall({'command': '?'}))
noremap <silent><expr> zg? incsearch#go(<SID>config_fuzzyall({'is_stay': 1}))
" }}}
" ctrlsf {{{
  let g:ctrlsf_position='left'
  " defualt keys
  let g:ctrlsf_mapping = {
      \ "open"    : ["<CR>", "o"],
      \ "openb"   : "O",
      \ "split"   : "<C-O>",
      \ "vsplit"  : "",
      \ "tab"     : "t",
      \ "tabb"    : "T",
      \ "popen"   : "p",
      \ "popenf"  : "P",
      \ "quit"    : "q",
      \ "next"    : "<C-J>",
      \ "prev"    : "<C-K>",
      \ "pquit"   : "q",
      \  "loclist" : "",
      \ "chgmode" : "M",
      \ }
  " Toggle key map, default is empty
  let g:ctrlsf_toggle_map_key=''
  nmap  <c-f> <Plug>CtrlSFCwordPath
  vmap  <c-f> <Plug>CtrlSFVwordExec
" }}}
" vim-mutiple-cursors {{{
  " Disable default keys
    let g:multi_cursor_use_default_mapping=0
  " Default mapping
  let g:multi_cursor_next_key='<C-n>'
  let g:multi_cursor_prev_key='<C-p>'
  let g:multi_cursor_skip_key='<C-x>'
  let g:multi_cursor_quit_key='<Esc>'
" }}} vim-multiple-cursors
" vim-expand-region {{{
  map + <Plug>(expand_region_expand)
  map - <Plug>(expand_region_shrink)
" }}} vim-expand-region
" vim-airline {{{
  " 设置状态栏主题风格
  " let g:airline_powerline_fonts=1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  if has('gui_running')
    let g:airline_theme = 'molokai'
  endif
  " }}} vim-airline
" vim-indent-guides {{{
  " 随 vim 自启动
  let g:indent_guides_enable_on_vim_startup=1
  " 从第二层开始可视化显示缩进
  let g:indent_guides_start_level=2
  " 色块宽度
  let g:indent_guides_guide_size=1
  " 快捷键 i 开/关缩进可视化
  " nmap <silent> <leader>i <Plug>IndentGuidesToggle
" }}} vim-indent-guides
" indexer.tar.gz {{{
  " 设置插件 indexer 调用 ctags 的参数
  " 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
  " 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
  let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"
  " Please add ~/.indexer_files
" }}}
" YouCompleteMe {{{
  " 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt=longest,menu

autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

  " 基于语义的代码导航
  nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
  " 只能是 #include 或已打开的文件
  nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>


  " YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
  inoremap <leader><leader> <C-x><C-o>

let g:ycm_path_to_python_interpreter="/usr/bin/python"
" let g:ycm_global_ycm_extra_conf="~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_global_ycm_extra_conf=expand('~/.vim/.ycm_extra_conf.py')

  " 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
  let g:ycm_confirm_extra_conf=0

  " YCM 补全菜单配色
  " 菜单
  highlight Pmenu ctermfg=15 ctermbg=28 guifg=#005F87 guibg=#EEE8D5
  " 选中项
  highlight PmenuSel ctermfg=10 ctermbg=236 guifg=#AFD700 guibg=#106900

  " 开启 YCM 标签补全引擎
  let g:ycm_collect_identifiers_from_tags_files=1
  "" 引入 C++ 标准库 tags
  "set tags+=/data/misc/software/app/vim/stdcpp.tags
  "set tags+=/data/misc/software/app/vim/sys.tags

"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings=0

  " 从第一个键入字符就开始罗列匹配项
  let g:ycm_min_num_of_chars_for_completion=1

  " 禁止缓存匹配项，每次都重新生成匹配项
  let g:ycm_cache_omnifunc=0

  " 语法关键字补全
  let g:ycm_seed_identifiers_with_syntax=1

  " 补全功能在注释中同样有效
  let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings = 1
" 设置在下面几种格式的文件上屏蔽ycm
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \}

"youcompleteme  默认tab  s-tab 和 ultisnips 冲突
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']

" 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;
let g:ycm_key_invoke_completion = '<leader>;'
" }}}
" vim-codefmt {{{
" 代码格式化
call glaive#Install()
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar ~/.vim/google-java-format-1.4-all-deps.jar"
 
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END
" }}}
" ultisnips {{{
" 模板补全
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<c-e>"

let g:UltiSnipsSnippetDirectories=["bundle/vim-snippets/UltiSnips"]

function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction
au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
" Expand snippet or return
let g:ulti_expand_res = 1
function! Ulti_ExpandOrEnter()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res
        return ''
    else
        return "\<return>"
endfunction

" Set <space> as primary trigger
inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>
" }}}
" nerdcommenter {{{
"" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left' 
" }}}
" syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1

let g:syntastic_auto_loc_list = 1
" 设置错误符号
let g:syntastic_error_symbol='✗'
" 设置警告符号
let g:syntastic_warning_symbol='⚠'
" 是否在打开文件时检查
let g:syntastic_check_on_open=0
" 是否在保存文件后检查
let g:syntastic_check_on_wq=1

let g:syntastic_enable_highlighting=1

let g:syntastic_python_checkers=['pyflakes'] " 使用pyflakes,速度比pylint快
let g:syntastic_javascript_checkers = ['jsl', 'jshint']
let g:syntastic_html_checkers=['tidy', 'jshint']
" }}}
" vim-fswitch {{{
  " *.cpp 和 *.h 间切换
  nmap <silent> <Leader>sw :FSHere<cr>
" }}}
" vim-latex {{{
" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:
" }}} vim-latex
" vim-easymotion {{{
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map  <leader><leader>f <Plug>(easymotion-bd-f)
" nmap <leader><leader>f <Plug>(easymotion-overwin-f)
" Move to line
map <leader><leader>L <Plug>(easymotion-bd-jk)
" nmap <leader><leader>L <Plug>(easymotion-overwin-line)
" Move to word
map  <leader><leader>w <Plug>(easymotion-bd-w)
" nmap <leader><leader>w <Plug>(easymotion-overwin-w)

map <leader><leader>h <Plug>(easymotion-linebackward)
map <leader><leader>j <Plug>(easymotion-j)
map <leader><leader>k <Plug>(easymotion-k)
map <leader><leader>l <Plug>(easymotion-lineforward)
" 重复上一次操作, 类似repeat插件, 很强大
map <leader><leader>. <Plug>(easymotion-repeat)
" }}}
" ctrlp {{{
  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_cmd = 'CtrlP'
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll|swp|zip|tar|tar.gz|pyc)$',
    \ }
  let g:ctrlp_working_path_mode=0
  let g:ctrlp_match_window_bottom=1
  let g:ctrlp_max_height=15
  let g:ctrlp_match_window_reversed=0
  let g:ctrlp_mruf_max=500
  let g:ctrlp_follow_symlinks=1
" }}} ctrlp
" ctrlp-funky {{{
  nnoremap <Leader>fu :CtrlPFunky<Cr>
  " narrow the list down with a word under cursor
  nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
  let g:ctrlp_funky_syntax_highlight = 1
  let g:ctrlp_extensions = ['funky']
" }}}
" tagbar {{{
  " 设置 tagbar 子窗口的位置出现在主编辑区的左边
  " let tagbar_left=1
  " 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
  nnoremap <Leader>ilt :TagbarToggle<CR>
  " 设置标签子窗口的宽度
  " let tagbar_width=32
  " tagbar 子窗口中不显示冗余帮助信息
  let g:tagbar_compact=1
  " 设置 ctags 对哪些代码标识符生成标签
  let g:tagbar_type_cpp = {
       \ 'ctagstype' : 'c++',
       \ 'kinds'     : [
           \ 'c:classes:0:1',
           \ 'd:macros:0:1',
           \ 'e:enumerators:0:0', 
           \ 'f:functions:0:1',
           \ 'g:enumeration:0:1',
           \ 'l:local:0:1',
           \ 'm:members:0:1',
           \ 'n:namespaces:0:1',
           \ 'p:functions_prototypes:0:1',
           \ 's:structs:0:1',
           \ 't:typedefs:0:1',
           \ 'u:unions:0:1',
           \ 'v:global:0:1',
          \ 'x:external:0:1'
       \ ],
       \ 'sro'        : '::',
       \ 'kind2scope' : {
           \ 'g' : 'enum',
           \ 'n' : 'namespace',
           \ 'c' : 'class',
           \ 's' : 'struct',
           \ 'u' : 'union'
       \ },
       \ 'scope2kind' : {
           \ 'enum'      : 'g',
           \ 'namespace' : 'n',
           \ 'class'     : 'c',
           \ 'struct'    : 's',
           \ 'union'     : 'u'
       \ }
  \ }
" }}} tagbar
" nerdtree {{{
  " auto open NERDTree when vim start up without parameters
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  " auto open NERDTree when vim start up with a directory
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
  autocmd VimEnter * if argc() == 1 && !isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | endif
  " auto close when left vim
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  " change NERDTree icon
  let g:NERDTreeDirArrowExpandable = '▸'
  let g:NERDTreeDirArrowCollapsible = '▾'
  " key map
  nmap <leader>fl :NERDTreeToggle<cr>
  " 设置 NERDTree 子窗口位置
  let NERDTree="left"
  " 设置 NERDTree 子窗口宽度
  let NERDTreeWinSize=22
  " 显示隐藏文件
  let NERDTreeShowHidden=1
  " NERDTree 子窗口中不显示冗余帮助信息
  let NERDTreeMinimalUI=1
  " 删除文件时自动删除文件对应 buffer
  let NERDTreeAutoDeleteBuffer=1
  let NERDTreeIgnore = ['.DS_Store', '\.pyc$']

" }}} nerdtree
" vim-signature {{{
  " 自定义 vim-signature 快捷键
  let g:SignatureMap = {
          \ 'Leader'             :  "m",
          \ 'PlaceNextMark'      :  "m,",
          \ 'ToggleMarkAtLine'   :  "m.",
          \ 'PurgeMarksAtLine'   :  "m-",
          \ 'DeleteMark'         :  "dm",
          \ 'PurgeMarks'         :  "mda",
          \ 'PurgeMarkers'       :  "m<BS>",
          \ 'GotoNextLineAlpha'  :  "']",
          \ 'GotoPrevLineAlpha'  :  "'[",
          \ 'GotoNextSpotAlpha'  :  "`]",
          \ 'GotoPrevSpotAlpha'  :  "`[",
          \ 'GotoNextLineByPos'  :  "]'",
          \ 'GotoPrevLineByPos'  :  "['",
          \ 'GotoNextSpotByPos'  :  "mn",
          \ 'GotoPrevSpotByPos'  :  "mp",
          \ 'GotoNextMarker'     :  "[+",
          \ 'GotoPrevMarker'     :  "[-",
          \ 'GotoNextMarkerAny'  :  "]=",
          \ 'GotoPrevMarkerAny'  :  "[=",
          \ 'ListLocalMarks'     :  "ms",
          \ 'ListLocalMarkers'   :  "m?"
          \ }
" }}}
" vim-session {{{
  " 设置环境保存项
  " set sessionoptions="blank,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
  let g:session_autoload='yes'
  let g:session_autosave='yes'
  let g:session_command_aliases=1
" }}}
" }}} Plugin Settings
" Appearance {{{
" 配色方案 color
set background=dark
" color scheme
" if has('gui_running')
  " colorscheme solarized
  colorscheme molokai
" endif
"
" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch

" 显示80行标记
set colorcolumn=80

" 显示空白标记
:set listchars=eol:↵,tab:>-,trail:~,extends:>,precedes:<,space:･
:set list

" Manual color
" highlight NonText guifg=#4a4a59
" highlight SpecialKey guifg=white guibg=#cc0000
highlight Visual ctermfg=None ctermbg=gray
if g:os == "Darwin"
  set guifont=YaHei\ Consolas\ Hybrid:h14
elseif g:os == "Linux"
  set guifont=YaHei\ Consolas\ Hybrid\ h14
endif
" }}} Appearance
" Shortcuts {{{
" 定义ESC
call arpeggio#map('i', '', 0, 'jk', '<esc>')
" 定义快捷键到行首和行尾
nmap <leader>B 0
nmap <leader>E $
" 定义关闭buffer不关闭split
nnoremap <silent> <leader>q :bp<bar>sp<bar>bn<bar>bd<cr>
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至vim
nmap <leader>p "+p
" 设置快捷键遍历子窗口
" 依次遍历
nnoremap ww <C-W><C-W>
" 跳转至右方的窗口
nnoremap <c-l> <C-W>l
" 跳转至方的窗口
nnoremap <c-h> <C-W>h
" 跳转至上方的子窗口
nnoremap <c-k> <C-W>k
" 跳转至下方的子窗口
nnoremap <c-j> <C-W>j
" 启用:Man命令查看各类man信息
source $VIMRUNTIME/ftplugin/man.vim
" 定义:Man命令查看各类man信息的快捷键
nmap <Leader>man :Man 3 <cword><CR>
" }}} Shortcuts
" After {{{
" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
" }}}
