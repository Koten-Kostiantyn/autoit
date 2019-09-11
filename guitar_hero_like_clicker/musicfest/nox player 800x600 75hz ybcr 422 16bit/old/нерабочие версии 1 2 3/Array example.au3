;~ Local $arr = ObjCreate('System.Collections.ArrayList')
;~ $arr.Add('lorem')
;~ $arr.Add('ipsum')
;~ $arr.Add('dolor')

;~ ConsoleWrite("Contains 'dolor'? " & $arr.Contains('dolor') & @CRLF)

;~ sleep(3000)
;~ ControlSend("NoxPlayer", "centralWidgetWindow", "" , "z")

	$begin = TimerInit()
	sleep(400)
    ControlSend("NoxPlayer", "centralWidgetWindow", "" , "z")
	Local $dif = TimerDiff($begin)
	ConsoleWrite  ("! " & @ScriptLineNumber & "Thread: execution time = " & $dif & @LF)