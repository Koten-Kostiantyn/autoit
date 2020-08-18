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
   $fcolor = PixelGetColor(737, 173)
   Return $fcolor
EndFunc;

Func pixelget2()
   $fcolor = PixelGetColor(872, 173)
   Return $fcolor
EndFunc;

Func pixelget3()
   $fcolor = PixelGetColor(1007, 173)
   Return $fcolor
EndFunc;

Func pixelget4()
   $fcolor = PixelGetColor(1141, 173)
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
	ElseIf $arr_clicked_empty_first.Contains($pixel) Then
		$object = 'clicked_empty'
	Else
		$object = $pixel
	EndIf
Return $object
EndFunc;



Func count_pixel_and_otput_to_console_and_do_action( _
	$button, _ 														;
	$action, _ 														;
	$pixel_in_memory_new, _ 										;0
	$pixel_in_memory_old, _ 										;1
	$new_memory_pixel_counter, _ 									;2
	$old_memory_pixel_counter, _ 									;3
	$click_counter, _ 												;4
	$unclick_counter)												;5

	$current_pixel_state = get_current_pixel_state($button)
	Local $click_counter_array[2] = [$click_counter,$unclick_counter]

	If $current_pixel_state = $pixel_in_memory_new Then
		$new_memory_pixel_counter = $new_memory_pixel_counter + 1
	Else
		$pixel_in_memory_new = $current_pixel_state
		$new_memory_pixel_counter = 0
	EndIf

	If $new_memory_pixel_counter > 5 Then

		If $pixel_in_memory_old = $pixel_in_memory_new Then
			$old_memory_pixel_counter = $old_memory_pixel_counter + 1
		Else
			ConsoleWrite  ($button & ": " & $pixel_in_memory_old & " was " & $old_memory_pixel_counter & @LF)
			$click_counter_array = state_change_reaction($pixel_in_memory_new, $pixel_in_memory_old, $button, $action, $click_counter, $unclick_counter)

			$pixel_in_memory_old = $pixel_in_memory_new
			$old_memory_pixel_counter = 5

			ConsoleWrite  ($button & ": " & $pixel_in_memory_new & @LF)
		EndIf
	EndIf


	$new_memory_pixel_counter = $new_memory_pixel_counter + 1


	; Now transform vars to array so we can return that values (IDK any other solution)
	Local $func_array[6]
	$func_array[0] = $pixel_in_memory_new
	$func_array[1] = $pixel_in_memory_old
	$func_array[2] = $new_memory_pixel_counter
	$func_array[3] = $old_memory_pixel_counter
	$func_array[4] = $click_counter_array[0]
	$func_array[5] = $click_counter_array[1]
	Return $func_array
EndFunc;


Func state_change_reaction($current_pixel_state, $old_pixel_state, $button, $action, $click_counter, $unclick_counter)
	if ($current_pixel_state <> 'empty_empty' and $current_pixel_state <> 'clicked_empty') and _
	   ($old_pixel_state = 'empty_empty' or $old_pixel_state = 'clicked_empty') Then ; was empty became something
	    If $action Then
			hold_click_action($button)
			$click_counter = $click_counter + 1
		EndIf
		ConsoleWrite  ("! " & @ScriptLineNumber & $button & ": Click and hold, action count = " & $click_counter - 4 & @LF)
	EndIf
	if ($old_pixel_state <> 'empty_empty' and $old_pixel_state <> 'clicked_empty') and _
	   ($current_pixel_state = 'empty_empty' or $current_pixel_state = 'clicked_empty') Then ; was something became empty
	    If $action Then
			unclick_action($button)
			$unclick_counter = $unclick_counter + 1
		EndIf
		ConsoleWrite  ("- " & @ScriptLineNumber & $button & ": UNclick, action count = " & $unclick_counter - 4 & @LF)
	EndIf

	Local $return_array[2]
	$return_array[0] = $click_counter
	$return_array[1] = $unclick_counter
	Return $return_array
EndFunc;


