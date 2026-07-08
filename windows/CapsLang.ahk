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