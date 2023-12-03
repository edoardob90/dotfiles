" Neovim init script
"
" Date: 16 aug 2018
" Author: Edoardo Baldi (edoardob90@gmail.com)
"
" Purpose: clean and purge the old vimrc script, which is sourced as a whole
" by Neovim right now.
" Add only the stuff I *really* need and understand. Narrow down the seleciton
" of plugins.
"
"
"
" Disable old features compatibility
set nocompatible

" Set up my plugin manager
" 1) check if vim-plug is installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" 2) start vim-plug itself
call plug#begin('~/.vim/myplugins')

" --------
" plugins
" --------
" sensible defaults: all the stuff the should be by default active in every
" vim/neovim
Plug 'tpope/vim-sensible'

" Surround plugin for matching symbols
Plug 'tpope/vim-surround'

" Commentary (comment text object)
Plug 'tpope/vim-commentary'

" Status bar
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" distraction free writing with vim
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" GIT plugins
" Tracking git changes
Plug 'airblade/vim-gitgutter'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Scratch space
Plug 'mtth/scratch.vim'

" Colorschemes
Plug 'catppuccin/nvim', {'as': 'catppuccin'}

" Various language packs for syntax
Plug 'sheerun/vim-polyglot'

" Markdown
Plug 'reedes/vim-pencil'

" Modern replacement for matchit
Plug 'andymass/vim-matchup'

" Linting (Python, C++, ...)
Plug 'neomake/neomake'

" chezmoi syntax
Plug 'alker0/chezmoi.vim'

" wildmenu enhanced completion
if has('nvim')
    function! UpdateRemotePlugins(...)
        " Needed to refresh runtime files
        let &rtp=&rtp
        UpdateRemotePlugins
    endfunction

    Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }
else
    Plug 'gelguy/wilder.nvim'
endif

" enhanced search: shows number of matches and navigates through them
Plug 'kevinhwang91/nvim-hlslens'

" specific folding rules for YAML files
Plug 'pedrohdz/vim-yaml-folds'

" show indent lines
Plug 'lukas-reineke/indent-blankline.nvim'

" auto-pairs characters, not only parenthesis
Plug 'windwp/nvim-autopairs'

" ncm2 completion engine
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'

" auto-formatting
Plug 'vim-autoformat/vim-autoformat'

" GitHub Copilot
Plug 'github/copilot.vim'

" Wolfram Language syntax support
Plug 'voldikss/vim-mma'

" ---------------
" end of plugins
" ---------------
call plug#end()


"------------------------------------------
" general settings
"------------------------------------------

" set python3 intepreter (better now than later)
let g:python3_host_prog = "/Users/edoardo/.pyenv/versions/nvim/bin/python"

" now the general settings (tabs, spaces, bells, backgrounds...)
set autoindent            " indented text
set autoread              " pick up external changes to files
set autowrite             " write files when navigating with :next/:previous
set background=dark       " default background for color schemes
set belloff=all           " bells are annoying
set breakindent           " wrap long lines *with* indentation
set noswapfile            " avoid creating .swp files
set noshowmode            " don't show modes, useless with alternative status bars plugins
set clipboard=unnamedplus " use y and p with the system clipboard
set mouse=a               " enable mouse support (all modes)

" utf
set encoding=utf-8

" swap between buffers without needing to save
set hidden

" none of these are word dividers
set iskeyword+=_,#

" line numbers
set number
set relativenumber

" optimize macro execution by not redrawing until macro is finished
set lazyredraw

" hilight tabs and trailing spaces
set list
set listchars=tab:-.,trail:.

" show matching brackets
set showmatch

" leave 10 rows of space when scrolling
set scrolloff=10

" text formatting
set expandtab
set softtabstop=2
set shiftwidth=4
set tabstop=4         " make real tabs 4 wide
set showbreak=\\\\\   " use this to wrap long lines
" set foldmethod=manual " manual folding
set matchpairs=(:),{:},[:],<:>
" folding
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2

" splitting windows
set splitbelow        " Split below current window
set splitright        " Split window to the right

" wrap long lines
set wrap

" Tell vim to remember certain things when we exit
" '10  :  marks will be remembered for up to 10 previously edited files
" "100 :  will save up to 100 lines for each register
" :20  :  up to 20 lines of command-line history will be remembered
if !has("nvim")
    set viminfo='10,\"100,:20,%,n~/.viminfo
