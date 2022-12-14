filetype plugin indent on "Включает определение типа файла, загрузку...
"... соответствующих ему плагинов и файлов отступов
set encoding=utf-8 "Ставит кодировку UTF-8
set nocompatible "Отключает обратную совместимость с Vi
syntax enable "Включает подсветку синтаксиса
syntax on
set t_Co=256
"let g:neoformat_try_node_exe = 1
let g:prettier#config#config_precedence = 'prefer-file'
let g:prettier#autoformat_config_present = 1

"let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

set guifont=Fura\ Code\ Light\ Nerd\ Font\ Complete:h16

set termguicolors
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
let g:neoformat_try_node_exe = 1
let g:solarized_termtrans=1


if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif


call plug#begin('~/.vim/bundle') "Начать искать плагины в этой директории
Plug 'altercation/vim-colors-solarized'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'mattn/emmet-vim'
"Plug 'sbdchd/neoformat'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'prettier/vim-prettier'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'powerline/powerline-fonts'
Plug 'scrooloose/nerdtree'
call plug#end() "Перестать это делать


inoremap { {<CR>}<Up><Enter>
inoremap ( ()<Left>
inoremap < <><Left>
inoremap [ []<Left>
inoremap " ""<Left>
inoremap ' ''<Left>

let g:prettier#config#tab_width = '2'

map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

let g:airline_powerline_fonts = 1 "Включить поддержку Powerline шрифтов
let g:airline#extensions#keymap#enabled = 0 "Не показывать текущий маппинг
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" "Кастомная графа положения курсора
let g:Powerline_symbols='unicode' "Поддержка unicode
let g:airline#extensions#xkblayout#enabled = 0 "Про это позже расскажу

set guioptions= "Отключаем панели прокрутки в GUI
set showtabline=0 "Отключаем панель табов (окошки FTW)

"Сам по себе number показывает справа номера строк
"relativenumber - нумерацию строк относительно положения курсора
set number "А это гибридный вариант. Протестируйте все
hi CursorLine     guibg=#003036 gui=none
hi LineNr         ctermfg=DarkMagenta guifg=#006f8b guibg=#002b36 

"wrap заставляет переносить строчки без их разделения
"Соответсвенно nowrap рендерит строчки за границами экрана
"set wrap linebreak nolist "Данная вариация работает как wrap...
"... но переносит строчки не посимвольно, а по словам

"Предыдущий способ известен как soft wrapping
"При желании вы можете заставить Вим насильно разделять...
"... строчки в самом тексте вот так:
set textwidth=80 "Где 80 стоит заменить на нужную вам длину строки

set cursorline "А так мы можем подсвечивать строку с курсором

"Если вы используете обычный терминальный Вим, а не NeoVim, то...
"... для изменения курсора в разных режимах используйте это:
set ttimeoutlen=10 "Понижаем задержку ввода escape последовательностей
let &t_SI.="\e[5 q" "SI = режим вставки
let &t_SR.="\e[3 q" "SR = режим замены
let &t_EI.="\e[1 q" "EI = нормальный режим
"Где 1 - это мигающий прямоугольник
"2 - обычный прямоугольник
"3 - мигающее подчёркивание
"4 - просто подчёркивание
"5 - мигающая вертикальная черта

