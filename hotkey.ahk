; ^ -> Ctrl
; ! -> Alt
; + -> Shift
; ; -> 单行注释 (single-line comment) 
; ` -> 转义字符 (escape character)
; :: -> 按键映射 (key mapping)
; $ -> 抑制原来的按键
; ~ -> 保留系统原有按键功能
; 原键位::映射到的键位

;管理员运行
if not A_IsAdmin
{
  Run *RunAs "%A_ScriptFullPath%"
  ExitApp
}

;无环境变量
#NoEnv
SetCapsLockState, AlwaysOff 
SetStoreCapslockMode,Off

;高进程
Process Priority,,High

CapsLock::
KeyWait, CapsLock, T0.3
If ErrorLevel {
    Send, {Capslock}
    KeyWait, CapsLock
} else {
    Send, ^{Space}
}
Return

; Windows terminal
#If WinActive("ahk_exe " "WindowsTerminal.exe")
  !c::Send ^+c
  !v::Send ^+v
#if

#If not WinActive("ahk_exe " "WindowsTerminal.exe")
  !c::Send ^c
  !v::Send ^v
#if


; Vscode
#If WinActive("ahk_exe " "Code.exe")
  !#Left::Send ^{PgUp}
  !#Right::Send ^{PgDn}
#if

#If not WinActive("ahk_exe " "Code.exe")
  !#Left::Send ^+{Tab}
  !#Right::Send ^{Tab}
#if


; 通用快捷键映射
!a::Send ^a

!w::Send ^w

!r::Send ^r

!x::Send ^x

!t::Send ^t

!z::Send ^z
