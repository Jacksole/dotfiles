filetype off                  " required
set encoding=utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'mattn/emmet-vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'ap/vim-css-color'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'mileszs/ack.vim'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'chrisbra/csv.vim'
Plugin 'natebosch/vim-lsc'
Plugin 'natebosch/vim-lsc-dart'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'reedes/vim-colors-pencil'
Plugin 'preservim/nerdtree'
Plugin 'davidhalter/jedi-vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tmhedberg/simpylfold'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'deoplete-plugins/deoplete-asm'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-surround'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'mg979/vim-visual-multi'
Plugin 'w0rp/ale'
Plugin 'airblade/vim-gitgutter'
Plugin 'airblade/vim-rooter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'skywind3000/gutentags_plus'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'tpope/vim-heroku'
Plugin 'preservim/nerdcommenter'
Plugin 'tibabit/vim-templates'
Plugin 'fatih/vim-go'
Plugin 'sotte/presenting.vim'
Plugin 'dbeniamine/cheat.sh-vim'
Plugin 'mipmip/vim-scimark'
" Use release branch (recommend)
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codereview'
Plugin 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'
Plugin 'ryanoasis/vim-devicons'
" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
call glaive#Install()
filetype plugin indent on    " required
syntax on
set noerrorbells
set autoindent
set smartcase
set incsearch
set splitbelow
set splitright
set signcolumn=yes
set nu
set tags=tags
set showmode
set showcmd
set modeline
set ruler
set title
set backspace=start,eol,indent
let g:better_whitespace_enabled=1

" Spell Checker
set spell
set spellfile=~/.vim/spell/en.utf-8.add

" Switch tabs
map 8 <Esc>:tabe
map 9 gT
map 0 gt

" Testing rounded separators (extra-powerline-symbols):
let g:airline_left_sep = "\uE0B4"
let g:airline_right_sep = "\uE0B6"

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Setting learder key
let mapleader=" "

" Mapping Esc to CAPS Lock

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

let g:SimpylFold_docstring_preview=1

let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 1
let g:SimpylFold_fold_import = 1

let python_highlight_all=1

" Add a space in a characters
nnoremap ss i<space><esc>

" Set Vim Background Translucent
let t:is_transparent = 0
function! Toggle_transparent_background()
  if t:is_transparent == 0
    hi Normal guibg=#111111 ctermbg=black
    let t:is_transparent = 1
  else
    hi Normal guibg=NONE ctermbg=NONE
    let t:is_transparent = 0
  endif
endfunction
nnoremap <C-x><C-t> :call Toggle_transparent_background()<CR>

" Python formatting
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=79

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Running Python in VIM
autocmd FileType python map <buffer> <F12> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F12> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" Full Stack Development
au BufNewFile,BufRead *.js, *.html, *.css set tabstop=2
au BufNewFile,BufRead *.js, *.html, *.css set softtabstop=2
au BufNewFile,BufRead *.js, *.html, *.css set shiftwidth=2
au BufNewFile,BufRead *.js, *.html, *.css set tabstop=2

" Emmet Settings
let g:user_emmet_mode='a' "enable emmet all function in all mode."
let g:user_emmet_leader_key='<c-l>,'

if has('gui_running')
 set background=dark
 colorscheme vim-colors-pencil
 else
 colorscheme industry
endif

call togglebg#map("<F2>")

" Activate Fuzzy Finder
map ; :Files<CR>

" NERDTree Customizations
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <C-o> :NERDTreeToggle<CR>

let g:NERDTreeGitStatusIndicatorMapCustom = {
      \ "Modified"  : "✹",
      \ "Staged"    : "✚",
      \ "Untracked" : "✭",
      \ "Renamed"   : "➜",
      \ "Unmerged"  : "═",
      \ "Deleted"   : "✖",
      \ "Dirty"     : "✗",
      \ "Clean"     : "✔",
      \ 'Ignored'   : '☒',
      \ "Unknown"   : "?"
      \ }


" you can add these colors to your .vimrc to help customizing
let s:brown = "#905532"
let s:aqua =  "#3AFFDB"
let s:blue = "#689FB6"
let s:darkBlue = "#00008E"
let s:RoyalBlue = "#4169E1"
let s:purple = "#800080"
let s:DarkMagenta= "#8B008B"
let s:red = "#FF0000"
let s:brown="#A52A2A"
let s:beige = "#F5F5DC"
let s:yellow = "#F09F17"
let s:orange = "#D4843E"
let s:darkOrange = "#F16529"
let s:pink = "#CB6F6F"
let s:salmon = "#EE6E73"
let s:green = "#8FAA54"
let s:lightGreen = "#31B53E"
let s:SlateGrey = "#708090"
let s:white = "#FFFFFF"
let s:rspec_red = '#FE405F'
let s:git_orange = '#F54D27'

