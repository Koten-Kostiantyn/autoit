#include <APIConstants.au3>
#include <WinAPIEx.au3>

$current_lock_status = False

While 1
   If (_IsLocked() == $current_lock_status) Then
	  sleep(500)
   Else
	  If _IsLocked() Then
		 $current_lock_status = True
		 ConsoleWrite('Workstation Is Locked.' & @CRLF)
	  Else
		 $current_lock_status = False
		 ConsoleWrite('Workstation Is Unlocked.' & @CRLF)
		 stop_reset_stopwatch()
	  EndIf
   EndIf
   Sleep(500)
WEnd

Func _IsLocked()
    Local $fIsLocked = False
    Local Const $hDesktop = _WinAPI_OpenDesktop('Default', $DESKTOP_SWITCHDESKTOP)
    If @error = 0 Then
        $fIsLocked = Not _WinAPI_SwitchDesktop($hDesktop)
        _WinAPI_CloseDesktop($hDesktop)
    EndIf
    Return $fIsLocked
 EndFunc   ;==>_IsLocked

Func start_stopwatch()
   Send("^1")
   Send("^2")
EndFunc

Func stop_reset_stopwatch()
   Send("^3")
   Send("^2")
   Send("^1")
EndFunc

Func _IsWorkstationLocked()

    Local $Result = False

    $hDesktop = DllCall('user32.dll', 'hwnd', 'OpenDesktop', 'str', 'Default', 'int', 0, 'int', 0, 'int', $DESKTOP_SWITCHDESKTOP)
    If Not @error Then
        $Result = DllCall('user32.dll', 'int', 'SwitchDesktop', 'hwnd', $hDesktop[0])
        $Result = Not $Result[0]
        DllCall('user32.dll', 'int', 'CloseDesktop', 'hwnd', $hDesktop[0])
    EndIf
    Return $Result
EndFunc   ;==>_IsWorkstationLocked