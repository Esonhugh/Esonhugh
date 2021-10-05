" standard Profile of other commands
"
packadd termdebug
highlight Search ctermbg=yellow ctermfg=black 
highlight IncSearch ctermbg=black ctermfg=yellow 
highlight MatchParen cterm=underline ctermbg=NONE ctermfg=NONE
" 设置在 Vim 中可以使用鼠标 防止在 Linux 终端下无法拷贝
set mouse=a
" not use the vi compatible mode
set nocompatible
" set ESC to clear the highlght search in current
nnoremap <esc> :noh<return><esc>
set title " 修改终端标题
set relativenumber 
syntax on
syntax enable
set hlsearch
set number
set smartindent
set showmode
set bg=dark
set incsearch
set helplang=cn
"开启highlight 光标
autocmd InsertEnter * set ruler
" auto highlight line and column
autocmd InsertEnter * set nocursorcolumn
autocmd InsertLeave * set cursorcolumn
autocmd InsertLeave * set cursorline
autocmd InsertEnter * set nocursorline
inoremap <C-Space> <C-x><C-o>
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" auto match 
autocmd InsertEnter * set noshowmatch
autocmd InsertLeave * set showmatch
" highlight format 3 plans 
" PLAN 1
" highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
" highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
" PLAN 2
highlight CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
highlight CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" PLAN 3
" highlight CursorLine   cterm=reverse gui=reverse ctermfg=white guibg=NONE guifg=NONE
" highlight CursorColumn cterm=reverse gui=reverse ctermfg=red guibg=NONE guifg=NOE
"	express:
"	highlght 主要是用来配色的，包括语法高亮等个性化的配置。可以通过:h highlight，查看详细信息
"	CursorLine 和 CursorColumn 分别表示当前所在的行列
"	cterm 表示为原生vim设置样式，设置为NONE表示可以自定义设置。
"	ctermbg 设置终端vim的背景色
"	ctermfg 设置终端vim的前景色
"	guibg 和 guifg 分别是设置gvim的背景和前景
"
"
set ignorecase smartcase " 搜尋時忽略大小寫，但在有一個或以上大寫字母時仍保持對大小寫敏感
set linebreak "設定單詞不跨行
set incsearch
set showmatch
set cmdheight=2 " 設定命令列的行數為 1
set laststatus=2 " 顯示狀態列 (預設值為 1, 無法顯示狀態列)
" set foldmethod=syntax " 設定語法摺疊
set guifont=Courier\ New:h10
" 显示光标当前位置
set ruler 
" set listchars=tab:>-,trail:-
" 设置编码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936,acsii
set termencoding=utf-8
set encoding=utf-8
filetype plugin on
filetype indent on
"
"1 no highlight searching result
"set nohlsearch
"2 no current column highlight
"set nocursorcolumn
"3 no current line highlight
"set nocursorline
"
" ___________________________________






" Plug profile
call plug#begin('~/.vim/plugged')
"
"
Plug 'beeender/Comrade'
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'itchyny/lightline.vim'
" auto pairs
Plug 'jiangmiao/auto-pairs'
" auto pairs
let g:AutoPairs = {
			\'(':')',
			\'[':']',
			\'{':'}',
			\"'":"'",
			\'"':'"',
			\"<":">",
			\
			\}
" AutoPairs profile end






" rainbow_parentheses 
Plug 'kien/rainbow_parentheses.vim'
" rainbow_parentheses profile
autocmd VimEnter,WinNew * RainbowParenthesesToggle
autocmd InsertEnter * RainbowParenthesesToggle
" autoload
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" rainbow_parentheses end 
"




" Shougo/echodoc.vim   show the func param when you editing
Plug 'Shougo/echodoc.vim'
" show the func when you editing
" let g:echodoc#enable_at_startup = 1
" let g:echodoc#enable_force_overwrite = 1





"vim for some languages
"neovim LSP supports profile
"
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" Required for operations modifying multiple buffers like rename.
"set hidden
"
"ruby language server protoocl needs the gem file named
"solargraph 
"i found
"
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['solargraph', 'stdio'],
    \ 'go': ['gopls'],
    \ 'python' : ['pyright', 'stdio'],
    \ }
" 
"  \ 'go': ['gopls'],
" note that if you are using Plug mapping you should not use `noremap` mappings.
let g:LanguageClient_autoStop = 0
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

autocmd FileType ruby setlocal omnifunc=LanguageClient#complete
"autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()
autocmd FileType go setlocal omnifunc=LanguageClient#complete



