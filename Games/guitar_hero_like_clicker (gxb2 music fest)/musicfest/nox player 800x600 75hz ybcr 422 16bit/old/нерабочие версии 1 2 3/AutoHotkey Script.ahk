#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.count = 1000

count = 4
Start := A_TickCount
Loop, %count%
{
   PixelGetColor, clr, 591, 591
	if clr = 0xAD8E3A
	{
		count := A_Index
		break
	}
}
elapsed := A_TickCount - Start
MsgBox % count " PixelGetColor calls took " elapsed " ms (" elapsed/count " ms each)"
return