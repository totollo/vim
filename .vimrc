set number
set autoindent
set cindent 
set smartindent
set tabstop=4
"set expandtab
set shiftwidth=4
set showmatch
set ruler
set hlsearch
set ic
set autochdir
set incsearch

syntax on
colorscheme desert

set fileencodings=utf-8,gb2312,gbk,cp936,big5,ucs-bom,ascii
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

filetype plugin indent on

nmap <Up> <c-w>k
nmap <Down> <c-w>j
nmap <Right> <c-w>l
nmap <Left> <c-w>h

nmap <C-H> :e %<.h<CR>
nmap <C-C> :e %<.cpp<CR>

set tags=./tags,./TAGS,tags;~,TAGS;~
set tags+=~/.vim/tags/libc++.tags
set tags+=~/.vim/tags/stl.tags
set tags+=/Volumes/Data/projects/cocos2d-x-2.2/cocos2dx/tags
set tags+=/Volumes/Data/projects/cocos2d-x-2.2/CocosDenshion/tags
set tags+=/Volumes/Data/lib/qt5.2/5.2.0/clang_64/lib/tags
set tags+=/Volumes/Data/lib/lua-5.1.5/src/tags

"-- omnicppcomplete setting --
"set completeopt=menu,menuone
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included
let OmniCpp_ShowAccess = 1
let OmniCpp_DefaultNamespaces = ["std"]

" change hotkeys if I want to use 
"inoremap <expr> <C-J>      pumvisible()?"\<C-N>":"\<C-X><C-O>"  
"inoremap <expr> <C-K>      pumvisible()?"\<C-P>":"\<C-K>"
"inoremap <expr> <C-L>       pumvisible()?"\<C-Y>":"\<CR>"
"inoremap <expr> <C-H>      pumvisible()?"\<C-E>":"\<C-L>" 

"files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype  in popup

"window
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_DisplayMode=1

"autocmd vimenter * NERDTree
nmap \nt :NERDTreeToggle<CR>
"autocmd vimenter * TagbarToggle
nmap \tb :TagbarToggle<CR>

"minbuffexplorer
let g:miniBufExplMapCTabSwitchBufs = 1

"syntastic check
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol = '>>'
let g:syntastic_warning_symbol = '//'
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 6
let g:syntastic_enable_signs=1

"syntastic c 
let g:syntastic_c_config_file = '.synconf'
let g:syntastic_c_compiler_options = '-std=c99'

"syntastic cpp
let g:syntastic_cpp_config_file = '.synconf'
let g:syntastic_cpp_compiler_options = '-std=c++0x'

"c-support
let g:C_MapLeader = '\'

execute pathogen#infect()

"function find ctags and update
function! Ct()
	let max = 5
	let odir = getcwd()
	let dir = './'
	let i = 0
	let break = 0
	
	while isdirectory(dir) && i < max
		if filereadable(dir . 'tags')
			execute 'lcd' . dir
			execute '!ctags --c++-kinds=+p --fields=+iaS --extra=+q -R .'
			execute 'lcd' . odir
			let break = 1
		endif
		if break == 1
			
			break
		endif
		let dir = dir . '../'
		let i = i + 1
	endwhile
endf

"define editor command
command! -nargs=* Ct
			\ call Ct()
