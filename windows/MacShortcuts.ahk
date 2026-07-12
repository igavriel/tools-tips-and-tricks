#Requires AutoHotkey v2.0
#SingleInstance Force
SendMode "Input"

; macOS-style shortcuts using the Windows key as Command
#c::Send "^c"    ; Win+C -> Copy
#v::Send "^v"    ; Win+V -> Paste
#x::Send "^x"    ; Win+X -> Cut
#z::Send "^z"    ; Win+Z -> Undo
#+z::Send "^+z"  ; Win+Shift+Z -> Redo
#a::Send "^a"    ; Win+A -> Select all
#f::Send "^f"    ; Win+F -> Find
#s::Send "^s"    ; Win+S -> Save
#o::Send "^o"    ; Win+O -> Open
#n::Send "^n"    ; Win+N -> New
#w::Send "^w"    ; Win+W -> Close window
#q::Send "^q"    ; Win+Q -> Quit app
#Tab::AltTab     ; Win+Tab -> Switch apps
