set nocompatible

set clipboard=unnamed
if !has("mac")
set clipboard=unnamedplus
endif

" Initialize Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Enable syntax highlighting
syntax on
filetype plugin indent on

set background=dark
colorscheme nord

" Add line numbers
set number
set ruler

" Set encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set autoread

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Strip trailing whitespaces on each save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Search related settings
set incsearch
set hlsearch

" Map Ctrl+l to clear highlighted searches
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Highlight characters behind the 80 chars margin
":au BufWinEnter * let w:m2=matchadd('ColumnMargin', '\%>80v.\+', -1)

" Disable code folding
"set nofoldenable

" Directories for swp files
set backupdir=~/.vimbackup
set directory=~/.vimbackup

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" make uses real tabs
au FileType make set noexpandtab

" Erlang uses 4 spaces
au FileType erlang set softtabstop=4 tabstop=4 shiftwidth=4

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

au FileType java set softtabstop=2 tabstop=2 shiftwidth=2 textwidth=100 expandtab

au FileType markdown set spell spelllang=en_us
au FileType text set spell spelllang=en_us

" disable backup for gopass  files
au BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set pastetoggle=<F2>

" Copy and paste
if has('clipboard') && !has('gui_running')
  vnoremap <C-c> "+y
  vnoremap <C-x> "+d
  vnoremap <C-v> "+p
  inoremap <C-v> <C-r><C-o>+
endif

set mouse=a

" Not warning about vim version on CentOS 7
let g:go_version_warning = 0

set ignorecase
set smartcase

let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["java"] }
let g:syntastic_go_checkers = ['govet', 'errcheck', 'go']

nnoremap <F5> :buffers<CR>:buffer<Space>
nmap <F8> :TagbarToggle<CR>

set rtp+=~/.fzf
nmap <C-p> :FZF<CR>

let g:go_auto_type_info = 1

let g:airline#extensions#tabline#enabled = 1
map <C-n> :bnext<CR>

let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_temp_file=1
let vim_markdown_preview_github=1
let vim_markdown_preview_toggle=1

set completeopt-=preview
if has('nvim')
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
endif

inoremap            jk              <Esc>
inoremap            kj              <Esc>

map <C-d> :Dash<CR>

nnoremap <C-j> :%!jq .<CR>
