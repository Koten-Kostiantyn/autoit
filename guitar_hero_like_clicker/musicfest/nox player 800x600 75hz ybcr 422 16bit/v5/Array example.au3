;~ Local $arr = ObjCreate('System.Collections.ArrayList')
;~ $arr.Add('lorem')
;~ $arr.Add('ipsum')
;~ $arr.Add('dolor')

;~ ConsoleWrite("Contains 'dolor'? " & $arr.Contains('dolor') & @CRLF)

;~ sleep(3000)
;~ ControlSend("NoxPlayer", "centralWidgetWindow", "" , "z")

HotKeySet("{ESC}", "Terminate")

Func Terminate()
    Exit
EndFunc   ;==>Terminate

While 1
   Local $begin = TimerInit()

   Local $dif = TimerInit() - $begin
   ;ConsoleWrite  ("! " & @ScriptLineNumber & "Thread: execution time = " & $dif & @LF)
   $dif = TimerInit() - $begin - $dif
   If $dif > 10000 then
	  ConsoleWrite  ("! " & @ScriptLineNumber & "Thread: LOOOONG execution time = " & $dif & @LF)
   EndIf
WEnd