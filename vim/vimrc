" Vim configuration file
"
" * * * * * * * * * * * * * * * * * * * * * * * * * * *
" * * * VIM: WYSZCZEGOLNIENIE NIEKTORYCH OPCJI  * * * *
" * * * * * * * * * * * * * * * * * * * * * * * * * * *
" <Tab>      - autodopelnienie brakujacych wyrazow
"                na podstawie zawartosci pliku
" <F2>       - sciaga polecen vima
" <F3>       - wykonanie edytowanego pliku w python3
" <F3>       - kompilacja eytowanego pliku w gcc, g++, java
"                w przypadku powodenia kompilacji
"                wykonanie ./a.out
" <F4>       - wykonanie ./a.out
" <F5>       - debuger kompilacja w gcc lub g++
"                w przypadku powodenia kompilacji
"                uruchomienie debugera
" <F8>       - cos robi ale co to nikt nie wie
" <F7>       - zawijanie bloku tekstu
" <F9>       - SZYBKI ZAPIS
" <F12>      - wyjscie bez zapisu (potwierdzenie enter)
" main<tab>  - szablon funkcji main dla C, C++ oraz Pythona
" main<tab>  - szablon clasy nazwa_pliku oraz funkcji main dla Java
" class<tab> - szablon clasy nazwa_pliku 
"              oraz funkcji main, compareTo, equals, toString dla Java
" sg<tab>    - zamiana lini zawierającej deklaracje zmiennej
"              na funkcje setZmienna() oraz getZmienna()
" H#         - szablon pliku naglowkowego
" 
" autouzupelnianie petli dla C , C++ i Java (np: for<tab>)
" autouzupelnianie nawiasow (np: { → {kursor}, inny przyklad: {<cr> →  {\nkursor\n})
"
" MOZLOWOSC KOPIOWANIA TEKSTU POZA VIMA
:set clipboard=unnamedplus
" sciaga
map <F2> :!clear; echo zamknij vim.pdf aby kontynuować; evince ~/.vim.own/vim.pdf<CR>


" + + + + + + + + + + + + + + + + + + + + + + + + + + +
" + + +      OPCJE PODSTAWOWE BEZ KTORYCH VIM   + + + +
" + + +   JEST BARDZO SUROWYM I NIE PRZYJAZNYM  + + + +
" + + +              NOTATNIKIEM                + + + +
" + + + + + + + + + + + + + + + + + + + + + + + + + + +
" DEFAULT OPTIONS
set nocompatible			" make Vim default to nicer options

" READING OPTIONS
set modeline modelines=1		" use settings from file being edited

" INPUT OPTIONS
set mouse=a				" use the mouse

set maxmempattern=1000

" use plugsin
filetype plugin indent on

" DISPLAY OPTIONS
" set background=light			" better colors for white terminals
set et
set sw=4
set mmp=1000
set smarttab
set number				" show line numbers
set ruler				" show line and column information
set notitle				" don't set change terminal's title
set backspace=2				" backspaces can go over lines
set tabstop=4				" tabs are every 2 columns
:if version >= 600
set listchars=eol:$,tab:>-,trail:-,extends:>,precedes:<
:elseif version >= 500
set listchars=eol:$,tab:>-,trail:-,extends:+
:endif
set laststatus=2			" always show status line
set showmode				" always show command or insert mode
set shortmess=lnrxI			" brief messages, don't show intro
set showcmd				" show partial commands
set more				" use a pager for long listings
set lbr					" wrap long lines, break at word, not character
syntax on				" use syntax highlighting
set guifont=Monospace\ 14

" SAVING OPTIONS
set expandtab				" don't change tabs into spaces
set backupext=~			" backup files end in ~

" EDITING OPTIONS
"set autoindent			" keep indenting at same level
set visualbell		  " flash screen instead of ringing bell
set noerrorbells 		" no ringing bell
set t_vb=           "visual bell, no sound at all
set esckeys				  " allow arrow keys in insert mode
" set showmatch			" show matching brackets
set  hidden         " switch buffers without saving
set shiftwidth=4

" SEARCH OPTIONS
set nohlsearch				" don't highlight search patterns
set incsearch				" search while typing
"set ignorecase				" make searches case-insensitive

map <F8> xi<Enter><Esc>
"map <F2> :w\|!python3 %<cr>
" MISCELLANEOUS OPTIONS
"set dictionary=/usr/share/dict/words	" get words from system dictionary
"setlocal spell spelllang=pl,en
set magic				" regexp chars have special meaning
au FileType * execute 'setlocal dict+=~/.vim/words/'.&filetype.'.txt'
" colorscheme olive

