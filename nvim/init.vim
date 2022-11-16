set ai " auto-indent
set showmatch " show matching brackets
set ls=2 " status line
set showcmd " Show incomplete commands. Especially useful on phones via SSH.
set smd " show mode in last line
set mouse= " disable mouse integration. I want to copy words with my mouse directly without using visual mode.
set wildmode=list:longest,longest:full " command line completion
set tabstop=2
set shiftwidth=0
set hidden " I'm not sure what this does, but it looks legit.
set startofline " Why does neovim change these defaults? Who wants to go to a random position in the line after `gg` or `G`?
set nu rnu " relative line number
set statusline=%f               " filename relative to current $PWD
set clipboard=unnamed					 " clipboard
set statusline+=%h              " help file flag
set statusline+=%m              " modified flag
set statusline+=%r              " readonly flag
set statusline+=\ [w%{&ff}]      " Fileformat [unix]/[dos] etc...
set statusline+=\ (%{strftime(\"%H:%M\ %d/%m/%Y\",getftime(expand(\"%:p\")))})  " last modified timestamp
set statusline+=%=              " Rest: right align
set statusline+=%l,%c%V         " Position in buffer: linenumber, column, virtual column
set statusline+=\ %P            " Position in buffer: Percentage
set autoread " reload external changes after running commands
set maxmempattern=10000
set background=dark
filetype off

call plug#begin()
" Code Inspector
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'github/copilot.vim'

" Golang
Plug 'fatih/vim-go'

" PHP
Plug 'yaegassy/coc-intelephense', {'do': 'yarn install --frozen-lockfile'}
Plug 'yaegassy/coc-blade', {'do': 'yarn install --frozen-lockfile'}
Plug 'yaegassy/coc-php-cs-fixer', {'do': 'yarn install --frozen-lockfile'}

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" File system explorer
Plug 'preservim/nerdtree'

" Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim' " Required for telescope
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'ggandor/lightspeed.nvim'

" Cosmetic
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'

" Tabs
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'norcalli/nvim-colorizer.lua'

" Git Helper
Plug 'airblade/vim-gitgutter'

" JS / JSX
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

" Terminal
Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}

" Code Style
Plug 'jiangmiao/auto-pairs'
Plug 'uarun/vim-protobuf' " syntax highlighting for Google's Protocol Buffers 
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

call plug#end()

" onedark colorscheme
source $HOME/.config/nvim/themes/onedark.vim

lua require('keymaps')
lua require('plugin-settings')

let g:airline_powerline_fonts = v:true
let g:airline_theme='onedark'
let g:airline#extensions#clock#format = '%H:%M:%S'
let g:airline#extensions#clock#updatetime = 1000

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>:GitFiles<cr>
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Git Gutter Configurations
let g:gitgutter_set_sign_backgrounds = 1
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

" COC Settings
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>a  <Plug>(coc-codeaction-selected)

nmap <silent> <leader>h :call CocActionAsync('doHover')<cr>
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" noh - no highlight
map <esc> :noh <CR>

" Terminal Settings
lua require("toggleterm").setup{}
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent> ty <Cmd>exe v:count1 . "ToggleTerm"<CR>

" By applying the mappings this way you can pass a count to your
" mapping to open a specific window.
" For example: 2ty will open terminal 2
nnoremap <silent> ty <Cmd>exe v:count1 . "ToggleTerm"<CR>

" Golang
" format with goimports instead of gofmt
let g:go_fmt_command = "gopls"

"" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_auto_type_info = 1 " Status line types/signatures

"" Code Style
let g:AutoPairsMultilineClose = 0

" Autosave after 0.3s
set updatetime=300
autocmd CursorHold,CursorHoldI ?* update

" Don't copy to default clipboard after delete
nnoremap d "_d
vnoremap d "_d
nnoremap x "_x
vnoremap x "_x

" Colorizer
lua require("colorizer").setup()