"
"Run command 
"
"nvim +PlugInstall +UpdateRemotePlugins +qa 
"
"in shell to install this plugin. 
"
"Install corresponding language servers. 
"Restart neovim/vim and language services will be available right away. 
"Happy hacking!
"
"Go Plugins
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 0
let g:go_autodetect_gopath = 0
let g:go_auto_type_info=1
"Python plugins
Plug 'davidhalter/jedi-vim'
" disable the jedi complete and replaced with the deoplete jedi
let g:jedi#completions_enabled = 1
"    Jedi在插入模式下实时显示函数调用签名，
"    突出显示当前参数。呼叫签名可以显示为缓冲区中的弹出窗口（默认情况下设置为1（具有隐藏功能），
"    否则设置为2），其优点是易于引用（但这种方法有很多缺点，因为它会更改缓冲区的内容），
"    或者在Vim的命令行中与函数调用对齐（设置为2），
"    这可以提高Vim撤消历史记录的完整性
"    there 0 1 2 is "0" "1" "2"
let g:jedi#show_call_signatures = "2"
" Jedi selects the first line of the completion menu: for a better typing-flow and usually saves one keypress.
"let g:jedi#popup_select_first = 0
"
" If you are a person who likes to use VIM-splits, you might want to put this in your .vimrc:
"let g:jedi#use_splits_not_buffers = "left"
" This options could be "left", "right", "top", "bottom" or "winwidth". It will decide the direction where the split open.
"
Plug 'deoplete-plugins/deoplete-jedi'
" g:deoplete#sources#jedi#statement_length：
" 设置完成描述文本的最大长度。如果超出此范围，则使用简单描述。默认：50
" g:deoplete#sources#jedi#enable_typeinfo：
" 启用完成的类型信息。如果禁用它，您将获得更快的结果。默认：1
" g:deoplete#sources#jedi#enable_short_types：
" 启用短期完成类型。默认：0
" g:deoplete#sources#jedi#short_types_map：
" 短类型映射字典。默认：{ 'import': 'imprt', 
" 'function': 'def', 'globalstmt': 'var', 
" 'instance': 'var', 'statement': 'var', 
" 'keyword': 'keywd', 'module': 'mod', 
" 'param': 'arg', 'property': 'prop', 
" 'bytes': 'byte', 'complex': 'cmplx', 
" 'object': 'obj', 'mappingproxy': 'dict', 
" 'member_descriptor': 'cattr', 'getset_descriptor': 'cprop', 
" 'method_descriptor': 'cdef',
" }
" g:deoplete#sources#jedi#show_docstring：在预览窗口中显示文档字符串。默认：0
" g:deoplete#sources#jedi#python_path：设置用于完成服务器的Python解释器路径。它默认为“ python”，即第一个可用 python的$PATH。 注意：通常，这与Neovim的Python（:python）不同。
" g:deoplete#sources#jedi#extra_path：sys.path执行完成时要添加的其他路径的列表 。
" g:deoplete#sources#jedi#ignore_errors：忽略完成的绝地错误。默认：0
" g:deoplete#sources#jedi#ignore_private_members：从完成中忽略私人成员。默认：0
"
"Ruby 
Plug 'vim-ruby/vim-ruby'
" auto complete settings
"Notes:
" - Vim will load/evaluate code in order to provide completions.  This may
"   cause some code execution, which may be a concern.  This is no longer
"   enabled by default, to enable this feature add >
let g:rubycomplete_buffer_loading = 1
"< - In context 1 above, Vim can parse the entire buffer to add a list of
"  classes to the completion results.  This feature is turned off by default,
"  to enable it add >
     let g:rubycomplete_classes_in_global = 1
"<   to your vimrc
" - In context 2 above, anonymous classes are not supported.
" - In context 3 above, Vim will attempt to determine the methods supported by
"   the object.
" - Vim can detect and load the Rails environment for files within a rails
"   project.  The feature is disabled by default, to enable it add >
let g:rubycomplete_rails = 1
"<   to your vimrc
" - Vim can parse a Gemfile, in case gems are being implicitly required.  To
"   activate the feature: >
let g:rubycomplete_load_gemfile = 1
"<   To specify an alternative path, use: >
let g:rubycomplete_gemfile_path = 'Gemfile.aux'
"<   To use Bundler.require instead of parsing the Gemfile, set: >
let g:rubycomplete_use_bundler = 1
"<   To use custom paths that should be added to $LOAD_PATH to correctly
"   resolve requires, set: >
"     let g:rubycomplete_load_paths = ["/path/to/code", "./lib/example"]





" Here is the Plug called the NCM2 auto completions
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
" assuming you're using vim-plug: https://github.com/junegunn/vim-plug
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-neoinclude' | Plug 'Shougo/neoinclude.vim'
" NCM2 over!
" This is the markdownPreview .config
" If you don't have nodejs and yarn
" use pre build, add 'vim-plug' to the filetype list so vim-plug can update this plugin
" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
" profile of the NCM2 
    " suppress the annoying 'match x of y', 'The only match' and 'Pattern not
    " found' messages
    set shortmess+=c
    " CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
    inoremap <c-c> <ESC>
    " When the <Enter> key is pressed while the popup menu is visible, it only
    " hides the menu. Use this mapping to close the menu and also start a new
    " line.
    " inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
    " Use <TAB> to select the popup menu:
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    " wrap existing omnifunc
    " Note that omnifunc does not run in background and may probably block the
    " editor. If you don't want to be blocked by omnifunc too often, you could
    " add 180ms delay before the omni wrapper:
    "  'on_complete': ['ncm2#on_complete#delay', 180,
    "               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
    au User Ncm2Plugin call ncm2#register_source({
            \ 'name' : 'css',
            \ 'priority': 9,
            \ 'subscope_enable': 1,
            \ 'scope': ['css','scss'],
            \ 'mark': 'css',
            \ 'word_pattern': '[\w\-]+',
            \ 'complete_pattern': ':\s*',
            \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
            \ })
" the NCM2 over



" If you have nodejs and yarn
" markdownPreview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install'  }
" here is the config of the markdownPreview
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0
" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1
" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0
" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0
" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 1
" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''
" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''
" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 1
" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''
" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }
" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''
" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''
" use a custom port to start server or random for empty
let g:mkdp_port = '12345'
" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'
" recognized filetypes
" these filetypes will have MarkdownPreview... commands
" let g:mkdp_filetypes = ['markdown',"md"]
" markdownPreview over



call plug#end()




" alias commands
" RainBow -> RainbowParenthesesToggle
cnoreabbrev Rainbow RainbowParenthesesToggle
" Markdown -> MarkdownPreview
cnoreabbrev Markdown MarkdownPreview
" Install -> PlugUpdate
cnoreabbrev Install PlugUpdate
" Gdb -> termdebug
cnoreabbrev Gdb Termdebug
" alias over

" EOF 