else
    " Do nothing to use nvim default
    " or something like:
    "   set viminfo+=n~/.shada
endif

" restore position based on info saved in viminfo
augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" When you type the first tab, it will complete as much as possible, the second
" tab hit will provide a list, the third and subsequent tabs will cycle through
" completion options so you can complete the file without further keys
set wildmode=longest,list,full
" completion with menu
set wildmenu

" Sometimes, $MYVIMRC does not get set even though the vimrc is sourced
" properly. So far, I've only seen this on Linux machines on rare occasions.
if has("unix") && strlen($MYVIMRC) < 1 && !has('nvim')
  let $MYVIMRC=$HOME . '/.vimrc'
endif

" backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Maintain undo history between sessions
" From the book 'Modern Vim', TIP 24, p.99
set undofile
" Set directory if using vim; neovim uses $XDG_DATA_HOME/nvim/undo or
" $HOME/.local/share/nvim/undo is the env variable is not set
if !has('nvim')
    set undodir=~/.vim/undo
endif
augroup vimrc
    autocmd!
    autocmd BufWritePre /tmp/* setlocal noundofile
augroup END

" Python code indent
" (relies on the helper function GetGooglePythonIndent, see below in
" respective section)
setlocal indentexpr=GetGooglePythonIndent(v:lnum)
let s:maxoff = 50 " maximum number of lines to look backwards.
let pyindent_nested_paren="&sw*2"
let pyindent_open_paren="&sw*2"

" Trigger auto-format with F3
noremap <F3> :Autoformat<CR>


"------------------------------------------
" terminal configuration
"------------------------------------------
if !has("gui_running") && !has("nvim")
    " Note, Neovim cursor shape and 24-bit true colors work without any
    " help required; the following 'help' is for terminal Vim only. 

    " if tmux
    if &term == 'screen-256color' || &term == 'screen'
        " Change the cursor to an I-beam when in insert mode.
        let &t_SI = "\<Esc>Ptmux;\<Esc>\e[6 q\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
        " Make CTRL-Left/Right work inside tmux.
        execute "set <xRight>=\e[1;*C"
        execute "set <xLeft>=\e[1;*D"
        " Make Vim *set termguicolors* work inside tmux.
        set t_8b=[48;2;%lu;%lu;%lum
        set t_8f=[38;2;%lu;%lu;%lum
    " else not tmux
    else
        " Change the cursor to an I-beam when in insert mode.
        let &t_SI = "\e[6 q"
        let &t_EI = "\e[2 q"
    endif
endif

"------------------------------------------
" search options
"------------------------------------------
" search as characters are entered
set incsearch
" highlight matches
set hlsearch
" ignore case
set ignorecase
" ... unless you type a capital
set smartcase


" hilight current line by making the row number on the lhs stand out
set cursorline
hi CursorLine ctermbg=NONE cterm=NONE term=NONE
hi CursorLineNr ctermfg=117 ctermbg=236  term=bold cterm=bold

"------------------------------------------
" key bindings
"------------------------------------------
" set leader to space
let mapleader = "\<Space>"
let maplocalleader = ","

" :W sudo saves the file
command! W w !sudo tee % > /dev/null

" hit leader then 'e' to reload files that have changed outside the editor
nnoremap <leader>e :edit<CR>

" hit leader then 'n' to remove line numbers
" nnoremap <leader>n :set nu!<CR>
" nnoremap <leader>nr :set norelativenumber<CR>

" hit space space to remove hilights from previous search
nnoremap <leader><Space> :nohlsearch<CR>
" space+c to count the occurences of the latest searched pattern
nnoremap <leader>c :%s///gn<CR>

" use the combination jk to exit insert mode
" ... easier than reaching up for the escape key
inoremap jk <ESC>

" quickly exit
nnoremap <leader>q :q<CR>
" save everything and exit
nnoremap <leader>Q :wqa<CR>
" force write
nnoremap <leader>w :w!<CR>

" turn paste on
" this ignores indentation rules when pasting
nnoremap <leader>P :set paste! paste?<CR>

" make left and right keys cycle between tabs
nnoremap <leader><Right> :tabnext<CR>
nnoremap <leader><Left>  :tabprev<CR>

" this makes vim's regex search not stupid
"nnoremap / /\v
"vnoremap / /\v

" edit and source vimrc on the fly
noremap <leader>V :e! $MYVIMRC<CR>
noremap <silent><leader>E :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Y should behave like C and D, yank from cursor till end of line
noremap Y y$

" Center search when navigating
noremap n nzz
noremap N Nzz

" Confirm quit
noremap <C-q> :confirm qall<CR>

" Delete previous word when in insert mode via Ctrl-b
inoremap <C-b> <C-O>diw

" ----------------------------------
"  Window management
" ----------------------------------
"set wh=30
"set wiw=30
"set winminheight=1
"set winminwidth=10

nnoremap <silent> <leader>s  :split<CR>
nnoremap <silent> <leader>n  :new<CR>
nnoremap <silent> <leader>v  :vsplit<CR>
nnoremap <silent> <leader>t  :$tabnew<CR>

nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent><leader>+ :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent><leader>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" -----------------
" Helper functions
" -----------------
" Check where we left off before closing
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Indent Python helper function
function GetGooglePythonIndent(lnum)
  " Indent inside parens.
  " Align with the open paren unless it is at the end of the line.
  " E.g.
  "   open_paren_not_at_EOL(100,
  "                         (200,
  "                          300),
  "                         400)
  "   open_paren_at_EOL(
  "       100, 200, 300, 400)
  call cursor(a:lnum, 1)
  let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
        \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
        \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
        \ . " =~ '\\(Comment\\|String\\)$'")
  if par_line > 0
    call cursor(par_line, 1)
    if par_col != col("$") - 1
      return par_col
    endif
  endif

  " Delegate the rest to the original function.
  return GetPythonIndent(a:lnum)

endfunction


"------------------------------------------
" color settings
"------------------------------------------
" set gui colors for vim terminal (if VIM supports it)
if exists('+termguicolors')
    set termguicolors
endif

"------------------------------------------------
" plugin specific settings (when and if needed)
"------------------------------------------------

" scratch
" open scratch on the side
let g:scratch_horizontal = 0
let g:scratch_top = 0
let g:scratch_height = 50

" ------------
" ncm2
" ------------
augroup NCM2
  autocmd!
  " enable ncm2 for all buffers
  autocmd BufEnter * call ncm2#enable_for_buffer()
  " :help Ncm2PopupOpen for more information
  set completeopt=noinsert,menuone,noselect
  " When the <Enter> key is pressed while the popup menu is visible, it only
  " hides the menu. Use this mapping to close the menu and also start a new line.
  " inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
  " Use <TAB> to select the popup menu:
  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
augroup END


" ------------
"  Vim Pencil
" ------------
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,md call pencil#init()
  autocmd FileType text         call pencil#init({'wrap': 'hard'})
augroup END


" ------------
"  Neomake
" ------------
" when to activate neomake
" depending if on battery power
function! OnBattery()
  if has('macunix')
    return match(system('pmset -g batt'), "Now drawing from 'Battery Power'") != -1
  elseif has('unix')
    return readfile('/sys/class/power_supply/AC/online') == ['0']
  endif
  return 0
endfunction

if OnBattery()
  call neomake#configure#automake('w')
else
  call neomake#configure#automake('nrw', 500)
endif

" configure error/warning message and ignore some warnings
let g:neomake_python_pylint_maker = {
  \ 'args': [
  \ '-d', 'C0301',
  \ '-f', 'text',
  \ '--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg}"',
  \ '-r', 'n'
  \ ],
  \ 'errorformat':
  \ '%A%f:%l:%c:%t: %m,' .
  \ '%A%f:%l: %m,' .
  \ '%A%f:(%l): %m,' .
  \ '%-Z%p^%.%#,' .
  \ '%-G%.%#',
  \ }

" which linter to enable for Python source file linting
let g:neomake_python_enabled_makers = ['pylint']


" -----------
" wilder.nvim
" -----------
call wilder#setup({'modes': [':', '/', '?']})

" Popup menu renderer
call wilder#set_option('renderer', wilder#popupmenu_renderer({
      \ 'highlighter': wilder#basic_highlighter(),
      \ }))


" ---------------------------------------------------
" other settings
" ---------------------------------------------------

" Python3 executable

" YAML file type
" Set tabstop=2 by default
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" chezmoi: run `chezmoi apply` whenever I edit a dotfile in VIM
"autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path %

" ---------------------------------------------------
" lua stuff
" ---------------------------------------------------
lua require("theme")
lua require("plugins.settings")
