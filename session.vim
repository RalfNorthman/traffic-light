let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Programmering/elm/animate-svg
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 ~/
badd +75 term://.//1285:/bin/bash
badd +19 ~/Dokument/my-vimrc/README.md
badd +59 term://.//5658:/bin/bash
badd +1 src/Main.elm
badd +3 term://.//1284:/bin/bash
badd +6 notepad.txt
badd +0 term://.//26681:/bin/bash
argglobal
silent! argdel *
$argadd ~/
$argadd ~/
edit src/Main.elm
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
2wincmd k
wincmd w
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 87 + 87) / 174)
exe '2resize ' . ((&lines * 15 + 24) / 49)
exe 'vert 2resize ' . ((&columns * 86 + 87) / 174)
exe '3resize ' . ((&lines * 15 + 24) / 49)
exe 'vert 3resize ' . ((&columns * 86 + 87) / 174)
exe '4resize ' . ((&lines * 15 + 24) / 49)
exe 'vert 4resize ' . ((&columns * 86 + 87) / 174)
argglobal
if bufexists('src/Main.elm') | buffer src/Main.elm | else | edit src/Main.elm | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 22 - ((21 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
22
normal! 013|
wincmd w
argglobal
if bufexists('notepad.txt') | buffer notepad.txt | else | edit notepad.txt | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 7 - ((6 * winheight(0) + 7) / 15)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
7
normal! 0
wincmd w
argglobal
if bufexists('term://.//26681:/bin/bash') | buffer term://.//26681:/bin/bash | else | edit term://.//26681:/bin/bash | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 6 - ((5 * winheight(0) + 7) / 15)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
6
normal! 024|
wincmd w
argglobal
if bufexists('term://.//1285:/bin/bash') | buffer term://.//1285:/bin/bash | else | edit term://.//1285:/bin/bash | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 450 - ((14 * winheight(0) + 7) / 15)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
450
normal! 0
lcd ~/
wincmd w
exe 'vert 1resize ' . ((&columns * 87 + 87) / 174)
exe '2resize ' . ((&lines * 15 + 24) / 49)
exe 'vert 2resize ' . ((&columns * 86 + 87) / 174)
exe '3resize ' . ((&lines * 15 + 24) / 49)
exe 'vert 3resize ' . ((&columns * 86 + 87) / 174)
exe '4resize ' . ((&lines * 15 + 24) / 49)
exe 'vert 4resize ' . ((&columns * 86 + 87) / 174)
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOF
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
