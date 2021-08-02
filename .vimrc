set hlsearch " 검색어 하이라이팅
"set number " 줄번호
set autoindent " 자동 들여쓰기
set scrolloff=2
set wildmode=longest,list
set ts=4 "tag select
set sts=4 "st select
set sw=1 " 스크롤바 너비
set autowrite " 다른 파일로 넘어갈 때 자동 저장
set autoread " 작업 중인 파일 외부에서 변경됬을 경우 자동으로 불러옴
set cindent " C언어 자동 들여쓰기
set bs=eol,start,indent
set history=256
set laststatus=2 " 상태바 표시 항상
"set paste " 붙여넣기 계단현상 없애기
set shiftwidth=2 " 자동 들여쓰기 너비 설정
set showmatch " 일치하는 괄호 하이라이팅
"set ignorecase " 검색시 대소문자 구별
set smarttab
set smartindent
"set softtabstop=3
set tabstop=2
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set expandtab
au BufRead,BufNewFile *.cpp set expandtab
set ruler " 현재 커서 위치 표시
set incsearch
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
" 마지막으로 수정된 곳에 커서를 위치함
set noerrorbells visualbell t_vb=
set background=dark


au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif
" 파일 인코딩을 한국어로
if $LANG[0]=='k' && $LANG[1]=='o'
set fileencoding=korea
endif
" 구문 강조 사용
if has("syntax")
	syntax on
endif
" 컬러 스킴 사용
"colorscheme codedark
"colorscheme mokai
colorscheme PaperColor
set tags=./tags,tags;$HOME

" Pathogen
execute pathogen#infect()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'
syntax on
filetype plugin indent on

map <F8> :TagbarToggle<CR>
set pastetoggle=<F2>
