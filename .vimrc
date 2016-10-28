set nocompatible   	" Disable vi-compatibility
set t_Co=256        " Use 256 Colors in terminal

filetype off		" required for Vundle
set rtp+=~/.vim/bundle/Vundle.vim " set runtime path to include Vundle
call vundle#begin() " init Vundle
Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required
Plugin 'vim-airline/vim-airline'
Plugin 'morhetz/gruvbox'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'mattn/emmet-vim'
Plugin 'mhinz/vim-startify'
Plugin 'sheerun/vim-polyglot'
Plugin 'posva/vim-vue'
Plugin 'valloric/MatchTagAlways'
Plugin 'Raimondi/delimitMate'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors' 
Plugin 'mileszs/ack.vim'
Plugin 'skwp/greplace.vim'
Plugin 'shawncplus/phpcomplete.vim' 
Plugin 'tobyS/vmustache'
Plugin 'tobyS/pdv'
Plugin 'NLKNguyen/copy-cut-paste.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-dispatch'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'benmills/vimux'
Plugin 'christoomey/vim-tmux-navigator'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Put your non-Plugin stuff after this line
set shell=/bin/zsh	" zsh is cooler than bash
set background=dark
colorscheme gruvbox
syntax enable

set guioptions-=m               " Removes top menu bar
set guioptions-=T               " Removes top toolbar
set guioptions-=r               " Removes right hand scroll bar
set guioptions-=L               " Removes left hand scroll bar
set guifont=Fira\ Mono\ Regular\ 13

set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set noerrorbells                " don't beep
set autowrite                   " save on buffer switch
set relativenumber              " show line numbers relative to cursor position
set virtualedit=onemore         " allow cursor to be placed after last character at end of line
set splitbelow                  " create split below when doing horizontal split
set splitright                  " create split on right when doing a vertical split
set incsearch
set timeout timeoutlen=200 ttimeoutlen=100

" Group all swp files and backups into a dir
set backupdir=~/.vim/backups
set directory=~/.vim/backups

" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

"tmux settings
nmap \r :VimuxPromptCommand<cr>
nmap \l :VimuxRunLastCommand<cr>
nmap \q :VimuxCloseRunner<cr>
nmap \i :VimuxInspectRunner<cr>
nmap \o :VimuxOpenPane<cr>
nmap \k :VimuxInterruptRunner<cr>
nmap \\ :VimuxInterruptRunner<cr>

"Easy escaping to normal mode
imap jk <esc>

" Note that remapping C-s requires flow control to be disabled
" (e.g. in .bashrc or .zshrc)
map <C-s> <esc>:wall<cr>
imap <C-s> <esc>:wall<cr>
nmap <leader>w :w<cr>
imap <leader>w :w<cr>
nmap <leader>q :q<cr>
map <C-t> <esc>:tabnew<cr>

nmap <leader>vr :edit ~/.vimrc<cr>
nmap <leader>zr :edit ~/.zshrc<cr>
nmap <leader>i3 :edit ~/.i3/config<cr>

"move an entire line or block of lines up or down
nnoremap <silent> <C-S-Up> :m .-2<cr>==
nnoremap <silent> <C-S-Down> :m .+1<cr>==
inoremap <silent> <C-S-Up> <esc>:m .-2<cr>==gi
inoremap <silent> <C-S-Down> <esc>:m .+1<cr>==gi
vnoremap <silent> <C-S-Up> :m '<-2<cr>gv=gv
vnoremap <silent> <C-S-Down> :m '>+1<cr>gv=gv

"Change directory to match current file ,cd
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>
nnoremap <leader>pd :pwd<cr>
"Reload the current buffer
nnoremap <leader>r :e!<cr> 

" Misc helpers
" Quickly add semi-colon to end of current line
nmap ;; A;<esc>
" Quickly add period to end of current line
nmap <leader>. A.<esc>
nmap <leader><space> i<space><esc>
nmap <leader>bd :bd %<cr>
" Quickly insert blank line
nnoremap <leader>o o<esc>
" Quickly move the text following the cursor to the line below
nmap <leader>j i<cr><esc>
" Open splits
nnoremap vs :vsplit<cr>
nnoremap sp :split<cr>
" Open new vertical split with a new buffer
nmap vns :new<cr>
" Open new horizontal split with a new buffer
nmap vns :vne<cr>