let g:NERDTreeSyntaxEnabledExtensions = ['c', 'h', 'c++', 'cpp', 'php', 'rb', 'js', 'css', 'html', 'py']
let g:NERDTreeExtensionHighlightColor = {} "needed to avoid errors
let g:NERDTreeExtensionHighlightColor['css'] = s:blue "sets css files to blue
let g:NERDTreeExtensionHighlightColor['py'] = s:darkBlue "sets python to darkBlue
let g:NERDTreeExactMatchHighlightColor = {} "needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange
let g:NERDTreePatternMatchHighlightColor = {} "this line is needed to avoid
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets
let g:WebDevIconsDefaultFolderSymbolColor = s:beige "sets the color for
let g:WebDevIconsDefaultFileSymbolColor = s:blue "sets the color for files

" Javascript Customizations
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"

set conceallevel=1


" ALE formatting
let g:ale_linters = {
      \ 'python3': ['bandit', 'flake8', 'mypy'],
      \ 'javascript': ['eslint'],
      \ 'sql': ['sqlint'],
      \ 'tex': ['textlint'],
      \ 'yaml': ['yamllint'],
      \ 'cpp': ['clangd'],
      \ 'c': ['clangd'],
      \ 'json': ['jsonlint'],
      \ 'java': ['checkstyle'],
      \ 'html':['stylelint'],
      \ 'css': ['stylelint'],
      \ 'go': ['golint'],
      \ 'gitcommit': ['gitlint'],
      \ 'dockerfile': ['dockerfile_lint'],
      \ 'dart': ['dartanalyzer'],
      \}

" In ~/.vim/vimrc, or somewhere similar.
let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'javascript': ['prettier', 'eslint'],
      \   'python3': ['autopep8']
      \}

" Enable completion where available.
" This setting must be set before ALE is loaded.

" You should not turn this setting on if you wish to use ALE as a completion
" source for other completion plugins, like Deoplete.
let g:ale_completion_enabled = 1

let b:ale_fix_on_save = 1
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
let g:airline_theme='fairyfloss'

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
        \   '%dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

set statusline+=%{LinterStatus()}

 " Navigate to next error
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Git Gutter
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterUndoHunk

" Generate tags
set statusline+=%{gutentags#statusline()}

" For jumping to tags in CtrlP
nnoremap <leader>. :CtrlPTag<cr>

" enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']
let g:gutentags_add_default_project_roots = 0

  " config project root markers.
let g:gutentags_project_root = ['.root', 'package.json', '.git']

  " generate datebases in my cache directory, prevent gtags files polluting my
  " project
let g:gutentags_cache_dir = expand('~/.cache/tags')
  " change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_extra_args = [
      \ '--tag-relative=yes',
      \ '--fields=+ailmnS',
      \ ]

" C compile
map <leader>cp  :w <CR> :!gcc % -o %< && ./%< <CR>

let g:gutentags_ctags_exclude = [
      \ '*.git', '*.svg', '*.hg',
      \ '*/tests/*',
      \ 'build',
      \ 'dist',
      \ '*sites/*/files/*',
      \ 'bin',
      \ 'node_modules',
      \ 'bower_components',
      \ 'cache',
      \ 'compiled',
      \ 'docs',
      \ 'example',
      \ 'bundle',
      \ 'vendor',
      \ '*.md',
      \ '*-lock.json',
      \ '*.lock',
      \ '*bundle*.js',
      \ '*build*.js',
      \ '.*rc*',
      \ '*.json',
      \ '*.min.*',
      \ '*.map',
      \ '*.bak',
      \ '*.zip',
      \ '*.pyc',
      \ '*.class',
      \ '*.sln',
      \ '*.Master',
      \ '*.csproj',
      \ '*.tmp',
      \ '*.csproj.user',
      \ '*.cache',
      \ '*.pdb',
      \ 'tags*',
      \ 'cscope.*',
      \ '*.css',
      \ '*.less',
      \ '*.scss',
      \ '*.exe', '*.dll',
      \ '*.mp3', '*.ogg', '*.flac',
      \ '*.swp', '*.swo',
      \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
      \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
      \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
      \ ]


