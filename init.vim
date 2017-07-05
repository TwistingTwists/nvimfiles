"NeoBundle Scripts-----------------------------
set runtimepath+=/home/fuelen/.config/nvim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('/home/fuelen/.config/nvim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" colorscheme & syntax highlighting
NeoBundle 'KeitaNakamura/neodark.vim'
NeoBundle 'Yggdroot/indentLine'        " prints vertical lines at each indentation level
NeoBundle 'Raimondi/delimitMate'       " automatic closing of quotes
NeoBundle 'Valloric/MatchTagAlways'    " highlight XML/HTML tags that enclose your cursor location
NeoBundle 'lilydjwg/colorizer'         " highlight colors in css files
NeoBundle 'mxw/vim-jsx'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'slashmili/alchemist.vim'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'joker1007/vim-ruby-heredoc-syntax'
NeoBundle 'kchmck/vim-coffee-script' " I don't need coffee, but plugin above needs this
" NeoBundle 'ryanoasis/vim-devicons'
" NeoBundle 'elzr/vim-json'

" Git
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'

" File Manager
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'

" Utils
NeoBundle 'bling/vim-airline'      " status-bar
NeoBundle 'tpope/vim-surround'     " for manipulation with quotes :)
NeoBundle 'tomtom/tcomment_vim'    " commenter
NeoBundle 'AndrewRadev/switch.vim' " useful switcher
NeoBundle 'Chiel92/vim-autoformat' " + install ruby-beautify gem
NeoBundle 'dkprice/vim-easygrep'   " Fast and Easy Find and Replace Across Multiple Files
NeoBundle 'w0rp/ale'               " Syntax checker
NeoBundle 'ngmy/vim-rubocop'       " code-style checker for ruby
NeoBundle 'Shougo/deoplete.nvim'   " autocompletion plugin (NeoVim)
NeoBundle 'Shougo/neco-vim'        "  search in source for deoplete
NeoBundle 'Shougo/neoinclude.vim'  " search in included files for deoplete
NeoBundle 'Shougo/neco-syntax'     " search in syntax for deoplete
NeoBundle 'tpope/vim-endwise'      " autocomplete ruby blocks
NeoBundle 'junegunn/fzf'           " fuzzy finder
NeoBundle 'ashisha/image.vim'      " view images as ASCII

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

"------------------Settings--------------------

syntax enable

colorscheme neodark
let g:airline_theme='neodark'
let g:airline_powerline_fonts=1
" use git against backup files
set nobackup
set nowritebackup
set noswapfile

set autoread " autoreload files (when change branch on git)

set title " show filename in title
set scrolloff=3 " minimum indentation from top/bottom of screen to highlighted result on searching

set number " show numbers
set history=1000
set nowrap " disable wrapping strings (when they very long)

" show spaces and tabs
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

" autocmd FileType nerdtree setlocal nolist
" let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
" let g:WebDevIconsUnicodeGlyphDoubleWidth = 0

set splitbelow splitright " where new split must be created
set hidden " allow hidden buffers
set colorcolumn=110 " width like on github
set cursorline " highlight whole line under cursor, but makes vim very slow

set undofile " undo changes between sessions

" set tab size
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab " replace tabs to spaces
set smarttab " only even number of spaces (3 spaces + tab = 4 spaces, 2 spaces + tab = 4 spaces)

set clipboard=unnamedplus " use system clipboard

" enable autocomplete
let g:deoplete#enable_at_startup = 1

"-----------------Mappings----------------------
" set leader button
let mapleader = ","
let g:mapleader = ","
" replace default search with search by regex
nnoremap / /\v
vnoremap / /\v
set ignorecase

" Turn off arrow keys (this might not be a good idea for beginners, but it is
" the best way to ween yourself of arrow keys on to hjkl)
" http://yehudakatz.com/2010/07/29/everyone-who-tried-to-convince-me-to-use-vim-was-wrong/
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>"
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Map ESC
imap jj <ESC>
" move between splits by tab
nnoremap <Tab> <C-w>w
" turn search highlight off
nnoremap <leader><space> :noh<cr>

" open file browser
map <leader>p :NERDTreeToggle<cr>
" set cursor in file browser on current file
map <C-f> :NERDTreeFind<cr>

" Easy commenting
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

" navigate through autocomplete menu (Deoplete)
inoremap <C-k> <C-Up>
inoremap <C-j> <C-Down>

" switch on -
let g:switch_mapping = "-"

" no comment :)
noremap === :Autoformat<CR>

" shortkey for fuzzy finder
nnoremap z :FZF<CR>

" set custom config file for RuboCop
let g:vimrubocop_config = '~/.config/nvim/rubocop.yml'

" Settings for syntastic (from readme)
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" add tags highlighting to js
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'javascript' : 1,
    \}

" for json quotes
let g:indentLine_concealcursor=""
cd ~/projects " set default working directory
