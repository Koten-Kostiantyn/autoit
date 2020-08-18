#cs ----------------------------------------------------------------------------


#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <Constants.au3>
#include <authread.au3>
#include <Array.au3>
#include <arrays_pixels_win7_global.au3>

HotKeySet("{ESC}", "Terminate")
_AuThread_Startup()


Func Terminate()
    Exit
 EndFunc   ;==>Terminate


Func pixelget1()
   $fcolor = PixelGetColor(720, 380)
   Return $fcolor
EndFunc;

Func pixelget2()
   $fcolor = PixelGetColor(857, 380)
   Return $fcolor
EndFunc;

Func pixelget3()
   $fcolor = PixelGetColor(1032, 380)
   Return $fcolor
EndFunc;

Func pixelget4()
   $fcolor = PixelGetColor(1165, 380)
   Return $fcolor
EndFunc;

Func get_current_pixel_state($button)
	If $button = 1 Then
		$pixel = pixelget1()
	ElseIf $button = 2 Then
		$pixel = pixelget2()
	ElseIf $button = 3 Then
	$pixel = pixelget3()
	ElseIf $button = 4 Then
		$pixel = pixelget4()
	Else
		MsgBox(0, "Error", "Seems your button parameter is incorrect!")
	EndIf

	If $arr_empty_empty_first.Contains($pixel) Then
		$object = 'empty_empty'
	ElseIf $arr_empty_tile_first.Contains($pixel) Then
		$object = 'empty_tile'
	ElseIf $arr_empty_blue_first.Contains($pixel) Then
		$object = 'empty_blue'
	ElseIf $arr_clicked_empty_first.Contains($pixel) Then
		$object = 'clicked_empty'
	ElseIf $arr_clicked_tile_first.Contains($pixel) Then
		$object = 'clicked_tile'
	ElseIf $arr_clicked_blue_first.Contains($pixel) Then
		$object = 'clicked_blue'
	Else
		$object = $pixel
	EndIf
Return $object
EndFunc;


Func count_pixel_and_otput_to_console_and_do_action($button, $action, $current_pixel_state, $pixel_in_memory, $pixel_counter)
	$current_pixel_state = get_current_pixel_state($button)
	if $current_pixel_state = $pixel_in_memory Then
		$pixel_counter = $pixel_counter + 1
	Else
		ConsoleWrite  ($button & ": " & $pixel_in_memory & " was " & $pixel_counter & @LF)
		ConsoleWrite  ($button & ": " & $current_pixel_state & @LF)
		state_change_reaction($current_pixel_state, $pixel_in_memory, $button, $action)
		$pixel_in_memory = $current_pixel_state
		$pixel_counter = 0
	EndIf

	; Now transform vars to array so we can return that values (IDK any other solution)
	Local $func_array[3]
	$func_array[0] = $current_pixel_state
	$func_array[1] = $pixel_in_memory
	$func_array[2] = $pixel_counter
	Return $func_array
EndFunc;


Func state_change_reaction($current_pixel_state, $old_pixel_state, $button, $action)
	if ($current_pixel_state <> 'empty_empty' and $current_pixel_state <> 'clicked_empty') and _
	   ($old_pixel_state = 'empty_empty' or $old_pixel_state = 'clicked_empty') Then ; was empty became something
	    If $action Then
			hold_click_action($button)
		EndIf
		ConsoleWrite  ("! " & @ScriptLineNumber & $button & ": Click and hold" & @LF)
	EndIf
	if ($old_pixel_state <> 'empty_empty' and $old_pixel_state <> 'clicked_empty') and _
	   ($current_pixel_state = 'empty_empty' or $current_pixel_state = 'clicked_empty') Then ; was something became empty
	    If $action Then
			unclick_action($button)
		EndIf
		ConsoleWrite  ("- " & @ScriptLineNumber & $button & ": UNclick" & @LF)
	EndIf
EndFunc;


Func loop_all_buttons_and_do_actions_count_and_etc()
	Local $first_func_array[3]
	Local $second_func_array[3]
	Local $third_func_array[3]
	Local $four_func_array[3]
	While 1
		$first_func_array = count_pixel_and_otput_to_console_and_do_action(1, True, $first_func_array[0], $first_func_array[1], $first_func_array[2])
		$second_func_array = count_pixel_and_otput_to_console_and_do_action(2, True, $second_func_array[0], $second_func_array[1], $second_func_array[2])
		$third_func_array = count_pixel_and_otput_to_console_and_do_action(3, True, $third_func_array[0], $third_func_array[1], $third_func_array[2])
		$four_func_array = count_pixel_and_otput_to_console_and_do_action(4, True, $four_func_array[0], $four_func_array[1], $four_func_array[2])
	WEnd
EndFunc


loop_all_buttons_and_do_actions_count_and_etc()



; todo add 2 levels of logging

