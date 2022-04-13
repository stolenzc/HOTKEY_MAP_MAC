; ^ -> Ctrl
; ! -> Alt
; + -> Shift
; ; -> 单行注释 (single-line comment) 
; ` -> 转义字符 (escape character)
; :: -> 按键映射 (key mapping)
; $ -> 抑制原来的按键
; ~ -> 保留系统原有按键功能
; 原键位::映射到的键位

;Windows系统默认的Win快捷键:
;Win + E：打开资源管理器;
;Win + D：显示桌面;
;Win + F：打开查找对话框;
;Win + R：打开运行对话框;
;Win + L：锁定电脑;
;Win + PauseBreak：打开系统属性对话框;
;Win + Q: 本地文件 / 网页等搜索;
;Win + U: 打开控制面板－轻松使用设置中心;

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

; -------------------- 多桌面切换 --------------------
~^Left::Send ^#{Left}
~^Right::Send ^#{Right}
; 使用ctrl + win + t 新建桌面
; 使用ctrl + win + w 删除桌面
~^#t::Send ^#d
~^#w::Send ^#{F4}

; --------------------- Windows terminal拷贝粘贴-------------------------
#If WinActive("ahk_exe " "WindowsTerminal.exe")
  ~!c::Send ^+c
  ~!v::Send ^+v
#if

#If not WinActive("ahk_exe " "WindowsTerminal.exe")
  
  ~!c::Send ^c
  ~!v::Send ^v
#if


; ----------------------Vscode切换标签页---------------------------
#If WinActive("ahk_exe " "Code.exe")
  ~#!Left::Send ^{PgUp}
  ~#!Right::Send ^{PgDn}
#if

#If not WinActive("ahk_exe " "Code.exe")
  ~!#Left::Send ^+{Tab}
  ~!#Right::Send ^{Tab}
#if


; -------------通用快捷键映射（实现mac快捷键操作逻辑）---------------
!a::Send ^a

!w::Send ^w

!r::Send ^r

!x::Send ^x

!t::Send ^t

!z::Send ^z

; ------------------快捷移动快捷键------------------------


; Tab::
; KeyWait, Tab, T0.2
; If ErrorLevel {
;   KeyWait, Tab
; } else {
;   Send, {Tab}
; }
; Return

; ~Tab & h::Send {Left} 

; ~Tab & l::Send {Right}  

; ~Tab & j::Send {Down}

; ~Tab & k::Send {Up}
