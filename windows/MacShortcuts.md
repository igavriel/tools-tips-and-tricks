## Mac-style shortcuts with the Windows key

### What it does
- Use the Windows key like a Mac Command key for common shortcuts.
- Examples: Win+C for Copy, Win+V for Paste, Win+Z for Undo, and Win+Shift+Z for Redo.
- This is useful if you want macOS-style keyboard shortcuts on Windows. [autohotkey](https://www.autohotkey.com/docs/v2/)

### Common shortcuts
- Win+C → Copy
- Win+V → Paste
- Win+X → Cut
- Win+Z → Undo
- Win+Shift+Z → Redo
- Win+A → Select all
- Win+F → Find
- Win+S → Save
- Win+O → Open
- Win+N → New window/file
- Win+W → Close window/tab
- Win+Q → Quit app

### Setup
1. Install [AutoHotkey v2](https://www.autohotkey.com/).
2. Create a new file called `mac-shortcuts.ahk`.
3. Paste the script into the file.
4. Save it and double-click it to run.
5. To make it start automatically, place the script in your Windows Startup folder.

### Script
```ahk
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
```

### Combine all in one script
If you want to use both the CapsLock language switch and these mac-style shortcuts together, you can merge them into one AutoHotkey file.

```ahk
#Requires AutoHotkey v2.0
#SingleInstance Force
SendMode "Input"

; CapsLock language switch
SetCapsLockState "AlwaysOff"
tapThreshold := 250

CapsLock::
{
    start := A_TickCount
    KeyWait "CapsLock"
    held := A_TickCount - start >= tapThreshold

    if held
    {
        current := GetKeyState("CapsLock", "T")
        SetCapsLockState current ? "Off" : "On"
    }
    else
    {
        Send "{LWin down}{Space}{LWin up}"
    }
}

; macOS-style shortcuts using the Windows key as Command
#c::Send "^c"
#v::Send "^v"
#x::Send "^x"
#z::Send "^z"
#+z::Send "^+z"
#a::Send "^a"
#f::Send "^f"
#s::Send "^s"
#o::Send "^o"
#n::Send "^n"
#w::Send "^w"
#q::Send "^q"
```

### Source
- AutoHotkey documentation: [https://www.autohotkey.com/docs/v2/](https://www.autohotkey.com/docs/v2/)
- AutoHotkey hotkeys reference: [https://www.autohotkey.com/docs/v2/Hotkeys.htm](https://www.autohotkey.com/docs/v2/Hotkeys.htm)