Func loop_all_buttons_and_do_actions_count_and_etc()


	Local $first_func_array[6] = [0,0,0,0,0,0]
	Local $second_func_array[6] = [0,0,0,0,0,0]
	Local $third_func_array[6] = [0,0,0,0,0,0]
	Local $four_func_array[6] = [0,0,0,0,0,0]
	While 1
		$first_func_array = count_pixel_and_otput_to_console_and_do_action(1, True, _
			$first_func_array[0], _
			$first_func_array[1], _
			$first_func_array[2], _
			$first_func_array[3], _
			$first_func_array[4], _
			$first_func_array[5])
		$second_func_array = count_pixel_and_otput_to_console_and_do_action(2, True, _
			$second_func_array[0], _
			$second_func_array[1], _
			$second_func_array[2], _
			$second_func_array[3], _
			$first_func_array[4], _
			$first_func_array[5])
		$third_func_array = count_pixel_and_otput_to_console_and_do_action(3, True, _
			$third_func_array[0], _
			$third_func_array[1], _
			$third_func_array[2], _
			$third_func_array[3], _
			$second_func_array[4], _
			$second_func_array[5])
		$four_func_array = count_pixel_and_otput_to_console_and_do_action(4, True, _
			$four_func_array[0], _
			$four_func_array[1], _
			$four_func_array[2], _
			$four_func_array[3], _
			$third_func_array[4], _
			$third_func_array[5])
		; magic for counters memory goes like 1->2->3->4->1 etc...
		$first_func_array[4] = $four_func_array[4]
		$first_func_array[5] = $four_func_array[5]
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
	Sleep(450)
	ControlSend("NoxPlayer", "centralWidgetWindow", "" , "z")
	; MouseClick("left", 737, 800, 1)
EndFunc ;

Func hold_click_first()
	Sleep(450)
	ControlSend("NoxPlayer", "centralWidgetWindow", "" , "{z down}")
	; MouseMove(737, 800, 1)
	;MouseDown("left")
EndFunc

Func unclick_first()
	Sleep(450)
	ControlSend("NoxPlayer", "centralWidgetWindow", "" , "{z up}")
	; MouseMove(737, 800, 1)
	;MouseUp("left")
EndFunc

Func normal_click_second()
	Sleep(450)
	ControlSend("NoxPlayer", "centralWidgetWindow", "" , "x")
	; MouseClick("left", 872, 800, 1)
EndFunc ;

Func hold_click_second()
	Sleep(450)
	ControlSend("NoxPlayer", "centralWidgetWindow", "" , "{x down}")
	; MouseMove(872, 800, 1)
	;MouseDown("left")
EndFunc

Func unclick_second()
	Sleep(450)
	ControlSend("NoxPlayer", "centralWidgetWindow", "" , "{x up}")
	; MouseMove(872, 800, 1)
	;MouseUp("left")
EndFunc

Func normal_click_third()
	Sleep(450)
	ControlSend("NoxPlayer", "centralWidgetWindow", "" , "c")
	; MouseClick("left", 1007, 800, 1)
EndFunc ;

Func hold_click_third()
	Sleep(450)
	ControlSend("NoxPlayer", "centralWidgetWindow", "" , "{c down}")
	; MouseMove(1007, 800, 1)
	;MouseDown("left")
EndFunc

Func unclick_third()
	Sleep(450)
	ControlSend("NoxPlayer", "centralWidgetWindow", "" , "{c up}")
	; MouseMove(1007, 800, 1)
	;MouseUp("left")
EndFunc

Func normal_click_four()
	Sleep(450)
	ControlSend("NoxPlayer", "centralWidgetWindow", "" , "v")
	; MouseClick("left", 1141, 800, 1)
EndFunc ;

Func hold_click_four()
	Sleep(450)
	ControlSend("NoxPlayer", "centralWidgetWindow", "" , "{v down}")
	; MouseMove(1141, 800, 1)
	;MouseDown("left")
EndFunc

Func unclick_four()
	Sleep(450)
	ControlSend("NoxPlayer", "centralWidgetWindow", "" , "{v up}")
	; MouseMove(1141, 800, 1)
	;MouseUp("left")
EndFunc

