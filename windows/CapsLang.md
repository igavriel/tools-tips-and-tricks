## CapsLock language switch

### What it does
- Quick tap on CapsLock switches the input language.
- Hold CapsLock to use normal CapsLock behavior.
- This is useful if you want a Mac-like language switch on Windows. [gist.github](https://gist.github.com/userhooke/0a4538bdc9567718df5504a3549efe2e)

### Setup
1. Install [AutoHotkey v2](https://www.autohotkey.com/).
2. Create a new file called `capslang.ahk`.
3. Paste the script into the file.
4. Save it and double-click it to run.
5. To make it start automatically, place the script in your Windows Startup folder. [gist.github](https://gist.github.com/userhooke/0a4538bdc9567718df5504a3549efe2e)

### Script
```ahk
#Requires AutoHotkey v2.0
#SingleInstance Force
SendMode "Input"
SetCapsLockState "AlwaysOff"

tapThreshold := 250  ; milliseconds

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
```

### Source
- AutoHotkey `KeyWait` documentation: [https://www.autohotkey.com/docs/v2/lib/KeyWait.htm](https://www.autohotkey.com/docs/v2/lib/KeyWait.htm) [autohotkey](https://www.autohotkey.com/docs/v2/lib/KeyWait.htm)
- Example inspiration for CapsLock language switching: [https://gist.github.com/userhooke/0a4538bdc9567718df5504a3549efe2e](https://gist.github.com/userhooke/0a4538bdc9567718df5504a3549efe2e) [gist.github](https://gist.github.com/userhooke/0a4538bdc9567718df5504a3549efe2e)

A small note: the script above uses Win+Space for switching, which is a common Windows input-switch shortcut, while the `KeyWait` pattern is what makes the tap/hold behavior work. [autohotkey](https://www.autohotkey.com/docs/v2/lib/Send.htm)