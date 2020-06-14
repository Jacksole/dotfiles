set nocompatible              " required
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
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mikelue/vim-maven-plugin'
Plugin 'tmhedberg/simpylfold'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-surround'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plugin 'junegunn/fzf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'w0rp/ale'
Plugin 'airblade/vim-gitgutter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'skywind3000/gutentags_plus'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'tpope/vim-heroku'
Plugin 'preservim/nerdcommenter'
Plugin 'tibabit/vim-templates'
Plugin 'fatih/vim-go'
" Use release branch (recommend)
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'ryanoasis/vim-devicons'
" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set splitbelow
set splitright
set nu
set tags=tags
set showmode
set showcmd
set modeline
set ruler
set title

let g:better_whitespace_enabled=1

" Spell Checker
set spell
set spellfile=~/.vim/spell/en.utf-8.add

" Switch tabs
map 8 <Esc>:tabe
map 9 gT
map 0 gt

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

let g:SimpylFold_docstring_preview=1

let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 1
let g:SimpylFold_fold_import = 1

let python_highlight_all=1
syntax on

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

let g:user_emmet_mode='a' "enable emmet all function in all mode."
let g:user_emmet_leader_key='<C-Y>,'

if has('gui_running')
 set background=dark
 colorscheme industry
else
 colorscheme zenburn
endif

call togglebg#map("<F2>")

" Activate Fuzzy Finder
map ; :Files<CR>

" NERDTree Customizations
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <C-o> :NERDTreeToggle<CR>

let g:NERDTreeIndicatorMapCustom = {
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
let s:darkBlue = "#44788E"
let s:purple = "#834F79"
let s:lightPurple = "#834F79"
let s:red = "#AE403F"
let s:beige = "#F5C06F"
let s:yellow = "#F09F17"
let s:orange = "#D4843E"
let s:darkOrange = "#F16529"
let s:pink = "#CB6F6F"
let s:salmon = "#EE6E73"
let s:green = "#8FAA54"
let s:lightGreen = "#31B53E"
let s:white = "#FFFFFF"
let s:rspec_red = '#FE405F'
let s:git_orange = '#F54D27'

let g:NERDTreeSyntaxEnabledExtensions = ['c', 'h', 'c++', 'cpp', 'php', 'rb', 'js', 'css', 'html', 'py']
let g:NERDTreeExtensionHighlightColor = {} "needed to avoid errors
let g:NERDTreeExtensionHighlightColor['css'] = s:blue "sets css files to blue
let g:NERDTreeExtensionHighlightColor['py'] = s:lightPurple "sets python to lightPurple
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
nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk
nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterUndoHunk

" Generate tags
set statusline+=%{gutentags#statusline()}

 " For jumping to tags in CtrlP
 nnoremap <leader>. :CtrlPTag<cr>
  " enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']

  " config project root markers.
let g:gutentags_project_root = ['.root']

  " generate datebases in my cache directory, prevent gtags files polluting my
  " project
let g:gutentags_cache_dir = expand('~/.cache/tags')

  " change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1

" Template Management
let g:tmpl_search_paths = ['~/templates']
let g:tmpl_author_email = 'leaundre.jackson87@gmail.com'
let g:tmpl_author_name = 'Le Aundre Jackson'
let g:lsc_auto_map = v:true

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

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
