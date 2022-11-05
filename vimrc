" Voici mon fichier de configuration.

" Sert à éviter la compatibilité avec vi
set nocompatible
set belloff=all
set expandtab
set textwidth=80
"NERDTree
"autocmd VimEnter * NERDTree 
"autocmd VimEnter * wincmd p 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"Fin NERDTree
" sert à mettre le curseur sur le texte
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
"set langmap=&1,é2,\"3,\'4,(5,-6,è7,_8,ç9,à0
set mouse=a
set fileformat=unix
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h, match BadWhitespace /\s\+$/
set showcmd
"set clipboard=unnamedplus
"Affichage --------------------------------------------------------------------------------
" Les ; sons rarement utilise l’un a la suite de l’autre
set title 
" Met a jour le titre de votre fenetre ou de votre terminal
set number " Affiche le numero des lignes
set ruler " Affiche la position actuelle du curseur
set wrap " Affiche les lignes trop longues sur plusieurs
" lignes
set scrolloff=3 " Affiche un minimum de 3 lignes autour du curseur
" (pour le scroll)
" -- Recherche
set ignorecase " Ignore la casse lors d’une recherche
set smartcase " Si une recherche contient une majuscule,
" re-active la sensibilite a la casse
set incsearch " Surligne les resultats de recherche pendant la
" saisie
set hlsearch " Surligne les resultats de recherche
" -- Beep
"set visualbell " Empeche Vim de beeper
set noerrorbells " Empeche Vim de beeper
" Active le comportement ’habituel’ de la touche retour en arriere
set backspace=indent,eol,start
" Cache les fichiers lors de l’ouverture d’autres fichiers
set hidden
" Active la coloration syntaxique

set background=dark
syntax enable
syntax on
" Active les comportements specifiques aux types de fichiers comme
" la syntaxe et l’indentation
filetype on
filetype plugin on
filetype indent on

" pop-punk ANSI colors for vim terminal
" let g:terminal_ansi_colors = pop_punk#AnsiColors()

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" permet le support des italics dans gruvbox(doit être placé avant)
"let g:gruvbox_contrast_dark="hard"
"let g:gruvbox_italic=1
colorscheme murphy
" permet d'eviter le doublon de --insertion--
set noshowmode

" for lightline theme - this needs underscore too
let g:lightline = {
      \ 'colorscheme': 'pop_punk',
      \ }

"permet de flag les tabs dans les fichiers pythons
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
"permet d'asssocier la commande python à python3
let g:pymode_python = 'python3'
"Mes mappings persos
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
let mapleader = " "
nnoremap <silent> <leader>a :echo 'Current time is ' . strftime('%c')<CR>
nnoremap <silent> <leader>r :source $MYVIMRC <CR> :let @/ = "" <CR>
nnoremap <silent> <leader>s :noh<CR>
nnoremap <silent> <leader>N :execute 'NERDTreeToggle ' . getcwd()<CR>
nnoremap <silent> <leader>p :REPLToggle<CR>
nnoremap <silent> <leader>c :PymodeLintAuto<CR>


"vim markdown


let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_stubs_command = ""
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = ""
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

let g:ale_completion_enabled = 0
" Check Python files with flake8 and pylint.
let g:ale_linters = {'python':['flake8','pydocstyle', 'bandit', 'mypy']}
" Fix Python files with autopep8 and yapf.
"let b:ale_fixers = ['autopep8', 'yapf']
let g:ale_fixers= {'*':[], 'python': ['black']}
" Disable warnings about trailing whitespace for Python files.
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_fix_on_save = 1
let maplocalleader = "ù"

" Run current file
nnoremap <buffer> <silent> <localleader>r :JupyterRunFile<CR>
nnoremap <buffer> <silent> <localleader>i :PythonImportThisFile<CR>

" Change to directory of current file
nnoremap <buffer> <silent> <localleader>d :JupyterCd %:p:h<CR>

" Send a selection of lines
nnoremap <buffer> <silent> <localleader>X :JupyterSendCell<CR>
nnoremap <buffer> <silent> <localleader>E :JupyterSendRange<CR>
nmap     <buffer> <silent> <localleader>e <Plug>JupyterRunTextObj
vmap     <buffer> <silent> <localleader>e <Plug>JupyterRunVisual

" Debugging maps
nnoremap <buffer> <silent> <localleader>b :PythonSetBreak<CR>

"change la version de python
set pyx=3
"active la touche retour en mode insertion
set backspace=indent,eol,start
" keep 211 lines of command line history
set history=200
"Permet l'autocompletion dans le menu commande
set wildmenu
"Pour avoir echap sexecuter plus rapidement
set ttimeout
set ttimeoutlen=100
"pour avoir lighline qui s'affiche
set laststatus=2
map Q gq
inoremap <C-U> <C-G>u<C-U>

if 1

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " Revert with ":filetype off".
  filetype plugin indent on

  " Put these in an autocmd group, so that you can revert them with:
  " ":augroup vimStartup | exe 'au!' | augroup END"
  augroup vimStartup
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

  augroup END

  " Quite a few people accidentally type "q:" instead of ":q" and get confused
  " by the command line window.  Give a hint about how to get out.
  " If you don't like this you can put this in your vimrc:
  " ":augroup vimHints | exe 'au!' | augroup END"
  augroup vimHints
    au!
    autocmd CmdwinEnter *
	  \ echohl Todo | 
	  \ echo 'Dumbass close it with ":q".' |
	  \ echohl None
  augroup END

endif


" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
  " Revert with ":syntax off".
  syntax on

  " I like highlighting strings inside C comments.
  " Revert with ":unlet c_comment_strings".
  let c_comment_strings=1
endif
"pour l ide python
let g:repl_ipython_version = '8.5.0'
let g:repl_program = {
			\	'python': ['python3'],
			\	'default': ['bash']
			\	}
let g:repl_cursor_down = 0
let g:repl_unhide_when_send_lines = 1
nnoremap <silent> <leader>o :REPLSendAll<CR>
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds
set relativenumber 


















" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