Func normal_click_action($button)
	If $button = 1 Then
		$hThread = _AuThread_StartThread("normal_click_first")
	ElseIf $button = 2 Then
		$hThread = _AuThread_StartThread("normal_click_second")
	ElseIf $button = 3 Then
		$hThread = _AuThread_StartThread("normal_click_third")
	ElseIf $button = 4 Then
		$hThread = _AuThread_StartThread("normal_click_four")
	Else
		MsgBox(0, "Error", "Seems your button parameter is incorrect!")
	EndIf
EndFunc


Func hold_click_action($button)
	If $button = 1 Then
		$hThread = _AuThread_StartThread("hold_click_first")
	ElseIf $button = 2 Then
		$hThread = _AuThread_StartThread("hold_click_second")
	ElseIf $button = 3 Then
		$hThread = _AuThread_StartThread("hold_click_third")
	ElseIf $button = 4 Then
		$hThread = _AuThread_StartThread("hold_click_four")
	Else
		MsgBox(0, "Error", "Seems your button parameter is incorrect!")
	EndIf
EndFunc


Func unclick_action($button)
	If $button = 1 Then
		$hThread = _AuThread_StartThread("unclick_first")
	ElseIf $button = 2 Then
		$hThread = _AuThread_StartThread("unclick_second")
	ElseIf $button = 3 Then
		$hThread = _AuThread_StartThread("unclick_third")
	ElseIf $button = 4 Then
		$hThread = _AuThread_StartThread("unclick_four")
	Else
		MsgBox(0, "Error", "Seems your button parameter is incorrect!")
	EndIf
EndFunc




Func normal_click_first()
	Sleep(250)
	ControlSend("NoxPlayer", "centralWidgetWindow", "" , "z")
	; MouseClick("left", 737, 800, 1)
EndFunc ;

Func hold_click_first()
	Sleep(250)
	ControlSend("NoxPlayer", "centralWidgetWindow", "" , "{z down}")
	; MouseMove(737, 800, 1)
	;MouseDown("left")
EndFunc

Func unclick_first()
	Sleep(250)
	ControlSend("NoxPlayer", "centralWidgetWindow", "" , "{z up}")
	; MouseMove(737, 800, 1)
	;MouseUp("left")
EndFunc

Func normal_click_second()
	Sleep(250)
	ControlSend("NoxPlayer", "centralWidgetWindow", "" , "x")
	; MouseClick("left", 872, 800, 1)
EndFunc ;

Func hold_click_second()
	Sleep(250)
	ControlSend("NoxPlayer", "centralWidgetWindow", "" , "{x down}")
	; MouseMove(872, 800, 1)
	;MouseDown("left")
EndFunc

Func unclick_second()
	Sleep(250)
	ControlSend("NoxPlayer", "centralWidgetWindow", "" , "{x up}")
	; MouseMove(872, 800, 1)
	;MouseUp("left")
EndFunc

Func normal_click_third()
	Sleep(250)
	ControlSend("NoxPlayer", "centralWidgetWindow", "" , "c")
	; MouseClick("left", 1007, 800, 1)
EndFunc ;

Func hold_click_third()
	Sleep(250)
	ControlSend("NoxPlayer", "centralWidgetWindow", "" , "{c down}")
	; MouseMove(1007, 800, 1)
	;MouseDown("left")
EndFunc

Func unclick_third()
	Sleep(250)
	ControlSend("NoxPlayer", "centralWidgetWindow", "" , "{c up}")
	; MouseMove(1007, 800, 1)
	;MouseUp("left")
EndFunc

Func normal_click_four()
	Sleep(250)
	ControlSend("NoxPlayer", "centralWidgetWindow", "" , "v")
	; MouseClick("left", 1141, 800, 1)
EndFunc ;

Func hold_click_four()
	Sleep(250)
	ControlSend("NoxPlayer", "centralWidgetWindow", "" , "{v down}")
	; MouseMove(1141, 800, 1)
	;MouseDown("left")
EndFunc

Func unclick_four()
	Sleep(250)
	ControlSend("NoxPlayer", "centralWidgetWindow", "" , "{v up}")
	; MouseMove(1141, 800, 1)
	;MouseUp("left")
EndFunc






;~ DEBUG!!!


Func msgboxx()
   Send("hah")

   MouseClick("left", 11, 801)
   Send("nice")
   MsgBox(0, "Thread example", "Hey, I am a thread!")
   MouseClick("left", 740, 801)
EndFunc


Func call_th()
   $f11=0
   $f12=0
   $hThread = _AuThread_StartThread("msgboxx")
EndFunc;


Func delayed_click()
   ConsoleWrite  ("Normal click" & @LF)
   Sleep(200)
;~    Send("z")
   Send("{z down}")
   Sleep(200)
   Send("{z up}")
;~    MouseClick("left", 740, 801, 1)
EndFunc

Func delayed_holdclick()
   ConsoleWrite  ("Click and hold" & @LF)
   Sleep(200)
   Send("{z down}")
EndFunc

Func delayed_unclick()
   ConsoleWrite  ("UNclick" & @LF)
   Sleep(200)
   Send("{z up}")
EndFunc