" Tab handling
set nohidden "remove file from buffer when closing tab
map <leader>l :tabnext<cr>
map <leader>h :tabprevious<cr>

" Easier window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Familiar copy/cut/paste to clipboard shortcuts
let g:copy_cut_paste_no_mappings = 1
nmap <C-c> <Plug>CCP_CopyLine
vmap <C-c> <Plug>CCP_CopyText
nmap <C-v> <Plug>CCP_PasteText

" Resize vsplit
map <leader>25 :vertical resize 40<cr>
map <leader>50 <c-w>=
map <leader>75 :vertical resize 120<cr>

" NerdTree Stuff
nmap <C-b> :NERDTreeToggle<cr>
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
"let g:NERDTreeMouseMode=2
let NERDTreeWinPos='right'
let NERDTreeMinimalUI=1
let NERDTreeBookmarksFile="~/.vim/NERDTreeBookmarks"
" Close vim if NERDTree is the only open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Custom global higlighting enabled for all colorscheme
"highlight CursorLineNr ctermfg=214 ctermbg=bg guibg=bg

" Airline Stuff
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set laststatus=2    " Always show the statusline
set showtabline=2   " Always show the tabline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Edit todo list for project
nmap <leader>todo vs :e todo.md<cr>

" common annoying typos
command! Q q " Bind :Q to :q
command! Qa qa 
command! W w
command! Wq wq

" disabled keys
map Q <Nop>

" Vim - Semi Hard Mode
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif
map <up> <nop>                  " no arrow key navigation
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Custom script to generate awesome ctags for Laravel projects
nmap <leader>ct :Make ~/dotfiles/scripts/laravel_ctags.sh .<cr>
nmap <leader>cc :!ctags .<cr>

" Use Silver Searcher instead of grep (Greplace settings)
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading --ignore node_modules --ignore vendor'
let g:ackprg = 'ag --vimgrep'
nmap <leader>s :Ack! '' ./<C-Left><Left><Left>

" CtrlP Stuff
" Make CtrlP use ag for listing the files. Way faster and no useless files.
" Use custom agignore file, skip vcs ignore files, show hidden files
let g:ctrlp_user_command = 'ag %s --path-to-ignore=/home/jay/.vim/.agignore -l -U --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0
nmap <leader>p :CtrlPBuffer<cr>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:20'

" EditorConfig Settings
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:EditorConfig_exec_path = '/usr/bin/editorconfig'

" GitGutter Settings
nnoremap <Leader>hp :GitGutterPreviewHunk<cr>

" PHP stuff
let php_htmlInStrings = 1  "Syntax highlight HTML code inside PHP strings.
let php_sql_query = 1      "Syntax highlight SQL code inside PHP strings.
let g:phpcomplete_mappings = {
  \ 'jump_to_def': '<leader>g',
  \ }

" PHP docblocks
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <leader>d :call pdv#DocumentWithSnip()<cr>

" Emmet Settings
let g:user_emmet_leader_key = '<C-e>'
nmap <leader>e :Emmet<space>

" YouCompleteMe Settings
let g:ycm_register_as_syntastic_checker = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_collect_identifiers_from_tags_files = 1

" Ultisnips Settings
let g:UltiSnipsExpandTrigger="<C-y>"
let g:UltiSnipsJumpForwardTrigger="<c-]>"
let g:UltiSnipsJumpBackwardTrigger="<c-[>"

" Html MatchTagsAlways Settings
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'blade' : 1,
    \ 'vue' : 1,
    \ 'php' : 1,
    \}

" Startify Settings
let g:startify_session_dir = '~/.vim/session'
let g:startify_change_to_vcs_root = 1
let g:startify_files_number = 5
let g:startify_custom_header = 
\ map(split(system('fortune -s | cowsay -f tux'), '\n'), '"   ". v:val') + ['','']
let g:startify_list_order = [
      \ ['   bookmarks: '], 'bookmarks',
      \ ['   sessions: '],  'sessions',
      \ ['   cwd mru: '],       'dir',
      \ ['   mru: '],       'files']

" Put at the very end of your .vimrc file.
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END