" when we reload, tell vim to restore the cursor to the saved position
augroup JumpCursorOnEdit
 au!
 autocmd BufReadPost *
 \ if expand("<afile>:p:h") !=? $TEMP |
 \ if line("'\"") > 1 && line("'\"") <= line("$") |
 \ let JumpCursorOnEdit_foo = line("'\"") |
 \ let b:doopenfold = 1 |
 \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
 \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
 \ let b:doopenfold = 2 |
 \ endif |
 \ exe JumpCursorOnEdit_foo |
 \ endif |
 \ endif
 " Need to postpone using "zv" until after reading the modelines.
 autocmd BufWinEnter *
 \ if exists("b:doopenfold") |
 \ exe "normal zv" |
 \ if(b:doopenfold > 1) |
 \ exe "+".1 |
 \ endif |
 \ unlet b:doopenfold |
 \ endif
augroup END

" + + + + + + + + + + + + + + + + + + + + + + + + + + +
" + + +        OPCJE ULATWIAJACE ZYCIE          + + + +
" + + + + + + + + + + + + + + + + + + + + + + + + + + +

"zaznaczanie zawartosci miedzy nawiasami
"noremap % v%

"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"

"zaznaczanie wyrazu spacja
map <space> bve

"zapisywanie zwijanietych fragmentow tekstu
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* loadview 

"<HOME> po nacisnieciu klawisza <home> 
"przesuwa kursor do pierwszego znaku
"ponowne nacisniecie na poczatek lini
function ExtendedHome()
    let column = col('.')
    normal! ^
    if column == col('.')
        normal! 0
    endif
endfunction
noremap <silent> <Home> :call ExtendedHome()<CR>
inoremap <silent> <Home> <C-O>:call ExtendedHome()<CR>

" wstawia znaki i kursor w nich
inoremap <expr> <cr>  strpart(getline('.'), col('.')-2, 2) == "{}" ? "<cr>\<esc>%a<cr>" : "<cr>"
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap <expr> "  strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"<left>"
inoremap <expr> '  strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'<left>"

"zapobiega powielaniu znakow
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

