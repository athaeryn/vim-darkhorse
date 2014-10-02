"|
"| Setup
"|
set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "darkhorse"


"|
"| AddHighlight function
"|
function! AddHighlight(name, fg, bg, options)
  let hi = "hi! ".a:name
  if strlen(a:fg)
    let hi = hi." ".s:type."fg=".a:fg
  endif
  if strlen(a:bg)
    let hi = hi." ".s:type."bg=".a:bg
  endif
  if strlen(a:options)
    let hi = hi." ".s:type."=".a:options
  endif
  exec hi
endfunction


"|
"| Color values
"|
let s:none = ""
if has('gui_running')
  let s:type       = "gui"
  let s:white      = "#bebebe"
  let s:black      = "#2a3233"

  let s:grey       = "#656969"
  let s:dark_grey  = "#3e4445"
  let s:light_grey = "#797b7b"

  let s:blue       = "#2249a7"
  let s:red        = "#cf5047"
  let s:green      = "#5b8d76"
  let s:purple     = "#9d53fd"
  let s:yellow     = "#bb9211"
else
  let s:type       = "cterm"
  let s:white      = "254"
  let s:black      = "235"

  let s:grey       = "241" " 241-2
  let s:dark_grey  = "238"
  let s:light_grey = "251"

  let s:blue       = "25" " 25
  let s:red        = "124" " 124 / 88 ?
  let s:green      = "29" " 23 / 29
  let s:purple     = "141" " 141 / 147
  let s:yellow     = "136" " 136
endif



"|
"| Base highlights
"|
call AddHighlight("Blue",   s:blue,      s:black, s:none)
call AddHighlight("Red",    s:red,       s:black, s:none)
call AddHighlight("Green",  s:green,     s:black, s:none)
call AddHighlight("Purple", s:purple, s:black, s:none)
call AddHighlight("Yellow", s:yellow,    s:black, s:none)

call AddHighlight("Grey",      s:grey,       s:black, s:none)
call AddHighlight("DarkGrey",  s:dark_grey,  s:black, s:none)
call AddHighlight("LightGrey", s:light_grey, s:black, s:none)

call AddHighlight("Normal", s:white, s:black, s:none)



"|
"| Backgrounds
"|
" exec 'hi! BlueBg   guibg=' .s:blue
" exec 'hi! RedBg'
"       \.' guifg=' .s:white
"       \.' guibg=' .s:red
" exec 'hi! GreenBg  guibg=' .s:green
call AddHighlight("PurpleBg", s:black, s:purple, s:none)
" exec 'hi! YellowBg guibg=' .s:yellow

call AddHighlight("GreyBg", s:none, s:grey, s:none)
call AddHighlight("DarkGreyBg", s:none, s:dark_grey, s:none)
call AddHighlight("LightGreyBg", s:none, s:light_grey, s:none)


"|
"| Highlights
"|
call AddHighlight("LineNr", s:light_grey, s:dark_grey, s:none)
call AddHighlight("CursorLineNr", s:green, s:black, s:none)

call AddHighlight("Visual", s:white, s:blue, s:none)


hi! link Search PurpleBg
hi! link IncSearch Search

call AddHighlight("VertSplit", s:light_grey, s:grey, s:none)

" ListChars
hi! link SpecialKey RedBg

call AddHighlight("Error", s:red, s:light_grey, s:none)

call AddHighlight("Todo", s:black, s:yellow, s:none)

call AddHighlight("StatusLine",   s:grey,       s:white, s:none)
call AddHighlight("StatusLineNC", s:light_grey, s:grey,  s:none)

" " PMenu
" exec 'hi! PMenu'
"       \.' guifg=' .s:grey
"       \.' guibg=' .s:light_grey
call AddHighlight("PMenu", s:grey, s:light_grey, s:none)



hi! link ColorColumn DarkGreyBg
hi! link CursorColumn DarkGreyBg
hi! link CursorLine DarkGreyBg


hi! link Comment Grey
hi! link Noise Grey
hi! link NonText Grey
hi! link String  Green

hi! link diffAdded Green
hi! link diffRemoved Red

call AddHighlight("gitCommitOverflow", s:red, s:none, "undercurl")

call AddHighlight("Title", s:white, s:none, "bold")


" Link lots of things to Normal.
hi! link Statement  Normal
hi! link Identifier Normal
hi! link Type       Normal
hi! link Constant   Normal
hi! link PreProc    Normal
hi! link Special    Normal
hi! link MatchParen Normal

call AddHighlight("Folded", s:dark_grey, s:light_grey, s:none)