" Template Management
let g:tmpl_search_paths = ['~/templates']
let g:tmpl_author_email = 'leaundre.jackson87@gmail.com'
let g:tmpl_author_name = 'Le Aundre Jackson'

" Default keymap for vim-lsc
let g:lsc_auto_map = v:true

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_python_checkers = ['pylint']
let g:syntastic_checkers_markdown = ['textlint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


syntax enable
filetype plugin indent on

let g:vimspector_enable_mappings = 'HUMAN'
packadd! vimspector

nmap <F7> <Plug>VimspectorContinue
nmap <F8> <Plug>VimspectorStop
nmap <F9> <Plug>VimspectorRestart

" COC Settings

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not
" mapped by  other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
     \ pumvisible() ? "\<C-n>" :
     \ <SID>check_back_space() ? "\<TAB>" :
     \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location
" list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
     execute 'h '.expand('<cword>')
  else
     call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
" Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
" Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call  CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)

nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line
nmap <leader>qf <Plug>(coc-fix-current)
" Map function and class text objects

" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)

xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" B
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" Opening the COC config file
function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
       \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
       \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

" Use C to open coc config
call SetupCommandAbbrs('C', 'CocConfig')

" Fuzzy Finder Customizations
" Empty value to disable preview window altogether
let g:fzf_preview_window = ''

" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'"

" Cheat Sheet customization
let g:syntastic_javascript_checkers = [ 'jshint'  ]
let g:syntastic_ocaml_checkers = ['merlin']
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_shell_checkers = ['shellcheck']
let g:CheatSheetDefaultMode = 0
let g:CheatSheetProviders = ['syntastic', 'quickfix']
let g:CheatSheetFrameworks = {
     \ 'python' : ['python', 'django', ],
     \ 'javascript' : ['javascript', 'node', 'angular', 'jquery'],
     \ 'php' : ['php', 'symphony', 'yii', 'zend'],
     \}
" Opening URLs in VIM
let g:firefox_exe = '/mnt/c/Program Files/Mozilla Firefox/firefox.exe'

function OpenURL()
      normal "*yy
          " let result = getreg("x")
          "     " return result
          "         :execute "silent !start ".g:chrome_exe2." ".getreg("*")
          "         endfunction
          "
          "         map ,url :call OpenURL()<CR>
endfunction

map ,url :call OpenURL()<CR>

" pancake's exposee for vim:
let fs=0
function Exposee()
  if (g:fs == 0)
    res 1000
    vertical res 1000
    let g:fs=1
  else
    exe "normal \<C-W>="
    let g:fs=0
  xendif
endfunction
map <F10> :call Exposee()<cr>

"Make
map <F6> :make<cr>
map <C-F6> :cnext<cr>
map <S-F6> :cprevious<cr>

map <C-E> 2<C-W>+
map <C-R> 2<C-W>-
map <C-T> 2<C-W>>
map <C-Y> 2<C-W><

au BufNewFile,BufRead *.vala setf cs
au BufNewFile,BufRead *.vapi setf cs
au BufNewFile,BufRead *.gtkaml setf cs
au BufNewFile,BufRead *.gtkon setf cs

" Transparent editing of gpg encrypted files.
" " By Wouter Hanegraaff
augroup encrypted
  au!
  autocmd BufReadPre,FileReadPre *.gpg set viminfo=
  autocmd BufReadPre,FileReadPre *.gpg set noswapfile noundofile nobackup
  autocmd BufReadPre,FileReadPre *.gpg set bin
  autocmd BufReadPre,FileReadPre *.gpg let ch_save = &ch|set ch=2
  autocmd BufReadPost,FileReadPost *.gpg '[,']!gpg --decrypt 2> /dev/null
  autocmd BufReadPost,FileReadPost *.gpg set nobin
  autocmd BufReadPost,FileReadPost *.gpg let &ch = ch_save|unlet ch_save
  autocmd BufReadPost,FileReadPost *.gpg execute ":doautocmd BufReadPost " . expand("%:r")
  autocmd BufWritePre,FileWritePre *.gpg '[,']!gpg --default-recipient-self -ae 2>/dev/null
  autocmd BufWritePost,FileWritePost *.gpg u
augroup END

let g:presenting_top_margin = 2

" ack.vim --- {{{

" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search
" case sensitively otherwise"
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1

" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>/ :Ack!<Space>
" }}}

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>"