"wstawia znaki w wizualnym, po zaznaczeniu fragmentu
vnoremap ( "zdi(<C-R>z)<ESC>
vnoremap { "zdi{<C-R>z}<ESC>
vnoremap [ "zdi[<C-R>z]<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>
"vnoremap " "zdi"<C-R>z"<ESC>

" <F3> kompikacja i wykonywanie
autocmd Filetype progress inoremap <F3> <esc>:w\|!clear; gnuplot % <cr>
autocmd Filetype progress map      <F3>      :w\|!clear; gnuplot % <cr>
autocmd Filetype tex      inoremap <F3> <esc>:w\|!clear; pdflatex % && evince %:r.pdf<cr>
autocmd Filetype tex      map      <F3>      :w\|!clear; pdflatex % && evince %:r.pdf<cr>
autocmd Filetype python   inoremap <F3> <esc>:w\|!clear; python3 %<cr>
autocmd Filetype python   map      <F3>      :w\|!clear; python3 %<cr>
autocmd Filetype c        inoremap <F3> <esc>:w\|!clear; gcc -std=c11 -Wall -pedantic % && ./a.out<cr>
autocmd Filetype c        map      <F3>      :w\|!clear; gcc -std=c11 -Wall -pedantic % && ./a.out<cr>
"autocmd Filetype cpp      inoremap <F3> <esc>:w\|!clear; g++ -std=c++11 -Wall -pedantic *.{cc,cpp} && ./a.out<cr>
"autocmd Filetype cpp      map      <F3>      :w\|!clear; g++ -std=c++11 -Wall -pedantic *.{cc,cpp} && ./a.out<cr>
autocmd Filetype cpp      inoremap <F3> <esc>:w\|!clear; g++ -std=c++11 -Wall -pedantic % && ./a.out<cr>
autocmd Filetype cpp      map      <F3>      :w\|!clear; g++ -std=c++11 -Wall -pedantic % && ./a.out<cr>
autocmd Filetype java     inoremap <F3> <esc>:w\|!clear; javac % && java %:r<cr>
autocmd Filetype java     map      <F3>      :w\|!clear; javac % && java %:r<cr>
autocmd Filetype sh       inoremap <F3> <esc>:w\|!clear; bash % <cr>
autocmd Filetype sh       map      <F3>      :w\|!clear; bash % <cr>


" <F4> wykonanie pliku a.out
inoremap <F4> :!clear; ./a.out<cr>
map      <F4> :!clear; ./a.out<cr>

" <F7> zawijanie blokow tekstu
map  <F7> jva{zf
imap <F7> <esc>jva{zf

" <F9> szybki zapis
inoremap <F9> <Esc>:wa!<CR>a
map      <F9> <Esc>:wa!<CR>

"schematy kolorów
colorscheme darkblue
"colorscheme evening



" <F12> wyjscie bez zapisu potwierdzone <enter>
inoremap <F12> <Esc>:q!
map <F12> <Esc>:q!

autocmd Filetype c call SetCOptions()
autocmd Filetype cpp call SetCppOptions()
autocmd Filetype python call SetPyOptions()
autocmd Filetype java call SetJavaOptions()


function SetCOptions()
    map <F5> :w\| !clear; gcc -g -std=c11 -Wall -pedantic % && gdb a.out<cr>
    call SzablonC()
    call Petle()
    call Struct()
endfunction

function SetCppOptions()
    map <F5> :w\| !clear; g++ -g -std=c++11 -Wall -pedantic % && gdb a.out<cr>
    call SzablonCPP()
    call Petle()
    call Struct()
endfunction

function Petle()
    imap while<tab> while (){<cr>;<left>
    imap for<tab> for (;;){<cr>
    imap if<tab> if (){<cr>
    imap do<tab> do <CR> while ();<up><delete>{<cr>
endfunction

function SetPyOptions()
    call SzablonPy()
endfunction

function SetJavaOptions()
    call SzablonJava()
    call Petle()
endfunction


"szablony plikow
function SzablonC()
    imap main<tab> /*<CR>co plik zawiera<CR><CR>/<CR><CR>#include <stdio.h><CR><CR>int main(void)<CR>{<cr>;<left>
    imap H<tab> #ifndef NAZWAPLIKU_H<cr>#define NAZWAPLIKU_H<cr>#include<stdio.h><cr><cr><cr>#endif <up><up><up>
endfunction

function SzablonCPP()
    imap main<tab> /*<CR>co plik zawiera<CR><CR>/<CR><CR>#include <iostream><CR>using namespace std;<CR><CR>int main()<CR>{<cr>;<left>
    imap H<tab> #ifndef NAZWAPLIKU_H<cr>#define NAZWAPLIKU_H<cr>#include<iostream><cr>using namespace std;<cr><cr>#endif
endfunction

function Struct()
    imap struct<tab> #ifndef ADRES_H<CR>#define ADRES_H<CR><CR>#include <iostream><cr><cr>using namespace std;<cr><cr>struct nazwa<cr><cr>#endif<up>{<cr>
endfunction

function SzablonPy()
    imap main<tab>  #!/usr/bin/env python3<CR># -*- coding: utf-8 -*-<CR>#<CR>#  nazwa.py<CR># co plik zawiera<CR>#<CR><CR><CR>def main():<CR>pass<CR><CR>if __name__ == '__main__':<CR>main()<up><up><up>
endfunction

function SzablonJava()
    imap sg<tab> <esc>:s/private \([A-Za-z_\[\]]\+\) \([a-zA-Z]\)\([A-Za-z]\+\);/public void set\U\2\e\3(\1 \2\3){\r        this.\2\3 = \2\3;\r    }\r    public \1 get\U\2\e\3(){\r        return (\1) \2\3;\r    }<cr><cr>
    imap pri<tab> System.out.print
    imap main<tab> public class<esc>:put =expand('%:t:r')<cr><up>Jo{<cr>public static void main(String[] args){<cr>;<left>
    imap class<tab> public class<esc>:put =expand('%:t:r')<cr><up>Jo{<c-o>mc<cr>@Override<cr>public String toString(){<cr>return "";<esc>'co<cr>@Override<cr>public int compareTo(<del><esc>:put =expand('%:t:r')<cr><up>J$a other){<cr>if (this == other)<cr>return 0;<cr>/*kod*/<cr>return 0;<esc>'co<cr>@Override<cr>public boolean equals(Object obj){<cr>if (this == obj)<cr>return true;<cr>if (obj == null)<cr>return false;<cr>if (this.getClass() != obj.getClass())<cr>return false;<esc>:put =expand('%:t:r')<cr>==$a other = (<del><esc>:put =expand('%:t:r')<cr>kJ$a ) obj;<cr>/*kod*/<cr>return true;<esc>'co<cr>public <esc>:put =expand('%:t:r')<cr><up>J$a(){<cr>;<esc>'copublic static void main(String[] args){<cr>;<left>
    imap pack<tab> <c-o>opackage<esc>:put=expand('%:h:gs?/?\.?')<cr><up>J$a;
endfunctio

